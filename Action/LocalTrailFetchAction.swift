import Foundation
import ReactiveKit
import Bond

class LocalTrailFetchAction: TrailFetchAction {
    var trail: Trail

    init(trail: Trail) {
        self.trail = trail
    }

    func begin(id: String) -> Signal<Trail, AppError> {
        return Signal<Trail, AppError> { observer in
            let disposable = BlockDisposable {}

            guard self.trail.id == id else {
                let error = AppError(userMessage: "Oh no, unable to view this trail at this time, please try again later",
                        technicalMessage: "Trail with id:\(id) not found in local cache",
                        type: .CacheError)
                observer.failed(error)
                return disposable
            }

            observer.completed(with: self.trail)
            return disposable
        }
    }
}
