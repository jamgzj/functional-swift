//
//  Battleship_1_2.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/20.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class Battleship_1_2: NSObject {

}

/*  定义一个函数来判断一个点是否在范围内
 *
 *  func pointInRange(point: Position) -> Bool {
 *      //方法具体实现
 *  }
 */

/*
// Region类型将指代把Position转化为Bool的函数
// 我们使用一个能判断给定点是否在区域内的函数来代表一个区域，而不是定义一个结构体来表示它
typealias Region = (Position) -> Bool

// 定义一个区域是以原点为圆心的圆
func circle(_ radius: Distance) -> Region {
    return { point in point.length <= radius }
}

// 定义一个区域是以原点为center的圆
func circle2(_ radius: Distance, _ center: Position) -> Region {
    return { point in point.minus(p: center).length <= radius }
}

func shift(_ region: @escaping Region, _ offset: Position) -> Region {
    return { point in region(point.minus(p: offset)) }
}

// 获得原区域以外的区域
func invert(_ region: @escaping Region) -> Region {
    return { point in !region(point) }
}

// 定义一个region1、region2的交集
func intersection(_ region1: @escaping Region,_ region2: @escaping Region) -> Region {
    return { point in region1(point) && region2(point) }
}

// 定义一个region1、region2的并集
func union(_ region1: @escaping Region,_ region2: @escaping Region) -> Region {
    return { point in region1(point) || region2(point) }
}

// 定义一个被region包含，不被minus包含的区域
func difference(_ region: @escaping Region, minus: @escaping Region) -> Region {
    return intersection(region, invert(minus))
}

extension Ship {
    func canSafelyEngageShip(_ target: Ship, friendly: Ship) -> Bool {
        let rangeRegion = difference(circle(firingRange), minus: circle(unsafeRange))
        let firingRegion = shift(rangeRegion, position)
        let friendlyRegion = shift(circle(unsafeRange), friendly.position)
        let resultRegion = difference(firingRegion, minus: friendlyRegion)
        return resultRegion(target.position)
    }
}
*/

struct Region {
    let lookup: (Position) -> Bool
}

extension Region {
    
    func shift(_ offset: Position) -> Region {
        return Region(lookup: { point in self.lookup(point.minus(p: offset)) })
    }
    
    // 获得自己以外的区域
    func invert() -> Region {
        return Region(lookup: { point in !self.lookup(point) })
    }
    
    // 定义一个自己、region2的交集
    func intersection(_ region2: Region) -> Region {
        return Region(lookup: { point in self.lookup(point) && region2.lookup(point) })
    }
    
    // 定义一个自己、region2的并集
    func union(_ region2: Region) -> Region {
        return Region(lookup: { point in self.lookup(point) || region2.lookup(point) })
    }
    
    // 定义一个被自己包含，不被minus包含的区域
    func difference(_ minus: Region) -> Region {
        return self.intersection(minus.invert())
    }
}

// 定义一个区域是以原点为圆心的圆
func circle(_ radius: Distance) -> Region {
    return Region(lookup: { point in point.length <= radius })
}

// 定义一个区域是以原点为center的圆
func circle2(_ radius: Distance, _ center: Position) -> Region {
    return Region(lookup: { point in point.minus(p: center).length <= radius })
}


extension Ship {
    func canSafelyEngageShip(_ target: Ship, friendly: Ship) -> Bool {
        let rangeRegion = circle(firingRange).difference(circle(unsafeRange))
        let firingRegion = rangeRegion.shift(position)
        let friendlyRegion = circle(unsafeRange).shift(friendly.position)
        let resultRegion = firingRegion.difference(friendlyRegion)
        return resultRegion.lookup(target.position)
    }
}





















