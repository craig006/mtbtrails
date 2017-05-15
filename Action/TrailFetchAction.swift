import Foundation
import ReactiveKit

protocol TrailFetchAction: Action {
    func begin(id: String) -> Signal<Trail, AppError>
}
