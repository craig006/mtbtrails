import Foundation
import MapKit
import UIKit
import SnapKit
import Bond

class TrailMapView: UIView {
    var mapView = MKMapView()
    private let spanAmount = 0.1

    var location = Observable<CLLocationCoordinate2D>(CLLocationCoordinate2D())

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }

    private func createSubviews() {
        location.observeNext { self.updateLocation(location: $0) }
        addSubview(mapView)
        mapView.snp.makeConstraints { make -> Void in
            make.size.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview()
        }
    }

    private func updateLocation(location: CLLocationCoordinate2D) {
        mapView.removeAnnotations(mapView.annotations)
        let span = MKCoordinateSpan(latitudeDelta: spanAmount, longitudeDelta: spanAmount)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
}
