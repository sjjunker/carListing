//
//  FilterSelectionView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/14/22.
//

import SwiftUI

struct FilterSelectionView: View {
    @EnvironmentObject var model: ContentModel
    var ratingsList = [1, 2, 3, 4, 5]
    @State var makeSelection: [String] = []
    @State var modelSelection: [String] = []
    @State var ratingSelection: [Int] = []
    @Binding var isHidden: Bool
    @State var filteredCars: [Car] = []
    
    var body: some View {
        
        
        VStack {
            
            //MARK: Make
            VStack {
                Text("Make")
                
                List (model.cars) {car in
                    
                    HStack {
                        
                        Button {
                            
                            
                            if car.make != nil {
                                
                                //Add a make filter if it was not already selected
                                if !(makeSelection.contains(car.make!)) {
                                    
                                    makeSelection.append(car.make!)
                                    
                                    //Remove a make Filter if the checkbox was already selected
                                } else if makeSelection.contains(car.make!) {
                                    
                                    let index = makeSelection.firstIndex(of: car.make!)
                                    makeSelection.remove(at: index!)
                                    
                                }
                            }
                            
                            //Re-filter the filtered car array
                            filteredCars = self.filterList()
                            
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
                .padding(.horizontal, -20)
            }
            
            //MARK: Model
            VStack {
                
                Text("Model")
                
                List (model.cars) {car in
                    
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
                                
                                //Re-filter the filtered car array
                                filteredCars = self.filterList()
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
                .padding(.horizontal, -20)
            }
            
            //MARK: Rating
            VStack {
                
                Text("Rating")
                
                //Toggle Selection
                
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
                            
                            //Re-filter the filtered car array
                            filteredCars = self.filterList()
                            
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
                .padding(.horizontal, -20)
            }
            
            //Preview filtered list of cars
            List (filteredCars) {car in
                HStack {
                    Text(car.model ?? "")
                    Text(car.make ?? "")
                    RatingView(rating: car.rating ?? 0)
                }
            }
            
            //MARK: Return to Car List
            Button ("Apply") {
                isHidden = true
            }
        }
        .onAppear(perform: {
            if filteredCars.isEmpty {
                filteredCars = model.cars
            }
        })
    }
    
    //Return a new filtered array of cars
    func filterList () -> [Car] {
        
        //All filters
        if !makeSelection.isEmpty && !modelSelection.isEmpty && !ratingSelection.isEmpty {
            
            return model.cars.filter( {makeSelection.contains($0.make!) && modelSelection.contains($0.model!) && ratingSelection.contains($0.rating!)})
            
            //No make filter
        } else if makeSelection.isEmpty && !modelSelection.isEmpty && !ratingSelection.isEmpty {
            
            return model.cars.filter( {modelSelection.contains($0.model!) && ratingSelection.contains($0.rating!)})
            
            //No model filter
        } else if !makeSelection.isEmpty && modelSelection.isEmpty && !ratingSelection.isEmpty {
            
            return model.cars.filter( {makeSelection.contains($0.make!) && ratingSelection.contains($0.rating!)})
            
            //No rating filter
        } else if !makeSelection.isEmpty && !modelSelection.isEmpty && ratingSelection.isEmpty {
            
            return model.cars.filter( {makeSelection.contains($0.make!) && modelSelection.contains($0.model!)})
            
            //Only rating filter
        } else if makeSelection.isEmpty && modelSelection.isEmpty && !ratingSelection.isEmpty {
            
            return model.cars.filter( {ratingSelection.contains($0.rating!)})
            
            //Only model filter
        } else if makeSelection.isEmpty && !modelSelection.isEmpty && ratingSelection.isEmpty {
            
            return model.cars.filter( {modelSelection.contains($0.model!)})
            
            //Only make filter
        } else if !makeSelection.isEmpty && modelSelection.isEmpty && ratingSelection.isEmpty {
            
            return model.cars.filter( {makeSelection.contains($0.make!)})
            
            //No filters
        } else {
            
            return model.cars
            
        }
    }
}
