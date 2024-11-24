//
//  LandmarkView.swift
//  HedonistApp
//
//  Created by Private on 11/4/24.
//

import SwiftUI

protocol LandmarkViewDelegate {
    func dbAction(type: FeedDBAction)
}

struct LandmarkView: View {
    private enum Appearance {
        static let endPoint: CGFloat = 0.85
        static let padding: CGFloat = 20
        static let height: CGFloat = 450
    }
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingAlert: Bool = false
    let model: Landmark
    var delegate: LandmarkViewDelegate?
    
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
                    startPoint: .init(x: .zero, y: .zero),
                    endPoint: .init(x: .zero, y: Appearance.endPoint)
                )
            }
            
            HStack(alignment: .center, spacing: Appearance.padding) {
                IconButtonView(model: IconButtonModel(icon: "xmark", action: {
                    dismiss()
                }))
                Spacer()
                
                IconButtonView(model: IconButtonModel(
                    icon: model.bookmarked ? "bookmark.fill" : "bookmark",
                    action: {
                        model.bookmarked ? delegate?.dbAction(type: .delete(model)) : delegate?.dbAction(type: .save(model))
                }))
                
                IconButtonView(model: IconButtonModel(icon: "iphone.and.arrow.right.inward", action: {
                    call(phone: model.phone)
                }))
                .alert(ErrorTitles.phone, isPresented: $isShowingAlert) {} message: {
                    Text(ErrorDescription.phone)
                }
            }
            .padding(.all, Appearance.padding)
            
            VStack(alignment: .leading, spacing: Appearance.padding) {
                Spacer()
                PrimaryTitle(text: model.name ?? "")
                CustomDescription(text: model.descript ?? "")
                CustomDescription(text: model.workhours ?? "")
                    .italic()
            }
            .padding(.all, Appearance.padding)
        }
        .foregroundStyle(.white)
        .navigationBarBackButtonHidden()
    }
    
    
    private func call(phone: String?) {
        if let number = phone?
            .components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            .joined(separator: ""),
           let url = NSURL(string: ("tel:" + "+" + number)) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            
        } else {
            isShowingAlert = true
        }
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
        image: "https://i.postimg.cc/MHPyqNFm/tempImageyNo6ZP.avif",
        bookmarked: false)
    )
}
