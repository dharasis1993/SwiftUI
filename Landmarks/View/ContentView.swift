//
//  ContentView.swift
//  Landmarks
//
//  Created by dharasis behera on 15/04/21.
//

import SwiftUI

struct ContentView: View {
   @State private var selection: Tab = .featured

    enum Tab{
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection){
            CategoryHome()
                .tabItem {                     Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList(modelData: ModelData())
                .tabItem {
                     Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        //        VStack {
//            MapView()
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)
//            CircleImage()
//                .offset(y: -130)
//                .padding(.bottom, -130)
//
//            VStack(alignment: .leading) {
//                Text("My Rock")
//                    .font(.title)
//                HStack {
//                    Text("Joshua Tree National Park")
//                        .font(.subheadline)
//                    Spacer()
//                    Text("New Delhi")
//                        .font(.subheadline)
//                    }
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//
//                Divider()
//
//                Text("About Turtle Rock")
//                                   .font(.title2)
//                Text("Descriptive text goes here.")
//            }
//            .padding()
//            Spacer()
//
//        }
        
    
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
        
    }
}
