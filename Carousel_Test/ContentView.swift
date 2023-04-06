//
//  ContentView.swift
//  Carousel_Test
//
//  Created by Robin Ellingsen on 2023-04-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            makeHorizontalScroll()
            CardView(title: "Hej", image: "boba")
        }
        .padding()
    }
}

extension ContentView {
    private func makeHorizontalScroll() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(0 ..< 10) { _ in
                    yodaCard()
                }
            }
            .padding()
        }
    }

    private func yodaCard() -> some View {
        Image("yoda")
            .resizable()
            .aspectRatio(2 / 1, contentMode: .fit)
            .cornerRadius(25)
            .frame(width: 255)
            .padding(5)
            .shadow(radius: 5)
    }
}

struct CardView: View {
    var title: String
    var image: String

    var body: some View {
        ForEach(0..<10) { _ in
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, .clear, .clear,.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        .mask(Rectangle())  
                    )
                Text(title)
                    .font(.title)
                    .padding()
                Spacer()
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()

        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
