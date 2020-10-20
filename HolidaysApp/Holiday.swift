//
//  Holiday.swift
//  HolidaysApp
//
//  Created by Emina Mesic on 20/10/2020.
//

import Foundation

struct HolidayResponse:Decodable {
    var response: Holidays
}
struct Holidays: Decodable {
    var holidays: [HolidayDetail]
}
struct HolidayDetail: Decodable {
    var name:String
    var date:DateInfo
}
struct DateInfo: Decodable {
    var iso: String
}
