import Foundation
import ReactiveKit

class LiveTrailLikeAction: TrailLikeAction {
    func begin(trail: Trail) -> Signal<Trail, AppError> {
        return Signal<Trail, AppError> { observer in
            //TODO: insert like logic here
            observer.completed(with: trail)
            return BlockDisposable {}
        }
    }
}
