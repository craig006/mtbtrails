import Foundation
import UIKit
import Bond
import ReactiveKit
import MapKit
import CoreLocation

class TrailDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var viewModel: TrailDetailViewModel
    var table: UITableView = UITableView()
    var tableSections: [TableSection] = []
    var trailImageCell: ImageTableViewCell = ImageTableViewCell(style: .default, reuseIdentifier: "image")
    var likeCell: LikeTableViewCell = LikeTableViewCell(style: .default, reuseIdentifier: "like")
    var tipsCell: TipTableViewCell = TipTableViewCell(style: .default, reuseIdentifier: "tips")
    var trailMapCell: TrailMapTableViewCell = TrailMapTableViewCell(style: .default, reuseIdentifier: "map")

    init(viewModel: TrailDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        TrailService().fetchTrail(id: "contermanskloof")
        viewModel.tips.bind(to: tipsCell.collectionView, createCell: tipsCell.getTipCell)
        viewModel.trailImage.bind(to: trailImageCell.mainImage)
        viewModel.location.bind(to: trailMapCell.mapView.location)

        createTableSections()

        view.addSubview(table)
        table.separatorStyle = .none
        table.register(TrailOptoinTableViewCell.self, forCellReuseIdentifier: "trailoption")
        table.register(AmenityTableViewCell.self, forCellReuseIdentifier: "amenity")
        table.snp.makeConstraints { make in
            make.size.equalTo(self.view)
        }
        table.dataSource = self
        table.delegate = self
        viewModel.model.observe { event in self.table.reloadData() }
                .dispose(in: bag)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableSections[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableSections[indexPath.section].cellForRow(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableSections[indexPath.section].heightForRow(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableSections[section].heightForHeader
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableSections[section].viewForHeader
    }
    
    private func createTableSections() {
        let imageSection = TableSection(cellForRow: { _ in self.trailImageCell }, heightForRow: { _ in 240 })
        let likeSection = TableSection(cellForRow: { _ in self.likeCell }, heightForRow: { _ in 60 })
        let tipsSection = TableSection(cellForRow: { _ in self.tipsCell }, heightForRow: { _ in self.getTipsRowHeight()})
        
        let trailsSection = TableSection(numberOfRows: viewModel.trailOptions.count, cellForRow: getTrailOptionCell, heightForRow: { _ in 84},
                heightForHeader: 45, viewForHeader: HeaderView(color: AppColor.highlight, text: "Trails"))
        
        let amenitiesSection = TableSection(numberOfRows: viewModel.amenities.count, cellForRow: getAmenityCell, heightForRow: getAmenityRowHeight,
                heightForHeader: 45, viewForHeader: HeaderView(color: AppColor.highlight1, text: "Amenities"))

        let trailMapSection = TableSection(numberOfRows: 1, cellForRow: { _ in self.trailMapCell }, heightForRow: { _ in 240 },
                heightForHeader: 60, viewForHeader: HeaderView(color: AppColor.primary, text: "Directions"))

        tableSections = [imageSection, likeSection, tipsSection, trailsSection, amenitiesSection, trailMapSection]
    }
    
    private func getTrailOptionCell(itemIndex: Int) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "trailoption") as! TrailOptoinTableViewCell
        cell.trailOptionView.viewModel.trailOption = viewModel.trailOptions[itemIndex]
        return cell
    }
    
    private func getAmenityCell(itemIndex: Int) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "amenity") as! AmenityTableViewCell
        cell.amenityView.viewModel.amenity = viewModel.amenities[itemIndex]
        return cell
    }
    
    private func getTipsRowHeight() -> CGFloat{
        let rows = ceil(Double(viewModel.tips.count) / Double(3))
        return CGFloat((rows * 90) + 30.0)
    }
    
    private func getAmenityRowHeight(itemIndex: Int) -> CGFloat {
        return viewModel.amenities[itemIndex].blurb.height(withConstrainedWidth: view.frame.width - 30, font: Appfont.descriptionFont()) + 50
    }
}
