//
//  ContentView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/5/22.
//

import SwiftUI

struct CarListView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack {
            Text("Car Listing")
                .font(.title)
                .bold()
            
            List(model.cars) {car in
                CarCollapsedView(car: car)
            }
        }
        .background(Color(red: 230/255, green: 230/255, blue: 230/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
            .environmentObject(ContentModel())
    }
}
