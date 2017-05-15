import Foundation
import Bond

public class AmenityViewModel {
    var title = Observable<String>("")
    var blurb = Observable<String>("")
    var amenity: Amenity? {
        didSet {
            if let amenity = amenity {
                title.value = amenity.title
                blurb.value = amenity.blurb
            } else {
                title.value = ""
                blurb.value = ""
            }
        }
    }
}