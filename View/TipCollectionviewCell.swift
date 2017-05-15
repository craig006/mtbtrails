import Foundation
import UIKit

class TipCollectionviewCell: UICollectionViewCell {
    
    var tipView: TipView = TipView();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        contentView.addSubview(tipView)
        tipView.snp.makeConstraints { make -> Void in
            make.size.equalTo(self)
        }
    }
}
