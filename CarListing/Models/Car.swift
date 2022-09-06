//
//  Car.swift
//  CarListing
//
//  Created by Sandi Junker on 9/6/22.
//

import Foundation

struct Car: Decodable {
    
    var image: String?
    var consList: [String]?
    var customerPrice: Double?
    var make: String?
    var marketPrice: Double?
    var model: String?
    var prosList: [String]?
    var rating: Int?
    
}
