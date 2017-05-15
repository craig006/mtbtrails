import Foundation

struct TrailOption {
    var title: String = ""
    var length: Int = 0
    var climb: Int = 0
    var imageUrl: String = ""
    
    var lengthInKm: Int {
        get {
            return Int(round(Double(length) / Double(1000)))
        }
    }
}
