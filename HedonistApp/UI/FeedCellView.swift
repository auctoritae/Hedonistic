//
//  FeedCellView.swift
//  HedonistApp
//
//  Created by Private on 11/4/24.
//

import SwiftUI

struct FeedCellView: View {
    private enum Appearance {
        static let spacing: CGFloat = 5
        static let padding: CGFloat = 20
        static let radius: CGFloat = 20
        static let height: CGFloat = 220
        static let startPoint: CGFloat = 0.1
        static let endPoint: CGFloat = 1.0
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("Placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black]),
                startPoint: .init(x: .zero, y: Appearance.startPoint),
                endPoint: .init(x: .zero, y: Appearance.endPoint)
            )
            
            LazyVStack(alignment: .leading, spacing: Appearance.spacing) {
                CellTitle(text: "Place title")
                CellSubtitle(text: "Place subtitle")
            }
            .foregroundStyle(.white)
            .padding(.all, Appearance.padding)
        }
        .frame(height: Appearance.height)
        .cornerRadius(Appearance.radius)
        .shadow(radius: Appearance.radius)
    }
}

#Preview {
    FeedCellView()
}
