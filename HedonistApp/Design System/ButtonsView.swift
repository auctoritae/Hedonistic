//
//  ButtonsView.swift
//  HedonistApp
//
//  Created by Private on 11/14/24.
//

import SwiftUI

struct ButtonsView: View {
    private enum Appearance {
        static let padding: CGFloat = 20
    }
    
    var body: some View {
        LazyVStack(spacing: Appearance.padding) {
            IconButtonView(model: IconButtonModel(icon: Icons.xmark, action: {}))
            IconButtonView(model: IconButtonModel(icon: Icons.bookmark, action: {}))
            IconButtonView(model: IconButtonModel(icon: Icons.call, action: {}))
        }
    }
}

struct IconButtonModel {
    let icon: String
    let action: () -> Void
}

struct IconButtonView: View {
    private enum Appearance {
        static let radius: CGFloat = 20
    }

    var model: IconButtonModel
    
    var body: some View {
        Button(action: model.action) {
            Image(systemName: model.icon)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .shadow(color: .black, radius: Appearance.radius)
        }
    }
}

#Preview {
    ButtonsView()
}
