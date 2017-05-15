import Foundation
import ReactiveKit

protocol TrailFetchAction: Action {
    func begin() -> Signal<Trail, AppError>
}
