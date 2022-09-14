//
//  CarExpandedView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/10/22.
//

import SwiftUI

struct CarExpandedView: View {
    var car: Car
    
    var body: some View {
        
        VStack (alignment: .leading) {

            if (car.prosList != nil) && (car.prosList!.count > 0) {

                //Pros List
                Text("Pros")
                    .font(.headline)
                
                ForEach (car.prosList!, id: \.self) {pro in
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 5, height: 5)
                        
                        Text(pro)
                    }
                }
            }
     
            if (car.consList != nil) && (car.consList!.count > 0) {
                
                //Cons List
                Text("Cons")
                    .font(.headline)
                
                ForEach (car.consList!, id: \.self) {con in
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 5, height: 5)
                        
                        Text(con)
                    }
                }
            }
        }  
    }
}
