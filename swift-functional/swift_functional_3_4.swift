//
//  swift_functional_3_4.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/24.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_3_4: NSObject {

}

struct City {
    let name : String
    let population : Int
}

let paris = City(name: "Paris", population: 2241)
let madrid = City(name: "Madrid", population: 3165)
let amsterdam = City(name: "Amsterdam", population: 827)
let berlin = City(name: "Berlin", population: 3562)

let cities = [paris,madrid,amsterdam,berlin]

extension City {
    func cityByScalingPopulation() -> City {
        return City(name: name, population: population * 1000)
    }
}

//cities.filter{ $0.population > 1000 }
//    .map{ $0.cityByScalingPopulation() }
//    .reduce("City:Population"){ result,c in
//        return result + "\n" + "\(c.name): \(c.population)"
//}



































