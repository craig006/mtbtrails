import Foundation
import UIKit

class TableSection {
    var numberOfRows: Int = 1
    var heightForRow: (Int) -> CGFloat
    var cellForRow: (Int) -> UITableViewCell
    var heightForHeader: CGFloat = 0
    var viewForHeader: UIView? = nil
    
    init(cellForRow: @escaping (Int) -> UITableViewCell, heightForRow: @escaping (Int) -> CGFloat) {
        self.cellForRow = cellForRow
        self.heightForRow = heightForRow
    }
    
    convenience init(numberOfRows: Int, cellForRow: @escaping (Int) -> UITableViewCell, heightForRow: @escaping (Int) -> CGFloat, heightForHeader: CGFloat, viewForHeader: UIView?) {
        self.init(cellForRow: cellForRow, heightForRow: heightForRow)
        self.numberOfRows = numberOfRows
        self.heightForHeader = heightForHeader
        self.viewForHeader = viewForHeader
    }
    
}
