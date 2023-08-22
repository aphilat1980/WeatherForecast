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
    
    static let shared = DataManager()
    
    var cities:[City] = []
    var weathers: [Weather] = []
    var dailyWeather: [DailyWeather] = []
    var networkManager = NetworkManager()
    
private var context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    var completionForFirstSection: (()->())?
    var completionForSecondSection: (()->())?
    var completionForThirdSection: (()->())?
    


    //var postsUpdate: (()-> ())? //передача во вью состояния при сохранении поста
    //var postDublicate: (()->())? //передача во вью состояния при дублировании поста

    init () {
        fetchCities()
    }
    
    
    func fetchCities () {
        
        let fetchRequest1 = City.fetchRequest()
        cities = (try? context.fetch(fetchRequest1)) ?? []
       completionForFirstSection?()
        
    }
    
    func fetchWeather (city: City) {
        
        let fetchRequest = Weather.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateSince1970", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "city == %@", city)
        weathers = (try? context.fetch(fetchRequest)) ?? []
        completionForSecondSection?()
        //completionForThirdSection?()
        
    }
    
    
    func fetchDailyWeather (city: City) {
        
        let fetchRequest = DailyWeather.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "dateSince1970", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "city == %@", city)
        dailyWeather = (try? context.fetch(fetchRequest)) ?? []
        //completionForSecondSection?()
        completionForThirdSection?()
        
        
    }
    
   
    
    
    func loadWeather (city: String, completion: @escaping (_ cityLoaded: City?)->()) {
        
        networkManager.downloadWeatherForecast(city: city) {weatherForecast in
            
            DispatchQueue.main.async {
                var existingCity: City?
                var contains = false
                for city in self.cities {
                    if city.name == weatherForecast?.city.name {
                        existingCity = city
                        /*for weather in (existingCity.weathers?.sortedArray(using: []) as?[Weather]) ?? [] {
                            self.context.delete(weather)
                            try? self.context.save()
                        }*/
                        contains = true
                    }
                }
                
                if contains == true {
                    print ("такой город есть")
                    for weather in (existingCity!.weathers?.sortedArray(using: []) as?[Weather]) ?? [] {
                        self.context.delete(weather)
                        try? self.context.save()
                    }
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
                        weather.city = existingCity
                        //print(weather.city?.name)
                    }
                    try? self.context.save()
                    completion(existingCity)
                    //self.fetchCities()
                    //self.fetchWeather(city: existingCity!)
                
                    
                    
                } else {
                    
                    let newCityForecast = City(context: self.context)
                    newCityForecast.name = weatherForecast?.city.name
                    newCityForecast.lat = (weatherForecast?.city.coord.lat)!
                    newCityForecast.lon = (weatherForecast?.city.coord.lon)!
                    newCityForecast.currentTemp = (weatherForecast?.list[0].main.temp)!
                    newCityForecast.currentMaxTemp = (weatherForecast?.list[0].main.tempMax)!
                    newCityForecast.currentMinTemp = (weatherForecast?.list[0].main.tempMin)!
                    newCityForecast.currentDescription = (weatherForecast?.list[0].weather[0].description)!
                    newCityForecast.currentHumidity = Int16((weatherForecast?.list[0].main.humidity)!)
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
                        weather.city = newCityForecast
                        //print(weather.city?.name)
                    }
                    try? self.context.save()
                    completion(newCityForecast)
                    //self.fetchCities()
                    //self.fetchWeather(city: newCityForecast)
                    
                }
            }
        }
        
    }
        

    func loadDailyWeather (city: City, completion: @escaping ()->()) {
        
        networkManager.downloadDailyWeather(city: city) {dailyWeather in
            
            DispatchQueue.main.async {
                //delete current data
                for weather in (city.dailyWeather?.sortedArray(using: []) as?[DailyWeather]) ?? [] {
                        self.context.delete(weather)
                        try? self.context.save()
                }
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
                //if DataManager.shared.cities.count == 1 {
                //self.fetchDailyWeather(city: city)
                //}
                completion()
            }
        }
    }
    
    
    
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
