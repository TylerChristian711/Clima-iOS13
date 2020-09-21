//
//  WeatherManager.swift
//  Clima
//
//  Created by Lambda_School_Loaner_218 on 9/17/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?id=524901&appid=8a4c73453c47b235b07f377a179b8959&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        preformRequest(urlString: urlString)
    }
    
    func preformRequest(urlString: String) {
        // create URL
        if let url = URL(string: urlString) {
            
            // Create URL session
            let session = URLSession(configuration: .default)
            
            // give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error in handel func \(error!)")
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        
        do {
         let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch {
            print("error decoding JSON data \(error)")
        }
    }
    
    
    
}
