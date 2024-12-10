//
//  FilterCellView.swift
//  HedonistApp
//
//  Created by Private on 11/15/24.
//

import SwiftUI

struct FilterCellView: View {
    private enum Appearance {
        static let corners: CGFloat = 20
        static let height: CGFloat = 35
    }
    
    let model: FilterCellModel
    
    var body: some View {
        FilterTitle(text: "    # \(model.title)    ")
            .background {
                RoundedRectangle(cornerRadius: Appearance.corners)
                    .foregroundStyle(model.selected ? .accent : .white)
                    .frame(height: Appearance.height)
            }
    }
}
