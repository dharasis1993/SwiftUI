//
//  Landmark.swift
//  Landmarks
//
//  Created by dharasis behera on 15/04/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Decodable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var latitude: Double
    var longitude: Double
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category


    private var imageName: String
    
    var image: Image{
        Image(imageName)
    }
   

    var locationCoordinate: CLLocationCoordinate2D {
           CLLocationCoordinate2D(
               latitude: latitude,
               longitude: longitude)
       }
 
    var featureImage: Image? {
            isFeatured ? Image(imageName + "_feature") : nil
        }
    
    enum Category: String, Decodable{
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"
    }

    enum CodingKeys: String, CodingKey {
                case name
                case id = "id"
                case park
                case state
                case description
                case imageName
                case isFavorite = "isFavorite"
                case coordinates = "coordinates"
                case category = "category"
                case isFeatured = "isFeatured"
      }
    enum CoordinatesKeys: String, CodingKey {
        case latitude
        case longitude
    }

    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        park = try values.decode(String.self, forKey: .park)
        state = try values.decode(String.self, forKey: .state)
        description = try values.decode(String.self, forKey: .description)
        imageName = try values.decode(String.self, forKey: .imageName)
        isFavorite = try values.decode(Bool.self, forKey: .isFavorite)
        isFeatured = try values.decode(Bool.self, forKey: .isFeatured)
        category =  try values.decode(Category.self, forKey: .category)

        let location = try values.nestedContainer(keyedBy: CoordinatesKeys.self, forKey: .coordinates)
       latitude = try location.decode(Double.self, forKey: .latitude)
       longitude = try location.decode(Double.self, forKey: .longitude)

    }
}
