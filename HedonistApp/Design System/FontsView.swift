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
            LandmarkTitle(text: mock)
            CellTitle(text: mock)
            FilterTitle(text: mock)
            LandmarkDescription(text: mock)
            CellSubtitle(text: mock)
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

struct CellSubtitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}

struct LandmarkTitle: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct LandmarkDescription: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.callout)
    }
}
