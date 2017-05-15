import Foundation
import UIKit
import SnapKit
import Bond

class AmenityView: UIView {
    var viewModel = AmenityViewModel()
    var title = UILabel()
    var blurb = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        title.font = Appfont.titleFont()
        title.textColor = UIColor.black
        viewModel.title.bind(to: title)
        addSubview(title)
        title.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(13)
        }
        
        blurb.font = Appfont.descriptionFont()
        blurb.textColor = UIColor.black
        blurb.numberOfLines = 0
        blurb.lineBreakMode = .byWordWrapping
        viewModel.blurb.bind(to: blurb)
        addSubview(blurb)
        blurb.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(title.snp.bottom).offset(3)
            make.width.equalToSuperview().offset(-40)
        }
    }
}
