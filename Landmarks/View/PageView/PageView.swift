//
//  PageView.swift
//  Landmarks
//
//  Created by dharasis behera on 24/04/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0


    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .padding(.trailing)
                .foregroundColor(.red)


        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
                 .aspectRatio(3 / 2, contentMode: .fit)    }
}
