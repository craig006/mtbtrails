import Foundation
import UIKit
import SnapKit

class TipView: UIView {
    
    var label: UILabel = UILabel()
    var image: UIImageView = UIImageView()
    var viewmodel = TipViewModel();
    
    init() {
        super.init(frame: CGRect.zero)
        createSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        viewmodel.image.bind(to: image)
        image.contentMode = .scaleAspectFit
        addSubview(image)
        image.snp.makeConstraints { make -> Void in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(10)
        }
        
        viewmodel.label.bind(to: label)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = Appfont.descriptionFont()
        addSubview(label)
        label.snp.makeConstraints { make -> Void in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
        }
    }
}
