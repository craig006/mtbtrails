import Foundation
import UIKit

class HeaderView : UIView {
    var label = UILabel(frame: CGRect(x: 20, y: 10, width: 135, height: 25))
    var background = UIView(frame: CGRect(x: -15, y: 10, width: 190, height: 25))
    
    init(color: UIColor, text: String) {
        super.init(frame: CGRect.zero)
        label.text = text
        background.backgroundColor = color
        createSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        background.layer.cornerRadius = 3
        background.layer.masksToBounds = true
        addSubview(background)
        
        label.textColor = UIColor.white
        label.font = Appfont.titleFont()
        addSubview(label)
    }
}
