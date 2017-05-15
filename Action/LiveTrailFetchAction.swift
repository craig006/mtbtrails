import Foundation
import ReactiveKit

class LiveTrailFetchAction: TrailFetchAction {

    let trailService: TrailService
    init(trailService: TrailService){
        self.trailService = trailService;
    }

    func begin() -> Signal<Trail, AppError> {
        return Signal<Trail, AppError> { _ in return BlockDisposable { } }
    }
}
