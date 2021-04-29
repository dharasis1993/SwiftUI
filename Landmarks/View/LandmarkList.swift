//
//  LandmarkList.swift
//  Landmarks
//
//  Created by dharasis behera on 16/04/21.
//

import SwiftUI

struct LandmarkList: View {
    
   @ObservedObject var modelData: ModelData
   @State var showFavouriteOnly = false
    
    var filteredLandmark: [Landmark]{
        modelData.landmarks.filter { landmarks in
            !showFavouriteOnly  ||   landmarks.isFavorite
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavouriteOnly) {
                                    Text("Favorites only")
                                }
                ForEach(filteredLandmark) { (landmark)  in
                    NavigationLink(destination:  LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                }
             }
            .navigationTitle("Landmarks")
          }
      }
  }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        let modelTestData = ModelData()
        LandmarkList(modelData: modelTestData)

    }
}
