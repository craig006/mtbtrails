import UIKit
import PlaygroundSupport



class Person {
    var name: String = "john"
    var card: Card?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("person deinit")
    }
}

class Card {
    unowned var person: Person
    
    init(person: Person) {
        self.person = person
        print("init card")
    }
    
    deinit {
        print("card deinit")
    }
    
    func do1() {
        print("doing")
        print(person.name)
    }
}

var person: Person? = Person(name: "Craig")
var card: Card? = Card(person: person!)
person?.card = card

person = nil

card!.do1()
//card = nil



