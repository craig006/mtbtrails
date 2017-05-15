import Foundation
import ReactiveKit

class LiveTrailFetchAction: TrailFetchAction {

    let trailService: TrailService
    init(trailService: TrailService){
        self.trailService = trailService;
    }

    func begin(id: String) -> Signal<Trail, AppError> {
        return Signal<Trail, AppError> { observer in
            self.trailService.fetchTrail(id: id).observeNext { trail in
                observer.completed(with: trail)
            }
            return BlockDisposable { }
        }
    }
}
