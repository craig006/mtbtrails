import Foundation
import UIKit

class LikeTableViewCell : UITableViewCell {
    
    var likeView: LikeView = LikeView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        isUserInteractionEnabled = true
        selectionStyle = .none
        contentView.addSubview(likeView)
        likeView.snp.makeConstraints { make in
            make.size.equalTo(self)
            make.top.equalTo(self)
            make.left.equalTo(self)
        }
    }
}
