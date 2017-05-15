import Foundation
import UIKit
import MapKit
import CoreLocation
import SwiftyJSON

class Trail: Deserializable {
    var id: String?

    var location = CLLocationCoordinate2D(latitude: -33.803066, longitude: 18.589972)
    
    var imageUrl = "https://cdn.shopify.com/s/files/1/0642/5349/files/P1040244-X2.jpg?4230060222129718308"
    
    var tips = [Tip(image: UIImage(named: "dog"), label: "No trail dogs allowed"),
                Tip(image: UIImage(named: "dog"), label: "No trail dogs allowed"),
                Tip(image: UIImage(named: "dog"), label: "No trail dogs allowed")]

    var trailOptions: [TrailOption] = []
    var amenities: [Amenity] = []

    init() {

    }

    required init(json: JSON) {

        if let longitude = json["location"]["longitude"].double,
           let latitude = json["location"]["latitude"].double {
            location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }

        imageUrl = json["imageurl"].string ?? ""
        amenities = json["amenities"].objectsFromDEntries()
        trailOptions = json["trailoptions"].objectsFromDEntries()
    }
}

protocol Deserializable {
    init(json: JSON)
}

extension JSON {
    func singleObject<T: Deserializable>() -> T {
        return T(json: self)
    }

    func objectsFromDEntries<T: Deserializable>() -> [T] {
        return self.map { json in T(json: json.1) }
    }
}


