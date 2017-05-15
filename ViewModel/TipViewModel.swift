import Foundation
import Bond

public class TipViewModel {
    var image = Observable<UIImage?>(nil)
    var label = Observable<String>("")
    
    var tip = Tip() {
        didSet {
            image.value = tip.image
            label.value = tip.label ?? ""
        }
    }
}
