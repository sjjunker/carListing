//
//  ContentModel.swift
//  CarListing
//
//  Created by Sandi Junker on 9/6/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var cars = [Car]()
    
    func getLocalData() {
        
        //Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "car_list", withExtension: "json")
        
        //Create a Data object
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            //Try to decode the json into an array of cars
            let jsonDecoder = JSONDecoder()
            let cars = try jsonDecoder.decode([Car].self, from: jsonData)
            
            //Assign parsed cars to cars property
            self.cars = cars
            
        } catch {
            print("Couldn't parse local data.")
        }
    }
}
