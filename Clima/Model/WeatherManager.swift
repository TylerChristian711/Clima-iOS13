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
            let task = session.dataTask(with: url, completionHandler: handel(data:respone:error:))
            
            // start the task
            task.resume()
        }
    }
    
    func handel(data: Data?, respone: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print("error in handel func \(error!)")
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print("this is the dataString: \(dataString!)")
        }
    }
    
}
