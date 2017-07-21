//
//  Battleship.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/20.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class Battleship_1_1: NSObject {

}

typealias Distance = Double

struct Position {
    var x : Double
    var y : Double
}

extension Position {
    func inRange(range: Distance) -> Bool {
        //sqrt 平方根函数
        return sqrt(x * x + y * y) <= range
    }
}

struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    func canEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange
    }
    
    func canSafelyEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange && targetDistance > unsafeRange
    }
    
    func canSafelyEngageShip1(target: Ship,friendly: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        let friendlyDistance = sqrt(friendlyDx * friendlyDx + friendlyDy * friendlyDy)
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && (friendlyDistance > unsafeRange)
    }
}

extension Position {
    func minus(p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    
    var length : Double {
        return sqrt(x * x + y * y)
    }
}

extension Ship {
    func canSafelyEngageShip2(target: Ship,friendly: Ship) -> Bool {
        let targetDistance = sqrt(target.position.minus(p: position).length)
        let friendlyDistance = sqrt(friendly.position.minus(p: target.position).length)
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && (friendlyDistance > unsafeRange)
    }
}









