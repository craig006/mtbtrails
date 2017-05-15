import Foundation
import UIKit
import SnapKit
import Bond

class TrailOptionView: UIView {
    var title = UILabel()
    var length = UILabel()
    var climb = UILabel()
    var image = UIImageView()
    var viewModel = TrailOptionViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
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
        
        length.font = Appfont.descriptionFont()
        length.textColor = UIColor.black
        viewModel.length.bind(to: length)
        addSubview(length)
        length.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(title.snp.bottom).offset(3)
        }
        
        climb.font = Appfont.descriptionFont()
        climb.textColor = UIColor.black
        viewModel.climb.bind(to: climb)
        addSubview(climb)
        climb.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(length.snp.bottom).offset(3)
        }
        
        image.contentMode = .scaleAspectFit
        viewModel.image.bind(to: image)
        addSubview(image)
        image.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
    }
}
