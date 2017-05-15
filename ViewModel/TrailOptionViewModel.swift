import Foundation
import Bond
import UIKit

public class TrailOptionViewModel {
    var title = Observable<String>("")
    var length = Observable<String>("")
    var climb = Observable<String>("")
    var image = Observable<UIImage?>(nil)
    
    var trailOption = TrailOption() {
        didSet {
            title.value = trailOption.title
            length.value = "Distance " + trailOption.lengthInKm.description + " km"
            climb.value = "Climbing " + trailOption.climb.description + " m"
            RemoteImage(imageUrl: trailOption.imageUrl).download().bind(to: image)
        }
    }
}
