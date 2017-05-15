import Foundation
import ReactiveKit
import FirebaseCore
import FirebaseDatabase
import SwiftyJSON
import CoreLocation

class TrailService {
    
    var dataBase: FIRDatabaseReference
    
    init() {
        dataBase = FIRDatabase.database().reference(withPath: "trails")
    }
    
    func fetchTrail(id: String) -> SafeSignal<Trail> {
        return SafeSignal<Trail> { observer in

            self.dataBase.child(id).observeSingleEvent(of: .value, with: { snapshot in
                let json = JSON(snapshot.value)
                let trail: Trail = json.singleObject()
                observer.completed(with: trail)
            })

            return BlockDisposable {}
        }
    }
}
