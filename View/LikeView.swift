import Foundation
import UIKit
import SnapKit

class LikeView: UIView {
    
    var likeButton: UIButton = UIButton()
    var likeLabel: UILabel = UILabel()
    var dividerLine: Line = Line()
    
    var likeButtonWidth: Constraint?
    var likeButtonHeight: Constraint?
    var likeButtonLeadingSpace: Constraint?
    
    init() {
        super.init(frame: CGRect.zero)
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
        likeButton.setImage(UIImage(named:"Like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        likeButton.imageEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        likeButton.addTarget(self, action: #selector(doTapAnimation), for: .touchUpInside)
        likeButton.tintColor = AppColor.primary
        addSubview(likeButton)
        likeButton.snp.makeConstraints { make -> Void in
            likeButtonWidth = make.width.equalTo(30).constraint
            likeButtonHeight = make.height.equalTo(30).constraint
            make.centerY.equalTo(self)
            likeButtonLeadingSpace = make.left.equalTo(self).offset(20).constraint
        }
        
        likeLabel.text = "200 people like riding here"
        addSubview(likeLabel)
        likeLabel.font = Appfont.descriptionFont()
        likeLabel.snp.makeConstraints { make -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(65)
        }
        
        addSubview(dividerLine)
        dividerLine.snp.makeConstraints { make -> Void in
            make.bottom.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
    }
    
    func doTapAnimation() {
        
        guard likeButton.isEnabled else {
            return
        }
        
        let animate = { (reverse: Bool) in
            self.likeButtonHeight?.layoutConstraints.first?.constant += reverse ? -15 : 15
            self.likeButtonWidth?.layoutConstraints.first?.constant += reverse ? -15 : 15
            self.likeButtonLeadingSpace?.update(offset: reverse ? 20 : 12.5)
            self.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions(), animations: { _ in animate(false) }) { _ in
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.2,
                           options: UIViewAnimationOptions(),
                           animations: { _ in animate(true) },
                           completion: nil)
        }
    }
}
