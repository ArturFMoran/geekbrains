import UIKit
import PlaygroundSupport
import Foundation

enum Engine {
       case on, off
   }

enum Window {
      case open, close
  }


protocol Car {
    
    var color: UIColor {get}
    var brand: String {get}
    var yearOfIssue: Int {get}
    var weight: Double {get set}
    var engine: Engine {get set}
    var oilLoad: Int  {get set}
    var window: Window {get set}
    
    func notice() -> Bool
    
}

//Расширения для протокола:

extension Car {
    func windowSwitcher() -> Window {
        switch window {
        case .open:
            return .close
        case .close:
            return .open
        }
    }
}

extension Car {
    func eingineStatus() -> Engine {
        switch engine {
        case .on:
            print("Двигатель работает")
            return .on
        case .off:
            print("Двигатель не работает")
            return .off
        }
    }
}

//Спорткар:

class SportCar: Car {
    
    enum RoofSwitcher {
        case with
        case without
    }
    
    var brand: String
    var color: UIColor
    var yearOfIssue: Int
    var weight: Double
    var engine: Engine
    var oilLoad: Int
    var window: Window
    
    var maxSpeed: Int
    var roof: RoofSwitcher
    
    
    init(brand: String, color: UIColor, yearOfIssue: Int, weight: Double, engine: Engine, oilLoad: Int, window: Window, maxSpeed: Int, roof: RoofSwitcher) {
        self.brand = brand
        self.color = color
        self.yearOfIssue = yearOfIssue
        self.weight = weight
        self.engine = engine
        self.oilLoad = oilLoad
        self.window = window
        self.maxSpeed = maxSpeed
        self.roof = roof
    }
    
    func notice() -> Bool {
        switch oilLoad {
        case let i where i > 70 && i < 101:
            print("Уровень топлива более 70 процентов")
            return true
        case let i where i == 50:
            print("Уровень топлива достиг 50 процентов")
            return true
        case let i where i < 30 && i > 0:
            print("Уровень топлива менее 30 процентов")
            return true
        default:
            print("Пожалуйста, проведите диагностику автомобиля. Возникли проблемы с подачей топлива.")
            return false
        }
    }
    
}


//Грузовик:

class TrunkCar: Car {
    
    enum TrailerStatus {
        case with
        case without
    }
    
    enum TrailerVolume {
        case large
        case medium
        case small
    }

    var brand: String
    var color: UIColor
    var yearOfIssue: Int
    var weight: Double
    var engine: Engine
    var oilLoad: Int
    var window: Window
    
    var trailer: TrailerStatus
    var trailerVolume: TrailerVolume
    
    
    init(brand: String, color: UIColor, yearOfIssue: Int, weight: Double, engine: Engine, oilLoad: Int, window: Window, trailer: TrailerStatus, trailerVolume: TrailerVolume) {
        self.brand = brand
        self.color = color
        self.yearOfIssue = yearOfIssue
        self.weight = weight
        self.engine = engine
        self.oilLoad = oilLoad
        self.window = window
        self.trailer = trailer
        self.trailerVolume = trailerVolume
        
    }
    
    
    func notice() -> Bool {
        switch oilLoad {
        case let i where i > 70 && i < 100:
            print("Уровень топлива более 70 процентов")
            return true
        case let i where i == 50:
            print("Уровень топлива достиг 50 процентов")
            return true
        case let i where i < 30 && i > 0:
            print("Уровень топлива менее 30 процентов")
            return true
        default:
            print("Пожалуйста, проведите диагностику автомобиля. Возникли проблемы с подачей топлива.")
            return false
        }
    }
    
    
}


//Расширения для классов:

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Информация об автомобиле:\nБренд автомобиля: \(brand)\nГод выпуска: \(yearOfIssue)\nЦвет: \(color)\nВес: \(weight)т\nСтатус двигателя: \(engine)\nОбъем топлива: \(oilLoad)%\nМаксимальная скорость: \(maxSpeed)"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
          return "Информация об автомобиле:\nБренд автомобиля: \(brand)\nГод выпуска: \(yearOfIssue)\nЦвет: \(color)\nВес: \(weight)т\nСтатус двигателя: \(engine)\nОбъем топлива: \(oilLoad)%\nСтатус прицепа: \(trailer)\nОбъем прицепа: \(trailerVolume)"
      }
}

//Создать несколько объектов каждого класса. Применить к ним различные действия.
var mySportCar = SportCar(brand: "BMV", color: .black, yearOfIssue: 2007, weight: 6.0, engine: .on, oilLoad: 100, window: .open, maxSpeed: 235, roof: .without)
print(mySportCar)
print(mySportCar.eingineStatus())
print(mySportCar.notice())

var myTrunkCar = TrunkCar(brand: "Kamaz", color: .white, yearOfIssue: 1998, weight: 12.0, engine: .off, oilLoad: 20, window: .close, trailer: .with, trailerVolume: .medium)
print(myTrunkCar)
print(myTrunkCar.notice())
print(myTrunkCar.eingineStatus())


//как ограничить размер yearOfIssue до актуального года.
//почему не отображается корретно цвет
