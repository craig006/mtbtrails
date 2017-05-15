import Foundation
import ReactiveKit

protocol TrailLikeAction: Action {
    func begin(trail: Trail) -> Signal<Trail, AppError>
}