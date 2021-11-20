import UIKit
import Foundation


var carCharacteristics = [ "weight" : 2108.0, "length" : 4976, "width": 1963, "height": 1435, "wheelbases": 2959, "clearances": 154.9, "trunk volume": 900]
var autoDriveMode: Bool = false
var isLost: Bool = false
var lowBattery: Bool = false
var brokeAutoDrive: Bool = false
var isClimateControlBroken: Bool = true
var isLureControlBroken: Bool = false
var isFanSpeedBroken: Bool = true
var isMusicPlayerBroken: Bool = false

enum AutoError: Error {
    case isLost
    case lowBattery
    case brokeAutoDrive
    case isClimateControlBroken
    case isLureControlBroken
    case isFanSpeedBroken
    case isMusicPlayerBroken
}


func musicPlayer(_ turnOn: Bool) throws{
    if isMusicPlayerBroken {
        throw AutoError.isMusicPlayerBroken
    }
    print("Music player is \(turnOn ? "on": "off")")
}

func lureControl(_ percents: Int) throws{
    if isLureControlBroken {
        throw AutoError.isLureControlBroken
    }
    if percents <= 100 || percents >= 0{
        print("The lure is open at \(String(percents)) percents")
    } else {
        print("Incorrect data.")
    }
}

func fanSpeed(_ speed: Int) throws{
    if isFanSpeedBroken{
        throw AutoError.isFanSpeedBroken
    }
    if speed <= 10 && speed >= 0{
        print("The fan is switched on at \(String(speed)) speed")
    } else {
        print("Incorrect data.")
    }
}

func climateControl(_ climateZone: String,_ temperature: Int) throws{
    if isClimateControlBroken {
        throw AutoError.isClimateControlBroken
    }
    switch temperature {
    case ..<16, 30... :
        print("Incorrect temperature.")
        break
    case 16..<30 where climateZone == "driver":
        print("The driver's temperature is set to \(String(temperature)) degrees")
        break
    case 16..<30 where climateZone == "passenger":
        print("The passenger temperature is set to \(String(temperature)) degrees")
        break
    default:
        print("Incorrect data.")
        break
    }
}


func autoDrive() throws {
    if isLost {
        throw AutoError.isLost
    }
    if lowBattery {
        throw AutoError.lowBattery
    }
    if brokeAutoDrive {
        throw AutoError.brokeAutoDrive
    }
    autoDriveMode = true
    print("Autopilot mode is on, be careful while driving")
    
}

do {
    try autoDrive()
} catch AutoError.isLost {
    print("You're lost! Turn on GPS")
} catch AutoError.lowBattery {
    print("The battery is low! Nearest recharging station in 1km 300m")
} catch AutoError.brokeAutoDrive {
    print("Autopilot mode is damaged. Switch to manual control mode!")
}

do {
    try musicPlayer(true)
} catch AutoError.isMusicPlayerBroken {
    print("Music player is broken! Please, contact the service center.")
}

do {
    try lureControl(65)
} catch AutoError.isLureControlBroken {
    print("Lure conrol is broken! Please, contact the service center.")
}

do {
    try fanSpeed(5)
} catch AutoError.isFanSpeedBroken {
    print("Fan speed controler is broken! Please, contact the service center")
}

do {
    try climateControl("passenger", 45)
} catch AutoError.isClimateControlBroken {
    print("Climate control is broken! Please, contacte the service center")
}
