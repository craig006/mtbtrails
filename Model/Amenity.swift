import Foundation
import SwiftyJSON

struct Amenity: Deserializable {

    init(title: String, blurb: String) {
    }

    init(json: JSON) {
        title = json["name"].string ?? ""
        blurb = json["description"].string ?? ""
    }

    var title = ""
    var blurb = ""
}
