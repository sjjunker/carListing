//
//  FilterSelectionView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/14/22.
//

import SwiftUI

struct FilterSelectionView: View {
    @EnvironmentObject var model: ContentModel
    private var ratingsList = [1, 2, 3, 4, 5]
    
    var body: some View {
        VStack {
            
            //Filters
            HStack {
                
                //Make
                VStack {
                    
                    Text("Make")
                    
                    ForEach (model.cars) {car in
                        
                        HStack {
                            
                            //TODO: Toogle Selection
                            
                            //List Available makes
                            Text(car.make ?? "" )
                            
                        }
                    }
                }
                
                //Model
                VStack {
                    
                    Text("Model")
                    
                    ForEach (model.cars) {car in
                        
                        HStack {
                            
                            //TODO: Toogle Selection
                            
                            //List Available makes
                            Text(car.model ?? "" )
                            
                        }
                    }
                }
                
                //Rating
                VStack {
                    
                    Text("Rating")
                    
                    //TODO: Toggle Selection
                    
                    //List Ratings
                    ForEach (ratingsList, id: \.self) {rating in
                        
                        HStack {
                            
                            //TODO: Toggle selection
                            
                            //Ratings
                            RatingView(rating: rating)
                        }
                    }
                }
            }
            
            //TODO: Preview of filtered results
            //Tiny filtered list of cars
            
            //TODO: Apply Button
            //Goes back to CarListView
            
        }
    }
}
