import Foundation
import UIKit

class ImageTableViewCell : UITableViewCell {
    
    var mainImage: UIImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        mainImage.contentMode = .scaleAspectFill
        mainImage.clipsToBounds = true
        contentView.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.size.equalTo(self)
        }
    }
}
