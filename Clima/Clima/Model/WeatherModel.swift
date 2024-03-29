//
//  WeatherModel.swift
//  Clima
//
//  Created by Julia Pabst on 14.01.24.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200 ... 232, 771: return "cloud.bolt.rain"
        case 300 ... 321: return "cloud.drizzle"
        case 500 ... 531: return "cloud.rain"
        case 600 ... 622: return "cloud.snow"
        case 701 ... 762: return "cloud.fog"
        case 781: return "tornado"
        case 800: return "sun.max"
        case 801: return "cloud.sun"
        case 802 ... 804: return "cloud"
        default: return "cloud"
        }
    }
    
}
