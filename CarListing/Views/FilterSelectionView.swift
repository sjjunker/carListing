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
    @State var makeSelection: [String] = []
    @State var modelSelection: [String] = []
    @State var ratingSelection: [Int] = []
    
    var body: some View {
        VStack {
            
            //Filters
            HStack {
                
                //MARK: Make
                VStack {
                    Text("Make")
                    
                    List (model.cars) {car in
                        
                        HStack {
                            
                            Button {
                                
                                
                                if car.make != nil {
                                    
                                    //Add a make filter
                                    if !(makeSelection.contains(car.make!)) {
                                        
                                        makeSelection.append(car.make!)
                                        
                                        //Remove a make Filter
                                    } else if makeSelection.contains(car.make!) {
                                        
                                        let index = makeSelection.firstIndex(of: car.make!)
                                        makeSelection.remove(at: index!)
                                        
                                    }
                                }
                                
                            } label: {
                                
                                if car.make != nil {
                                    
                                    //Check the box if the filter is selected
                                    if makeSelection.contains(car.make!) {
                                        Image(systemName: "checkmark.square")
                                        
                                        //Uncheck the box if the filter is unselected
                                    } else {
                                        Image(systemName: "square")
                                    }
                                }
                            }
                            
                            
                            //List Available makes
                            Text(car.make ?? "" )
                            
                        }
                    }
                }
                
                //MARK: Model
                VStack {
                    
                    Text("Model")
                    
                    ForEach (model.cars) {car in
                        
                        HStack {
                            
                            Button {
                                
                                
                                if car.model != nil {
                                    
                                    //Add a model filter
                                    if !(modelSelection.contains(car.model!)) {
                                        
                                        modelSelection.append(car.model!)
                                        
                                        //Remove a model Filter
                                    } else if modelSelection.contains(car.model!) {
                                        
                                        let index = modelSelection.firstIndex(of: car.model!)
                                        modelSelection.remove(at: index!)
                                        
                                    }
                                }
                                
                            } label: {
                                
                                if car.model != nil {
                                    
                                    //Check the box if the filter is selected
                                    if modelSelection.contains(car.model!) {
                                        Image(systemName: "checkmark.square")
                                        
                                        //Uncheck the box if the filter is unselected
                                    } else {
                                        Image(systemName: "square")
                                    }
                                }
                            }
                            
                            //List Available makes
                            Text(car.model ?? "" )
                            
                        }
                    }
                }
                
                //MARK: Rating
                VStack {
                    
                    Text("Rating")
                    
                    //TODO: Toggle Selection
                    
                    //List Ratings
                    List (ratingsList, id: \.self) {rating in
                        
                        HStack {
                            
                            Button {
                                
                                //Check whether the rating has been selected as a filter
                                if !(ratingSelection.contains(rating)) {
                                    
                                    //Add the filter
                                    ratingSelection.append(rating)
                                    
                                } else if ratingSelection.contains(rating) {
                                    
                                    //Remove the filter
                                    let index = ratingSelection.firstIndex(of: rating)
                                    if index != nil {
                                        ratingSelection.remove(at: index!)
                                    }
                                    
                                }
                                    
                                } label: {
                                    
                                    //Show checked or unchecked according to filter selection
                                    if ratingSelection.contains(rating) {
                                        Image(systemName: "checkmark.square")
                                    } else {
                                        Image(systemName: "square")
                                    }
                                }
                            
                            //Ratings
                            RatingView(rating: rating)
                        }
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

