//
//  WeatherData.swift
//  Clima
//
//  Created by Julia Pabst on 14.01.24.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
}

struct Main: Decodable {
    let temp: Double
}
