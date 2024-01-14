//
//  WeatherManager.swift
//  Clima
//
//  Created by Julia Pabst on 12.01.24.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=56597bbf24331d29314f4d0f9c28a95c&units=metric"
    
    func fetchWeather (city: String){
        let urlString = "\(weatherURL)&q=\(city)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let condition = getConditionName(id: decodedData.weather[0].id)
            print(condition)
            
        } catch {
            print(error)
        }
    }
    
    func getConditionName(id: Int) -> String {
        switch id {
        case 200 ... 232, 771: return "cloud.bolt.rain"
        case 300 ... 321: return "cloud.drizzle"
        case 500 ... 531: return "cloud.rain"
        case 600 ... 622: return "cloud.snow"
        case 701 ... 762: return "cloud.fog"
        case 781: return "tornado"
        case 800: return "sun.max"
        case 801: return "cloud.sun"
        case 802 ... 804: return "cloud.bolt"
        default: return "cloud"
        }
    }
    
    
}
