import Foundation
import UIKit

class AmenityTableViewCell : UITableViewCell {
    
    var amenityView = AmenityView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        selectionStyle = .none
        contentView.addSubview(amenityView)
        amenityView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
}
