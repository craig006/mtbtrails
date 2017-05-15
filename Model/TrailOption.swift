import Foundation
import SwiftyJSON

struct TrailOption: Deserializable {
    var title: String = ""
    var length: Int = 0
    var climb: Int = 0
    var imageUrl: String = ""
    
    var lengthInKm: Int {
        get {
            return Int(round(Double(length) / Double(1000)))
        }
    }

    init(title: String, length: Int, climb: Int, imageUrl: String) {
        self.title = title
        self.length = length
        self.climb = climb
        self.imageUrl = imageUrl
    }

    init(json: JSON) {
        title = json["name"].string ?? ""
        length = json["distance"].int ?? 0
        climb = json["climb"].int ?? 0
        imageUrl = json["iconurl"].string ?? ""
    }
}
