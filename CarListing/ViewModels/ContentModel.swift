//
//  ContentModel.swift
//  CarListing
//
//  Created by Sandi Junker on 9/6/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @Published var cars = [Car]()
    @Published var selectedCar: UUID?
    
    init() {
        getLocalData()
        
        selectedCar = cars[0].id
    }
    
    //MARK: Parse the Data
    func getLocalData() {
        
        //Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "car_list", withExtension: "json")
        
        //Create a Data object
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            //Try to decode the json into an array of cars
            let jsonDecoder = JSONDecoder()
            
            do {
                let cars = try jsonDecoder.decode([Car].self, from: jsonData)
                
                //Assign ids to each car
                for car in cars {
                    car.id = UUID()
                }
                
                //Assign parsed cars to cars property
                self.cars = cars
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    
    //MARK: Format currency
    func carPrice(price: Double) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        let formattedNumber = numberFormatter.string(from: NSNumber(value: price))
        return formattedNumber ?? ""
        
    }
}
