//
//  swift_functional_2_3.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/21.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_2_3: NSObject {

}

// 载入一张图片试试

let url = URL(string: "http://www.objc.io/images/covers/16.jpg")!
let image = CIImage(contentsOf: url)!

// 可以通过2.2链式地将两个滤镜应用到载入的图像上

let blurRadius = 5.0
let overlayColor = UIColor.red.withAlphaComponent(0.2)
let blurredImage = blur(blurRadius)(image)
let overlaidImage = colorOverlay(overlayColor)(blurredImage)



//MARK: - 复合函数

//将上面代码里两个调用滤镜的表达式简单合为一体
let result = colorOverlay(overlayColor)(blur(blurRadius)(image))

//然而，由于括号错综复杂，这些代码很快失去了可读性。更好的解决方式是自定义一个运算符来组合滤镜
//首先我们要定义一个用于组合滤镜的函数

func composeFilters(_ filter1: @escaping Filter, _ filter2: @escaping Filter) -> Filter {
    return { image in filter2(filter1(image)) }
}

let myFilter1 = composeFilters(blur(blurRadius),colorOverlay(overlayColor))
let result1 = myFilter1(image)


precedencegroup filterPrecedence {
    associativity : left
}

// 定义运算符
infix operator >>> : filterPrecedence

func >>> (_ filter1: @escaping Filter, _ filter2: @escaping Filter) -> Filter {
    return { image in filter2(filter1(image)) }
}

let myFilter2 = blur(blurRadius) >>> colorOverlay(overlayColor)
let result2 = myFilter2(image)






























