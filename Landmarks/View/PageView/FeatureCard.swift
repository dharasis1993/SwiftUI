//
//  FeatureCard.swift
//  Landmarks
//
//  Created by dharasis behera on 24/04/21.
//

import SwiftUI

struct FeatureCard: View {
    var landmark : Landmark
    
    var body: some View {
        landmark.featureImage?
                .resizable()
                .scaledToFit()
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
