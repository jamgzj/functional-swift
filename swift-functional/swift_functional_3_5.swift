//
//  swift_functional_3_5.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/24.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_3_5: NSObject {

}

func noOp<T>(_ x: T) -> T {
    return x
}

func noOpAny(_ x: Any) -> Any {
    return x
}

func noOpAnyWrong(_ x: Any) -> Any {
    return 0
}



func >>> <A, B, C>(_ f: @escaping (A) -> B,g: @escaping (B) -> C) -> (A) -> C {
    return { x in g(f(x)) }
}


func curry<A,B,C>(_ f: @escaping (A,B) -> C) -> (A) -> (B) -> C {
    return { x in { y in f(x,y)} }
}



























