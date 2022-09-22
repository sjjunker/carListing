//
//  ContentView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/5/22.
//
//TODO: Change FilterSelectionView to a drop down
//TODO: Bring in bound filtered array of cars and replace model.cars with it in the List

import SwiftUI

struct CarListView: View {
    @EnvironmentObject var model: ContentModel
    @State var isHidden = true
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    //Filter Drop Down
                    Button ("Filter") {
                        isHidden = false
                    }
                    
                    //List of cars
                    List (model.cars) {car in
                        
                        VStack (alignment: .leading) {
                            
                            HStack {
                                
                                //Car Image
                                Image(car.image ?? "")
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                                    .cornerRadius(10)
                                
                                VStack (alignment: .trailing) {
                                    
                                    //Name
                                    Text("\(car.make ?? "") \(car.model ?? "")")
                                        .font(.headline)
                                    
                                    //Price
                                    Text(model.carPrice(price: car.marketPrice ?? 0))
                                        .font(.caption)
                                    
                                    //Rating
                                    RatingView(rating: car.rating ?? 0)
                                        .padding(.top, 5)
                                    
                                    Spacer()
                                    
                                    //Button to show/hide details
                                    Button  {
                                        if (model.selectedCar != car.id) {
                                            model.selectedCar = car.id
                                        } else {
                                            model.selectedCar = nil
                                        }
                                    } label: {
                                        if (model.selectedCar != car.id) {
                                            Text("Show Details")
                                        } else {
                                            Text("Hide Details")
                                        }
                                    }
                                }
                                .padding()
                            }
                            
                            //Expanded View
                            if car.id == model.selectedCar {
                                CarExpandedView(car: car)
                                    .padding(.bottom)
                            }
                        }
                        .listRowBackground(
                            Rectangle()
                                .fill(Color(red: 230/255, green: 230/255, blue: 230/255))
                                .cornerRadius(10)
                                .padding(5)
                        )
                        .listRowSeparator(.hidden, edges: .all)
                    }
                    .navigationBarTitle("Car Listing")
                }
                
                
                if !isHidden {
                    
                    ZStack {
                        
                        //Show the filters
                        Rectangle()
                        
                        FilterSelectionView(isHidden: $isHidden)
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
            .environmentObject(ContentModel())
    }
}
