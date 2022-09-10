//
//  RatingView.swift
//  CarListing
//
//  Created by Sandi Junker on 9/10/22.
//

import SwiftUI

struct RatingView: View {
    var car: Car
    
    var body: some View {
        
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
            .foregroundColor(.yellow)
        case 2:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
            .foregroundColor(.yellow)
        case 3:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
                Image(systemName: "star")
            }
            .foregroundColor(.yellow)
        case 4:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            .foregroundColor(.yellow)
        case 5:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
            }
            .foregroundColor(.yellow)
        default:
            HStack {
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
            .foregroundColor(.yellow)
        }
    }
}