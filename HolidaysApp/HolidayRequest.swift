//
//  HolidayRequest.swift
//  HolidaysApp
//
//  Created by Emina Mesic on 20/10/2020.
//

import Foundation

enum HolidayError :Error {
    case noDataAvailable
    case canNotProcessData
}

struct HolidayRequest{
    let resourceURL: URL
    let api_key = "385070242efb458ca54e7b30f3d9ce71c44120f9"
    
    init(countryCode:String) {
        let date  = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        let resourceString = "https://calendarific.com/api/v2/holidays?&api_key=\(api_key)&country=\(countryCode)&year=\(currentYear)"
        guard let resourceURL = URL(string: resourceString) else { fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getHolidays (completion: @escaping(Result<[HolidayDetail], HolidayError>)-> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let holidayResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidayResponse.response.holidays
                completion(.success(holidayDetails))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
