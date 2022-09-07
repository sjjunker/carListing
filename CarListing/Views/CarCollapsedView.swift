//
//  CarCollapsedView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/6/22.
//

import SwiftUI

struct CarCollapsedView: View {
    @EnvironmentObject var model: ContentModel
    var car: Car
    
    var body: some View {
        HStack {
            
            //Car Image
            Image(car.image ?? "")
                .resizable()
                .scaledToFit()
                .clipped()
            
            VStack (alignment: .leading) {
                
                //Name
                Text("\(car.make ?? "") \(car.model ?? "")")
                    .font(.title3)
                
                //Price
                Text(model.carPrice(price: car.marketPrice ?? 0))
                    .font(.caption)
                
                Spacer()
                
                //Rating
                switch car.rating {
                case 1:
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                case 2:
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                case 3:
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                case 4:
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                    }
                case 5:
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                    }
                default:
                    HStack {
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                }
            }
            .padding()
        }
    }
}
