//
//  LandmarkView.swift
//  HedonistApp
//
//  Created by Private on 11/4/24.
//

import SwiftUI

struct LandmarkView: View {
    private enum Appearance {
        static let endPoint: CGFloat = 0.8
        static let padding: CGFloat = 20
        static let height: CGFloat = 400
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("Placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .containerRelativeFrame(.horizontal)
                .frame(height: Appearance.height)
                .edgesIgnoringSafeArea(.top)
                .overlay {
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .black]),
                        startPoint: .init(x: .zero, y: .zero),
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
                
                LandmarkTitle(text: "Place title")
                LandmarkDescription(text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
                LandmarkDescription(text: "Mon - Sat, 9AM - 5PM")

                Spacer()
            }
            .padding(.all, Appearance.padding)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    LandmarkView()
}
