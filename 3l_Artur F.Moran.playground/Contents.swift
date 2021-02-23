//: A UIKit based Playground for presenting user interface
  
import UIKit

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

enum CarWindowState {
    case open, close
}

enum CarEngine {
    case on, off
}

enum CarTrunk {
    case large
    case medium
    case small
    case nothing
}

enum CarTrunkLoad {
    case high
    case normal
    case low
    case empty
}

struct SportCar {
    let brand: String
    let yearOfIssue: Int
    let trunkVolume: CarTrunk
    var engine: CarEngine
    var window: CarWindowState
    var trunkLoad: CarTrunkLoad{
        willSet {
            switch trunkLoad {
            case .high:
                print("Багажник заполнен")
            case .normal:
                print("В багажнике еще есть свобдное место")
            case .low:
                print("В багажнике еще много места")
            default:
                print("В багажнике пусто")
            }
            
        }

    }

    mutating func openWindow(){
        window = .open
        print("Окно открыто")
    }

     mutating func closeWindow(){
        window = .close
        print("Окно закрыто")
    }


}

var car1 = SportCar(brand: "Жигуль", yearOfIssue: 1998, trunkVolume: .medium, engine: .off, window: .close, trunkLoad: .low)
print(car1.trunkLoad)
car1.trunkLoad = .normal
car1.openWindow()


enum TrunkCarTrailer{
    case with, without
}

struct TrunkCar {
    let brand: String
    let yearOfIssue: Int
    var engine: CarEngine
    var window: CarWindowState
    var trailer: TrunkCarTrailer
    var trunkVolume: CarTrunk {
        willSet {
            switch trailer {
            case .without:
                trunkVolume = .nothing
            case .with:
                break
            }
        }
    }
    var trunkLoad: CarTrunkLoad {
        didSet {
            if trailer == .with {
                    switch trunkLoad {
                case .high:
                print("Багажник заполнен")
                case .normal:
                    print("В багажнике еще есть свобдное место")
                case .low:
                    print("В багажнике еще много места")
                default:
                    print("В багажнике пусто")
                }
            }else{
                print("Некуда осуществлять погрузку. Прицепа нет!")
            }
            
        }

    }

    
    mutating func openWindow(){
        window = .open
        print("Окно открыто")
    }

     mutating func closeWindow(){
        window = .close
        print("Окно закрыто")
    }

    mutating func attachTrailer(){
        trailer = .with
        print("Прицеп зацеплен")
    }

     mutating func unhookTrailer(){
        trailer = .without
        print("Прицеп отцеплен")
    }

}

var trunkCar1 = TrunkCar(brand: "Дафф", yearOfIssue: 2004, engine: .on, window: .close, trailer: .with, trunkVolume: .large, trunkLoad: .high)
trunkCar1.trunkLoad = .normal
trunkCar1.unhookTrailer()
trunkCar1.trailer

