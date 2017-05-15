import Foundation
import UIKit
import MapKit
import CoreLocation
import SwiftyJSON

struct Trail: Deserializable {
    var location = CLLocationCoordinate2D(latitude: -33.803066, longitude: 18.589972)
    
    var imageUrl = "https://cdn.shopify.com/s/files/1/0642/5349/files/P1040244-X2.jpg?4230060222129718308"
    
    var tips = [Tip(image: UIImage(named: "dog"), label: "No trail dogs allowed"),
                Tip(image: UIImage(named: "dog"), label: "No trail dogs allowed"),
                Tip(image: UIImage(named: "dog"), label: "No trail dogs allowed")]
    
    var trailOptions = [TrailOption(title: "Blue route", length: 50000, climb: 450, imageUrl: "https://www.iconexperience.com/_img/v_collection_png/512x512/shadow/sign_stop.png"),
                        TrailOption(title: "Red route", length: 50000, climb: 450, imageUrl: "https://www.iconexperience.com/_img/v_collection_png/512x512/shadow/sign_stop.png"),
                        TrailOption(title: "Black route", length: 50000, climb: 450, imageUrl: "https://www.iconexperience.com/_img/v_collection_png/512x512/shadow/sign_stop.png")]
    
    var amenities = [Amenity(title: "The Dairy Shed", blurb: "A small and awesome coffee shop with outside tables, perfect for a quick coffee and a small bite to eat after a long ride. A small and awesome coffee shop with outside tables, perfect for a quick coffee and a small bite to eat after a long ride. A small and awesome coffee shop with outside tables, perfect for a quick coffee and a small bite to eat after a long ride."),
                     Amenity(title: "This Way Out", blurb: "A small and awesome coffee shop with outside tables, perfect for a quick coffee and a small bite to eat after a long ride.")]

    init() {

    }

    init(json: JSON) {

        if let longitude = json["location"]["longitude"].double,
           let latitude = json["location"]["latitude"].double {
            location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        imageUrl = json["imageurl"].string ?? ""
        amenities = json["amenities"].objectsFromDEntries()
        trails = json[""]
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


