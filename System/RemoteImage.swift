import Foundation
import ReactiveKit
import UIKit

class RemoteImage {
    
    private var url: URL
    
    init(imageUrl: String) {
        url = URL(string: imageUrl)!
    }
    
    func download() -> SafeSignal<UIImage?> {
        return SafeSignal<UIImage?> { observer in
            let request = URLSession.shared.dataTask(with: self.url) { (data, res, error) in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                        print("Failed to load image: \(self.url)")
                        return
                    }
                    observer.next(UIImage(data: data))
                    observer.completed()
                }
            }
            request.resume()
            return BlockDisposable { request.cancel() }
        }
    }
}
