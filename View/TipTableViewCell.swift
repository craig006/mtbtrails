import Foundation
import UIKit
import Bond

class TipTableViewCell : UITableViewCell {
    
    var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    private func createSubviews() {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: 110, height: 90)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(TipCollectionviewCell.self, forCellWithReuseIdentifier: "tip")
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.size.equalTo(self)
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self)
        }
    }
    
    func getTipCell(tips: ObservableArray<Tip>, indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tip", for: indexPath) as! TipCollectionviewCell
        cell.tipView.viewmodel.tip = tips[indexPath.row]
        return cell
    }
}
