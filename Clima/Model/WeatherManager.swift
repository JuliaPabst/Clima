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
                    let dataString = String(data: safeData, encoding: .utf8)
                }
                
            }
            task.resume()
        }
    }
    
    
}