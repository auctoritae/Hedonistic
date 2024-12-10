//
//  FontsView.swift
//  HedonistApp
//
//  Created by Private on 11/6/24.
//

import SwiftUI

struct FontsView: View {
    private enum Appearance {
        static let padding: CGFloat = 20
    }
    
    private let mock: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: Appearance.padding) {
            PrimaryTitle(text: mock)
            CellTitle(text: mock)
            FilterTitle(text: mock)
            CustomDescription(text: mock)
        }
        .padding(Appearance.padding)
    }
}

#Preview {
    FontsView()
}


struct FilterTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .bold()
            .foregroundStyle(.black)
    }
}

struct CellTitle: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title2)
            .fontWeight(.heavy)
    }
}

struct PrimaryTitle: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.largeTitle)
            .fontWeight(.black)
            .multilineTextAlignment(.leading)
    }
}

struct CustomDescription: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.callout)
    }
}
