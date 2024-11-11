//
//  LandmarkView.swift
//  HedonistApp
//
//  Created by Private on 11/4/24.
//

import SwiftUI

struct LandmarkView: View {
    private enum Appearance {
        static let startPoint: CGFloat = 0.2
        static let endPoint: CGFloat = 1.0
        static let padding: CGFloat = 20
        static let height: CGFloat = 450
    }
    
    let model: Landmark
    
    var body: some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: model.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("Placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(height: Appearance.height)
            .containerRelativeFrame(.horizontal)
            .edgesIgnoringSafeArea(.top)
            .overlay {
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black]),
                    startPoint: .init(x: .zero, y: Appearance.startPoint),
                    endPoint: .init(x: .zero, y: Appearance.endPoint)
                )
            }
            
            HStack(alignment: .center, spacing: Appearance.padding) {
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "phone.arrow.up.right.fill")
                }
            }
            .padding(.all, Appearance.padding)
            
            VStack(alignment: .leading, spacing: Appearance.padding) {
                Spacer()
                LandmarkTitle(text: model.name ?? "")
                LandmarkDescription(text: model.descript ?? "")
                LandmarkDescription(text: model.workhours ?? "")
                    .italic()
            }
            .padding(.all, Appearance.padding)
        }
        .foregroundStyle(.white)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LandmarkView(model: Landmark(
        category: "landmarks",
        name: "Acropolis and The Rock",
        address: nil,
        lat: 37.9715,
        long: 23.7257,
        descript: "The Acropolis of Athens and its monuments are universal symbols of the classical spirit and civilization and form the greatest architectural and artistic complex bequeathed by Greek Antiquity to the world. An exceptional group of artists put into effect the ambitious plans of Athenian statesman Pericles and, under the inspired guidance of the sculptor Pheidias, transformed the rocky hill into a unique monument of thought and the arts.",
        phone: "+302103214172",
        workhours: "8 AM - 8 PM",
        image: "https://github.com/auctoritae/hsource/blob/main/zappeion.jpg?raw=true")
    )
}
