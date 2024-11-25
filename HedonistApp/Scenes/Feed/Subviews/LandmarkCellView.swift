//
//  FeedCellView.swift
//  HedonistApp
//
//  Created by Private on 11/4/24.
//

import SwiftUI

struct LandmarkCellView: View {
    private enum Appearance {
        static let spacing: CGFloat = 5
        static let padding: CGFloat = 20
        static let radius: CGFloat = 20
        static let height: CGFloat = 180
        static let startPoint: CGFloat = 0.1
        static let endPoint: CGFloat = 1.0
        static let opacity: Double = 0.9
    }
    
    let model: LandmarkCellModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: model.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("Placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(height: Appearance.height)
            .cornerRadius(Appearance.radius)
            .overlay {
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black.opacity(Appearance.opacity)]),
                    startPoint: .init(x: .zero, y: Appearance.startPoint),
                    endPoint: .init(x: .zero, y: Appearance.endPoint)
                )
            }
            
            LazyVStack(alignment: .leading, spacing: Appearance.spacing) {
                CellTitle(text: model.title)
                    .multilineTextAlignment(.leading)
            }
            .foregroundStyle(.white)
            .padding(.all, Appearance.padding)
        }
    }
}

#Preview {
    LandmarkCellView(model: LandmarkCellModel(
        title: "Place title",
        subtitle: "Place subtitle",
        image: "https://i.postimg.cc/MHPyqNFm/tempImageyNo6ZP.avif")
    )
}
