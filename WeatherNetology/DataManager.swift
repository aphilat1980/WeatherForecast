//
//  DataManager.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 23.07.2023.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    
    //использовал синглтон для работы с массивами погоды и городов
    static let shared = DataManager()
    
    //массив городов
    var cities:[City] = []
    //массив 3 часовой погоды
    var weathers: [Weather] = []
    //массив дневной погоды
    var dailyWeather: [DailyWeather] = []
    //массив текущей погоды - по сути нулевой элемент массива weathers
    var currentWeather: [CurrentWeather] = []
    
    var networkManager = NetworkManager()
    
private var context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    var completionForFirstSection: (()->())?
    var completionForSecondSection: (()->())?
    var completionForThirdSection: (()->())?
    
    
    init () {
        fetchCities()
    }
    
    //функция создания массива городов из coredata
    func fetchCities () {
        let fetchRequest1 = City.fetchRequest()
        cities = (try? context.fetch(fetchRequest1)) ?? []
        completionForFirstSection?()
    }
    
    //функция создания массива 3хчасового прогноза из coredata
    func fetchWeather (city: City) {
        let fetchRequest = Weather.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateSince1970", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "city == %@", city)
        weathers = (try? context.fetch(fetchRequest)) ?? []
        completionForSecondSection?()
    }
    
    //функция создания дневной погоды из coredata
    func fetchDailyWeather (city: City) {
        let fetchRequest = DailyWeather.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateSince1970", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "city == %@", city)
        dailyWeather = (try? context.fetch(fetchRequest)) ?? []
        completionForThirdSection?()
    }
    
    //функция создания массива текущей погоды из coredata
    func fetchCurrentWeather (city: City) {
        let fetchRequest = CurrentWeather.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateSince1970", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "city == %@", city)
        currentWeather = (try? context.fetch(fetchRequest)) ?? []
        completionForFirstSection?()
    }
    
   //функция загрузки с openweathermap
    func loadWeather (city: String, completion: @escaping (_ cityLoaded: City?)->()) {
        
        networkManager.downloadWeatherForecast(city: city) {weatherForecast in
            
            DispatchQueue.main.async {
                //делаю проверку на наличие города в coredata
                var existingCity: City?
                var contains = false
                for city in self.cities {
                    if city.name == weatherForecast?.city.name {
                        existingCity = city
                        contains = true
                    }
                }
                //если город уже есть, то просто обновляем данные и массивы погоды
                if contains == true {
                    //удаляем данные существующие по 3часовой погоде и текущей погоде
                    for weather in (existingCity!.weathers?.sortedArray(using: []) as?[Weather]) ?? [] {
                        self.context.delete(weather)
                        try? self.context.save()
                    }
                    self.context.delete(existingCity!.currentWeather!)
                    try? self.context.save()
                    //создаем новые данные в coredata
                    let currentWeather = CurrentWeather(context: self.context)
                    currentWeather.dateSince1970 = Int64((weatherForecast?.list[0].dt)!)
                    currentWeather.currentCloudness = Int64((weatherForecast?.list[0].clouds.all)!)
                    currentWeather.currentDescription = weatherForecast?.list[0].weather[0].description
                    currentWeather.currentTemperature = (weatherForecast?.list[0].main.temp)!
                    currentWeather.currentMaxTemp = (weatherForecast?.list[0].main.tempMax)!
                    currentWeather.currentMinTemp = (weatherForecast?.list[0].main.tempMin)!
                    currentWeather.currentHumidity = Int64((weatherForecast?.list[0].main.humidity)!)
                    currentWeather.currentWindSpeed = (weatherForecast?.list[0].wind.speed)!
                    currentWeather.currentSunrise = Int64((weatherForecast?.city.sunrise)!)
                    currentWeather.currentSunset = Int64((weatherForecast?.city.sunset)!)
                    currentWeather.city = existingCity
                    
                    for i in weatherForecast!.list {
                        let weather = Weather(context: self.context)
                        weather.date = i.dt_txt
                        weather.dateSince1970 = Int64(i.dt)
                        weather.humidity = Int16(i.main.humidity)
                        weather.tempCurrent = i.main.temp
                        weather.tempFeelsLike = i.main.feelsLike
                        weather.tempMax = i.main.tempMax
                        weather.tempMin = i.main.tempMin
                        weather.weatherDescription = i.weather[0].description
                        weather.weatherIcon = i.weather[0].icon
                        weather.probPrecipitation = i.pop
                        weather.windSpeed = i.wind.speed
                        weather.cloudness = Int64(i.clouds.all)
                        weather.city = existingCity
                    }
                    try? self.context.save()
                    completion(existingCity)
                    
                } else {//если города еще нет в coredata
                    
                    let newCityForecast = City(context: self.context)
                    newCityForecast.name = weatherForecast?.city.name
                    newCityForecast.lat = (weatherForecast?.city.coord.lat)!
                    newCityForecast.lon = (weatherForecast?.city.coord.lon)!
    
                    let currentWeather = CurrentWeather(context: self.context)
                    currentWeather.dateSince1970 = Int64((weatherForecast?.list[0].dt)!)
                    currentWeather.currentCloudness = Int64((weatherForecast?.list[0].clouds.all)!)
                    currentWeather.currentDescription = weatherForecast?.list[0].weather[0].description
                    currentWeather.currentTemperature = (weatherForecast?.list[0].main.temp)!
                    currentWeather.currentMaxTemp = (weatherForecast?.list[0].main.tempMax)!
                    currentWeather.currentMinTemp = (weatherForecast?.list[0].main.tempMin)!
                    currentWeather.currentHumidity = Int64((weatherForecast?.list[0].main.humidity)!)
                    currentWeather.currentWindSpeed = (weatherForecast?.list[0].wind.speed)!
                    currentWeather.currentSunrise = Int64((weatherForecast?.city.sunrise)!)
                    currentWeather.currentSunset = Int64((weatherForecast?.city.sunset)!)
                    currentWeather.city = newCityForecast
                    
                    for i in weatherForecast!.list {
                        let weather = Weather(context: self.context)
                        weather.date = i.dt_txt
                        weather.dateSince1970 = Int64(i.dt)
                        weather.humidity = Int16(i.main.humidity)
                        weather.tempCurrent = i.main.temp
                        weather.tempFeelsLike = i.main.feelsLike
                        weather.tempMax = i.main.tempMax
                        weather.tempMin = i.main.tempMin
                        weather.weatherDescription = i.weather[0].description
                        weather.weatherIcon = i.weather[0].icon
                        weather.probPrecipitation = i.pop
                        weather.windSpeed = i.wind.speed
                        weather.cloudness = Int64(i.clouds.all)
                        weather.city = newCityForecast
                    }
                    try? self.context.save()
                    completion(newCityForecast)
                }
            }
        }
    }
        
//функция загрузки с Яндекс api
    func loadDailyWeather (city: City, completion: @escaping ()->()) {
        
        networkManager.downloadDailyWeather(city: city) {dailyWeather in
            
            DispatchQueue.main.async {
                //удаляем текущие данные
                for weather in (city.dailyWeather?.sortedArray(using: []) as?[DailyWeather]) ?? [] {
                        self.context.delete(weather)
                        try? self.context.save()
                }
                //создаем новые объекты в coredata
                for i in dailyWeather!.forecasts {
                    let dailyWeather = DailyWeather(context: self.context)
                    dailyWeather.date = i.date
                    dailyWeather.dateSince1970 = Int64(i.date_ts)
                    dailyWeather.dayCloudness = i.parts.day.cloudness
                    dailyWeather.dayCondition = i.parts.day.condition
                    dailyWeather.dayFeelsLikeTemp = i.parts.day.feels_like
                    dailyWeather.dayHumidity = i.parts.day.humidity
                    dailyWeather.dayIcon = i.parts.day.icon
                    dailyWeather.dayPrecProb = i.parts.day.prec_prob
                    dailyWeather.dayTempAvg = i.parts.day.temp_avg
                    dailyWeather.dayTempMax = i.parts.day.temp_max
                    dailyWeather.dayTempMin = i.parts.day.temp_min
                    dailyWeather.dayWindDir = i.parts.day.wind_dir
                    dailyWeather.dayWindSpeed = i.parts.day.wind_speed
                    dailyWeather.dayPrecStrengh = i.parts.day.prec_strength
                    dailyWeather.nightCloudness = i.parts.night.cloudness
                    dailyWeather.nightCondition = i.parts.night.condition
                    dailyWeather.nightFeelsLikeTemp = i.parts.night.feels_like
                    dailyWeather.nightHumidity = i.parts.night.humidity
                    dailyWeather.nightIcon = i.parts.night.icon
                    dailyWeather.nightPrecProb = i.parts.night.prec_prob
                    dailyWeather.nightTempAvg = i.parts.night.temp_avg
                    dailyWeather.nightTempMax = i.parts.night.temp_max
                    dailyWeather.nightTempMin = i.parts.night.temp_min
                    dailyWeather.nightWindDir = i.parts.night.wind_dir
                    dailyWeather.nightWindSpeed = i.parts.night.wind_speed
                    dailyWeather.nightPrecStrengh = i.parts.night.prec_strength
                    dailyWeather.rise_begin = i.rise_begin
                    dailyWeather.set_end = i.set_end
                    dailyWeather.sunrise = i.sunrise
                    dailyWeather.sunset = i.sunset
                    dailyWeather.moonText = i.moon_text
                    dailyWeather.city = city
                }
                try? self.context.save()
                completion()
            }
        }
    }
    
    
    //функция удаления объектов из сoredata
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
                try? context.save()
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
    
  
}
