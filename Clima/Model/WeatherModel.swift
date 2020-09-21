//
//  WeatherModel.swift
//  Clima
//
//  Created by Lambda_School_Loaner_218 on 9/21/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case  500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.rain.fill"
        case 701...717:
            return "cloud.fog.fill"
        case 781:
            return "tornado"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "sun.man.fill"
        }
    }
}


