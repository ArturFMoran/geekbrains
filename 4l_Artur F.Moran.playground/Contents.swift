import Foundation

class Car {
    
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
    

    
    let brand: String
    let yearOfIssue: Int
    var engine: CarEngine
    var window: CarWindowState
    var trunkVolume: CarTrunk
    var trunkLoad: CarTrunkLoad
    
    init(brand: String, yearOfIssue: Int, trunkVolume: CarTrunk, engine: CarEngine, window: CarWindowState, trunkLoad: CarTrunkLoad) {
        self.brand = brand
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.window = window
        self.trunkLoad = trunkLoad
    }
    
    

    func windowSwitch(){
        if window == .close {
            window = .open
            print("Окно открыто")
        }else{
            window = .close
            print("Окно закрыто")
        }
    }

}


class SportCar: Car {
    
    enum roofSwitch {
        case open, close
    }
    
    enum Turbo {
        case on, off
    }
    
    var roof: roofSwitch
    var turbo: Turbo
    
    init(brand: String, yearOfIssue: Int, trunkVolume: Car.CarTrunk, engine: Car.CarEngine, window: Car.CarWindowState, trunkLoad: Car.CarTrunkLoad, turbo: Turbo, roof: roofSwitch) {
        self.turbo = turbo
        self.roof = roof
        super.init(brand: brand, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, engine: engine, window: window, trunkLoad: trunkLoad)
    }
    
    
    func turboSwitch(){
        if turbo == .off {
            turbo = .on
            print("Режим турбо активирован!")
        }else{
            turbo = .off
            print("Режим турбо деактивирован")
        }
    }
}

class TrunkCar: Car {
    
    enum TrunkCarTrailer{
          case with, without
      }
    
    var trailer: TrunkCarTrailer
    override var trunkVolume: CarTrunk {
        willSet {
            switch trailer {
            case .without:
                trunkVolume = .nothing
            case .with:
                break
            }
        }
    }
    override var trunkLoad: CarTrunkLoad {
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

    init(brand: String, yearOfIssue: Int, trailer: TrunkCarTrailer, trunkVolume: Car.CarTrunk, engine: Car.CarEngine, window: Car.CarWindowState, trunkLoad: Car.CarTrunkLoad) {
        self.trailer = trailer
        super.init(brand: brand, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, engine: engine, window: window, trunkLoad: trunkLoad)
    }
    
    func trailerSwitch(){
       
           if trailer == .without {
               trailer = .with
               print("Прицеп зацеплен")
           }else{
               trailer = .without
               print("Прицеп отцеплен")
           }
       }
    
    
}


var mySportCar = SportCar(brand: "BMV", yearOfIssue: 2017, trunkVolume: .small, engine: .on, window: .open, trunkLoad: .empty, turbo: .on, roof: .open)

mySportCar
mySportCar.turboSwitch()
mySportCar.windowSwitch()
print(mySportCar.turbo)


var myTrunkCar = TrunkCar(brand: "Kamaz", yearOfIssue: 1999, trailer: .with, trunkVolume: .large, engine: .off, window: .close, trunkLoad: .high)

myTrunkCar.trailerSwitch()
print(myTrunkCar.trailer)
