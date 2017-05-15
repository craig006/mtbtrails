import Foundation

struct AppError: Error {
    var id: String
    var scope: String
    var userMessage: String
    var description: String
}
