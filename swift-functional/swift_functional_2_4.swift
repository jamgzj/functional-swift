//
//  swift_functional_2_4.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/24.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_2_4: NSObject {

}


// 用于定义接受两个参数的函数的两种方法

// 第一种方法
func add1(_ x: Int,_ y: Int) -> Int {
    return x + y
}

// 第二种方法
func add2(_ x: Int) -> ( (Int) -> Int ) {
    return { y in x + y }
}

//两种函数的调用方法:
//add1(1, 2)
//add2(1)(2)

// 和第二种方法相同 可以不使用外层括号
func add3(_ x: Int) -> (Int) -> Int {
    return { y in x + y }
}









































