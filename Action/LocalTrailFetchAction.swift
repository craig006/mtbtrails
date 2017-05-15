import Foundation
import ReactiveKit
import Bond

class LocalTrailFetchAction: TrailFetchAction {
    var trail: Trail

    init(trail: Trail) {
        self.trail = trail
    }

    func begin() -> Signal<Trail, AppError> {
        return Signal<Trail, AppError> { observer in
            observer.completed(with: self.trail)
            return BlockDisposable {}
        }
    }
}
