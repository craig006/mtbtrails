import Foundation
import UIKit

class Line: UIView {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        backgroundColor = AppColor.subtleLight
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        backgroundColor = AppColor.subtleLight
    }
}
