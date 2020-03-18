//
//  RocketModel.swift
//  SpaceXRockets
//
//  Created by Aleksey Usanov on 17.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Rocket: Object, Mappable {
    @objc dynamic var active : Bool = false
    @objc dynamic var boosters : Int = 0
    @objc dynamic var company : String = ""
    @objc dynamic var cost_per_launch : Int = 0
    @objc dynamic var country : String = ""
    @objc dynamic var description_field : String = ""
    @objc dynamic var diameter : Diameter? = nil
    @objc dynamic var engines : Engine? = nil
    @objc dynamic var first_flight : String = ""
    @objc dynamic var first_stage : FirstStage? = nil
    var flickr_images = List<String>()
    @objc dynamic var height : Height? = nil
    @objc dynamic var id : Int = 0
    @objc dynamic var landing_legs : LandingLeg? = nil
    @objc dynamic var mass : Mass? = nil
    var payload_weights = List<PayloadWeight>()
    @objc dynamic var rocket_id : String = ""
    @objc dynamic var rocket_name : String = ""
    @objc dynamic var rocket_type : String = ""
    @objc dynamic var second_stage : SecondStage? = nil
    @objc dynamic var stages : Int = 0
    @objc dynamic var success_rate_pct : Int = 0
    @objc dynamic var wikipedia : String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
//    override class func primaryKey() -> String? {
//        return "rocket_id"
//    }
    
    func mapping(map: Map) {
        active <- map["active"]
        boosters <- map["boosters"]
        company <- map["company"]
        cost_per_launch <- map["cost_per_launch"]
        country <- map["country"]
        description_field <- map["description"]
        diameter <- map["diameter"]
        engines <- map["engines"]
        first_flight <- map["first_flight"]
        first_stage <- map["first_stage"]
        flickr_images <- (map["flickr_images"], arrayToList())
        height <- map["height"]
        id <- map["id"]
        landing_legs <- map["landing_legs"]
        mass <- map["mass"]
        payload_weights <- map["payload_weights"]
        rocket_id <- map["rocket_id"]
        rocket_name <- map["rocket_name"]
        rocket_type <- map["rocket_type"]
        second_stage <- map["second_stage"]
        stages <- map["stages"]
        wikipedia <- map["wikipedia"]
        success_rate_pct <- map["success_rate_pct"]
    }
}

class Diameter: Object, Mappable {
    @objc dynamic var meters: Float = 0
    @objc dynamic var feet: Float = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        meters <- map["meters"]
        feet <- map["feet"]
    }
}

class Height: Object, Mappable {
    @objc dynamic var meters: Float = 0
    @objc dynamic var feet: Float = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        meters <- map["meters"]
        feet <- map["feet"]
    }
}

class Mass: Object, Mappable {
    @objc dynamic var kg: Float = 0
    @objc dynamic var lb: Float = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        kg <- map["kg"]
        lb <- map["lb"]
    }
}

class LandingLeg: Object, Mappable {
    @objc dynamic var number: Int = 0
    @objc dynamic var material: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        material <- map["material"]
    }
}

class FirstStage: Object, Mappable {
    @objc dynamic var reusable: Bool = false
    @objc dynamic var engines: Int = 0
    @objc dynamic var fuel_amount_tons: Int = 0
    @objc dynamic var cores: Int = 0
    @objc dynamic var burn_time_sec: Int = 0
    @objc dynamic var thrust_sea_level: ThrustSeaLevel? = nil
    @objc dynamic var thrust_vacuum: ThrustVacuum? = nil
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        reusable <- map["reusable"]
        engines <- map["engines"]
        fuel_amount_tons <- map["fuel_amount_tons"]
        cores <- map["cores"]
        burn_time_sec <- map["burn_time_sec"]
        thrust_sea_level <- map["thrust_sea_level"]
        thrust_vacuum <- map["thrust_vacuum"]
    }
}

class ThrustSeaLevel: Object, Mappable {
    @objc dynamic var kN: Float = 0
    @objc dynamic var lbf: Float = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        kN <- map["kN"]
        lbf <- map["lbf"]
    }
}

class ThrustVacuum: Object, Mappable {
    @objc dynamic var kN: Float = 0
    @objc dynamic var lbf: Float = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        kN <- map["kN"]
        lbf <- map["lbf"]
    }
}

class Engine: Object, Mappable {
    @objc dynamic var number: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var version: String = ""
    @objc dynamic var layout: String = ""
    @objc dynamic var engine_loss_max: Int = 0
    @objc dynamic var propellant_1: String = ""
    @objc dynamic var propellant_2: String = ""
    @objc dynamic var thrust_to_weight: Int = 0
    @objc dynamic var thrust_sea_level: ThrustSeaLevel? = nil
    @objc dynamic var thrust_vacuum: ThrustVacuum? = nil
    @objc dynamic var isp: Isp? = nil
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        type <- map["type"]
        version <- map["version"]
        layout <- map["layout"]
        engine_loss_max <- map["engine_loss_max"]
        propellant_1 <- map["propellant_1"]
        propellant_2 <- map["propellant_2"]
        thrust_to_weight <- map["thrust_to_weight"]
        thrust_sea_level <- map["thrust_sea_level"]
        thrust_vacuum <- map["thrust_vacuum"]
        isp <- map["isp"]
    }
}

class Isp: Object, Mappable {
    @objc dynamic var sea_level: Int = 0
    @objc dynamic var vacuum: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        sea_level <- map["sea_level"]
        vacuum <- map["vacuum"]
    }
}

class PayloadWeight: Object, Mappable {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var kg: Float = 0
    @objc dynamic var lb: Float = 0
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        kg <- map["kg"]
        lb <- map["lb"]
    }
}

class SecondStage: Object, Mappable {
    @objc dynamic var reusable: Bool = false
    @objc dynamic var engines: Int = 0
    @objc dynamic var fuel_amount_tons: Int = 0
    @objc dynamic var burn_time_sec: Int = 0
    @objc dynamic var thrust: Thrust? = nil
    @objc dynamic var payloads: Payloads? = nil
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        reusable <- map["reusable"]
        engines <- map["engines"]
        fuel_amount_tons <- map["fuel_amount_tons"]
        burn_time_sec <- map["burn_time_sec"]
        thrust <- map["thrust"]
        engines <- map["engines"]
        payloads <- map["payloads"]
    }
}

class Thrust: Object, Mappable {
    @objc dynamic var kN: Float = 0
    @objc dynamic var lbf: Float = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        kN <- map["kN"]
        lbf <- map["lbf"]
    }
}

class Payloads: Object, Mappable {
    @objc dynamic var option_1: String = ""
    @objc dynamic var option_2: String = ""
    @objc dynamic var composite_fairing: CompositeFairing? = nil
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        option_1 <- map["option_1"]
        option_2 <- map["option_2"]
        composite_fairing <- map["composite_fairing"]
    }
}

class CompositeFairing: Object, Mappable {
    @objc dynamic var height: Height? = nil
    @objc dynamic var diameter: Diameter? = nil
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        height <- map["height"]
        diameter <- map["diameter"]
    }
}

func <- <T: Mappable>(left: List<T>, right: Map)
{
    var array: [T]?
    
    if right.mappingType == .toJSON {
        array = Array(left)
    }
    
    array <- right
    
    if right.mappingType == .fromJSON {
        if let theArray = array {
            left.append(objectsIn: theArray)
        }
    }
}

func arrayToList<T>() -> TransformOf<List<T>, [T]> {
  return TransformOf(
    fromJSON: { (value: [T]?) -> List<T> in
      let result = List<T>()
      if let value = value {
        result.append(objectsIn: value)
      }
      return result
    },
    toJSON: { (value: List<T>?) -> [T] in
      var results = [T]()
      if let value = value {
        results.append(contentsOf: Array(value))
      }
      return results
  })
}
