import Foundation

struct AppError: Error {
    var userMessage: String
    var technicalMessage: String
    var type: AppErrorType

    enum AppErrorType {
        case CacheError
    }
}
