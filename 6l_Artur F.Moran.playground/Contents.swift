import Foundation


enum Color {
    case red, black, yellow, blue
}

protocol Colorful {

    var color: Color {get set}

}

class Stick: Colorful {
    var number: Int
    var color: Color

    init(number: Int, color: Color){
        self.number = number
        self.color = color
    }
}

struct Box<Queue: Colorful> {
    private var elements = [Queue]()

    var count: Int {elements.count}
    
    mutating func putIn(_ item: Queue){
        elements.append(item)
    }

    mutating func putOut() -> Queue? {
        return elements.removeLast()
    }
    
    
//    subscript(indices: UInt ...) -> Int {
//        var items: Int? = 0
//        for index in indices where index < self.elements.count {
//            if index > self.elements.count {
//                items = nil
//            }
//        }
//        return items!
//    }
}

var boxOfSticks = Box<Stick>()
boxOfSticks.putIn(Stick(number: 1, color: .red))
boxOfSticks.putIn(Stick(number: 3, color: .black))
boxOfSticks.putIn(Stick(number: 2, color: .red))
boxOfSticks.putIn(Stick(number: 5, color: .blue))
boxOfSticks.putIn(Stick(number: 4, color: .black))
print(boxOfSticks)

extension Stick: CustomStringConvertible {
    var description: String {
          return "Stick #\(number) is \(color)\n"
      }
}

extension Box {
    func filter(predicate:(Queue) -> Bool) -> [Queue] {
        var result = [Queue]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}



extension Box {
    mutating func sort(by: (Queue, Queue) -> Bool) {
        for i in (0 ..< elements.count) {
            for j in i+1 ..< elements.count {
                if by(elements[i], elements[j]) {
                    let v = elements[i]
                    elements[i] = elements[j]
                    elements[j] = v
                }
            }
        }
    }
}

boxOfSticks.sort(by: {$0.number > $1.number})
print(boxOfSticks)
print(boxOfSticks.filter{ $0.color == .black })

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)



