//
//  FilterSelectionView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/14/22.
//

import SwiftUI

struct FilterSelectionView: View {
    
    @EnvironmentObject var model: ContentModel
    @Binding var filteredCars: [Car]
    @Binding var isHidden: Bool
    
    var ratingsList = [1, 2, 3, 4, 5]
    
    var body: some View {
        
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
            
            VStack {
                
                //MARK: Make
                VStack {
                    Text("Make")
                    
                    List (model.cars) {car in
                        
                        HStack {
                            
                            Button {
                                
                                if car.make != nil {
                                    
                                    //Add a make filter if it was not already selected
                                    if !(model.makeSelection.contains(car.make!)) {
                                        
                                        model.makeSelection.append(car.make!)
                                        
                                        //Remove a make Filter if the checkbox was already selected
                                    } else if model.makeSelection.contains(car.make!) {
                                        
                                        let index = model.makeSelection.firstIndex(of: car.make!)
                                        model.makeSelection.remove(at: index!)
                                        
                                    }
                                }
                                
                                //Re-filter the filtered car array
                                filteredCars = self.filterList()
                                
                            } label: {
                                
                                if car.make != nil {
                                    
                                    //Check the box if the filter is selected
                                    if model.makeSelection.contains(car.make!) {
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
                    .listStyle(PlainListStyle())
                }
                
                //MARK: Model
                VStack {
                    
                    Text("Model")
                    
                    List (model.cars) {car in
                        
                        HStack {
                            
                            Button {
                                
                                
                                if car.model != nil {
                                    
                                    //Add a model filter
                                    if !(model.modelSelection.contains(car.model!)) {
                                        
                                        model.modelSelection.append(car.model!)
                                        
                                        
                                        //Remove a model Filter
                                    } else if model.modelSelection.contains(car.model!) {
                                        
                                        let index = model.modelSelection.firstIndex(of: car.model!)
                                        model.modelSelection.remove(at: index!)
                                        
                                    }
                                    
                                    //Re-filter the filtered car array
                                    filteredCars = self.filterList()
                                }
                                
                            } label: {
                                
                                if car.model != nil {
                                    
                                    //Check the box if the filter is selected
                                    if model.modelSelection.contains(car.model!) {
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
                    .listStyle(PlainListStyle())
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
                                if !(model.ratingSelection.contains(rating)) {
                                    
                                    //Add the filter
                                    model.ratingSelection.append(rating)
                                    
                                } else if model.ratingSelection.contains(rating) {
                                    
                                    //Remove the filter
                                    let index = model.ratingSelection.firstIndex(of: rating)
                                    if index != nil {
                                        model.ratingSelection.remove(at: index!)
                                    }
                                }
                                
                                //Re-filter the filtered car array
                                filteredCars = self.filterList()
                                
                            } label: {
                                
                                //Show checked or unchecked according to filter selection
                                if model.ratingSelection.contains(rating) {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                            }
                            
                            //Ratings
                            RatingView(rating: rating)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                //MARK: Preview filtered list of cars
                VStack {
                    Text("Preview")
                    
                    List (filteredCars) {car in
                        HStack {
                            Text(car.make ?? "")
                            Text(car.model ?? "")
                            Spacer()
                            RatingView(rating: car.rating ?? 0)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                HStack {
                    
                    //MARK: Clear Filters
                    Button ("Clear Filters") {
                        
                        //Clear the filters
                        model.makeSelection.removeAll()
                        model.modelSelection.removeAll()
                        model.ratingSelection.removeAll()
                        
                        //Reset the fliteredCars array
                        filteredCars = model.cars
                    }
                    
                    Spacer()
                    
                    //MARK: Return to Car List
                    Button ("Apply") {
        
                        //Create animation and go back to CarListView
                        withAnimation {
                            isHidden = true
                        }
                    }
                }
            }
        }
    }
    
    //Return a new filtered array of cars
    func filterList () -> [Car] {
        
        //All filters
        if !model.makeSelection.isEmpty && !model.modelSelection.isEmpty && !model.ratingSelection.isEmpty {
            
            return model.cars.filter( {model.makeSelection.contains($0.make!) && model.modelSelection.contains($0.model!) && model.ratingSelection.contains($0.rating!)})
            
            //No make filter
        } else if model.makeSelection.isEmpty && !model.modelSelection.isEmpty && !model.ratingSelection.isEmpty {
            
            return model.cars.filter( {model.modelSelection.contains($0.model!) && model.ratingSelection.contains($0.rating!)})
            
            //No model filter
        } else if !model.makeSelection.isEmpty && model.modelSelection.isEmpty && !model.ratingSelection.isEmpty {
            
            return model.cars.filter( {model.makeSelection.contains($0.make!) && model.ratingSelection.contains($0.rating!)})
            
            //No rating filter
        } else if !model.makeSelection.isEmpty && !model.modelSelection.isEmpty && model.ratingSelection.isEmpty {
            
            return model.cars.filter( {model.makeSelection.contains($0.make!) && model.modelSelection.contains($0.model!)})
            
            //Only rating filter
        } else if model.makeSelection.isEmpty && model.modelSelection.isEmpty && !model.ratingSelection.isEmpty {
            
            return model.cars.filter( {model.ratingSelection.contains($0.rating!)})
            
            //Only model filter
        } else if model.makeSelection.isEmpty && !model.modelSelection.isEmpty && model.ratingSelection.isEmpty {
            
            return model.cars.filter( {model.modelSelection.contains($0.model!)})
            
            //Only make filter
        } else if !model.makeSelection.isEmpty && model.modelSelection.isEmpty && model.ratingSelection.isEmpty {
            
            return model.cars.filter( {model.makeSelection.contains($0.make!)})
            
            //No filters
        } else {
            
            return model.cars
        }
    }
}
