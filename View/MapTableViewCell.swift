import Foundation
import UIKit
import SnapKit

class TrailMapTableViewCell : UITableViewCell {
    
    var mapView: TrailMapView = TrailMapView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        contentView.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
