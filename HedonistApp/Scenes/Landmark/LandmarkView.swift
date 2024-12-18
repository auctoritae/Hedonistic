//
//  LandmarkView.swift
//  HedonistApp
//
//  Created by Private on 11/4/24.
//

import SwiftUI

struct LandmarkView: View {
    private enum Appearance {
        static let endPoint: CGFloat = 0.85
        static let padding: CGFloat = 20
        static let height: CGFloat = 450
    }
    
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingAlert: Bool = false
    var store: LandmarkStore
    
    var body: some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: store.state.landmark.image ?? "")) { image in
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
                    icon: store.state.bookmarked ?? false ? "bookmark.fill" : "bookmark",
                    action: {
                        guard let _ = store.state.bookmarked else { return }
                        store.dbAction()
                }))
                
                IconButtonView(model: IconButtonModel(icon: "iphone.and.arrow.right.inward", action: {
                    call(phone: store.state.landmark.phone)
                }))
                .alert(ErrorTitles.phone, isPresented: $isShowingAlert) {} message: {
                    Text(ErrorDescription.phone)
                }
            }
            .padding(.all, Appearance.padding)
            
            VStack(alignment: .leading, spacing: Appearance.padding) {
                Spacer()
                PrimaryTitle(text: store.state.landmark.name ?? "")
                CustomDescription(text: store.state.landmark.descript ?? "")
                CustomDescription(text: store.state.landmark.workhours ?? "")
                    .italic()
            }
            .padding(.all, Appearance.padding)
        }
        .foregroundStyle(.white)
        .navigationBarBackButtonHidden()
        .onAppear {
            store.fetchData()
        }
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
