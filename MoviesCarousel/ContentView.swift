//
//  ContentView.swift
//  MoviesCarousel
//
//  Created by Ierchenko Anna  on 1/1/22.
//

import SwiftUI

struct ContentView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        let diff = abs(x - 32)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                   
                    ScrollView(.horizontal) {
                        HStack(spacing: 50) {
                            ForEach(0..<20) { num in
                                GeometryReader { proxy in
                                   
                                    NavigationLink (
                                        destination: Image("img1"),
                                        label: {
                                            VStack {
                                            let scale = getScale(proxy: proxy)
                                            
                                                Image("img1")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                )
                                                .clipped()
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                                .scaleEffect(CGSize(width: scale, height: scale))
                                                    .animation(.easeOut(duration: 0.5))
                                            Text("Wonder Woman 1986")
                                                .padding(.top)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(.label))
                                            }
                                    })
                                    }
                                  //  Text(scale.description)
                                    //    .font(.system(size: 30, weight: .bold))
                                       // .scaleEffect(CGSize(width: 2, height: 2))
                                
                                
                                    .frame(width: 125, height: 300)
                            }
                        }.padding(32)
                    }
                }.navigationTitle("Movies Carousel")
            }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
