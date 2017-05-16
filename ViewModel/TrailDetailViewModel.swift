import Foundation
import Bond
import MapKit
import CoreLocation
import ReactiveKit

public class TrailDetailViewModel: NSObject {
    let tips = MutableObservableArray<Tip>([])
    let trailOptions = MutableObservableArray<TrailOption>([])
    let amenities = MutableObservableArray<Amenity>([])
    let liked = Observable<Bool>(false)
    let model = Observable<Trail?>(nil)
    let likeImage = Observable<UIImage?>(nil)
    let trailImage = Observable<UIImage?>(nil)
    let location = Observable<CLLocationCoordinate2D>(CLLocationCoordinate2D())
    let trailLikeAction: TrailLikeAction
    let trailFetchAction: TrailFetchAction

    init(trailFetchAction: TrailFetchAction, trailLikeAction: TrailLikeAction) {
        self.trailFetchAction = trailFetchAction
        self.trailLikeAction = trailLikeAction
        super.init()
        self.trailFetchAction.begin(id: "contermanskloof")
                .observe { event in
//                    if event.success
//                    if let trail = event.result {

                    //} //else if let error =

                }.dispose(in: bag)
    }

    func likeAction() {
        guard let trail = trail else { return }

        self.trailLikeAction.begin(trail: trail)
                .observeNext { trail in self.trail = trail }
    }

    var trail: Trail? {
        didSet {
            if let trail = trail {
                updateTrail(trail: trail)
            } else {
                resetData()
            }
            model.value = trail;
        }
    }

    private func updateTrail(trail: Trail) {
        tips.replace(with: trail.tips)
        trailOptions.replace(with: trail.trailOptions)
        amenities.replace(with: trail.amenities)
        location.value = trail.location

        RemoteImage(imageUrl: trail.imageUrl)
                .download()
                .bind(to: trailImage)
                .dispose(in: bag)
    }

    private func resetData() {
        tips.removeAll()
        trailOptions.removeAll()
        amenities.removeAll()
        location.value = CLLocationCoordinate2D()
        trailImage.value = nil
    }
}
