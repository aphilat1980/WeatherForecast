//
//  NetworkManager.swift
//  WeatherNetology
//
//  Created by Александр Филатов on 19.07.2023.
//

import Foundation

class NetworkManager {
    
    var alertCompletion: (()->())?
    
    func downloadWeatherForecast (city: String, completion: @escaping (_ weatherForecast: WeatherForecast?)->()) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=c3258abf5f8c7bec4f1d0bc68ba132ee&units=metric&lang=ru".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlString)!
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) {data, responce, error in
            if let error {
                print (error.localizedDescription)
                self.alertCompletion?()
                return
            }
            
            if (responce as? HTTPURLResponse)?.statusCode != 200 {
                print ("responce != 200")
                self.alertCompletion?()
                return
            }
            
            guard let data else {
                print ("data is nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let item = try decoder.decode(WeatherForecast.self, from: data)
                completion(item)
                
            } catch {
                self.alertCompletion?()
                print (error)
            }
        }
        dataTask.resume()
    }
    
    
    
    
    func downloadDailyWeather (city: City, completion: @escaping (_ weatherDailyForecast: WeatherDailyForecast?)->()) {
        
       let headers = ["X-Yandex-API-Key": "e3e02def-e186-4908-9f6f-584dfca9e50a"]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.weather.yandex.ru/v2/forecast?lat=\(city.lat)&lon=\(city.lon)&hours=false&limit=7&extra=true&lang=tr_TR")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        
        
        
        let dataTask = session.dataTask(with: request as URLRequest) {data, responce, error in
            if let error {
                print (error.localizedDescription)
                self.alertCompletion?()
                return
            }
            
            if (responce as? HTTPURLResponse)?.statusCode != 200 {
                //print(responce.debugDescription)
                print ("responce != 200")
                self.alertCompletion?()
                return
            }
            
            guard let data else {
                print ("data is nil")
                self.alertCompletion?()
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let item = try decoder.decode(WeatherDailyForecast.self, from: data)
                completion(item)
                
            } catch {
                print (error)
            }
        }
        
        dataTask.resume()
    }
    
}
struct WeatherForecast : Decodable {
    
    var city: CityDecodable
    var list: [ListItem]
}

struct CityDecodable: Decodable {
    var name: String
    var coord: Coord
}

struct Coord: Codable {
    let lat, lon: Double
}

struct ListItem: Decodable {
    
    var dt: Int
    var dt_txt: String
    var main: MainClass
    var weather: [WeatherDecodable]
    let wind: Wind
}
 
struct MainClass: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct WeatherDecodable: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}


struct WeatherDailyForecast: Decodable {
    var forecasts: [Forecasts]
}

struct Forecasts: Decodable {
    var date: String
    var date_ts: Int
    var rise_begin: String
    var sunrise: String
    var sunset: String
    var set_end: String
    var moon_text: String
    var parts: Parts
    //var uv_index: Double
}

struct Parts: Decodable {
    var day: Day
    var night: Night
}

struct Day: Decodable {
    var temp_avg: Double
    var temp_min: Double
    var temp_max: Double
    var feels_like: Double
    var icon: String
    var condition: String
    var humidity: Double
    var wind_speed: Double
    var wind_dir: String
    var prec_prob: Double
    var cloudness: Double
    var prec_strength: Double
    //var uv_index: Double
}

struct Night: Decodable {
    var temp_avg: Double
    var temp_min: Double
    var temp_max: Double
    var feels_like: Double
    var icon: String
    var condition: String
    var humidity: Double
    var wind_speed: Double
    var wind_dir: String
    var prec_prob: Double
    var cloudness: Double
    var prec_strength: Double
    //var uv_index: Double
}

