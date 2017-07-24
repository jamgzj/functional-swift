//
//  swift_functional_3_1.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/24.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_3_1: NSObject {

}

func incrementArray(_ xs: [Int]) -> [Int] {
    var result : [Int] = []
    for x in xs {
        result.append(x + 1)
    }
    return result
}

func doubleArray1(_ xs: [Int]) -> [Int] {
    var result : [Int] = []
    for x in xs {
        result.append(x * 2)
    }
    return result
}

// 上面两个函数有大量相同的代码，我们能不能将没有区别的地方抽象出来，并单独写一个体现这种模式并且更通用的函数呢？

func computeIntArray(_ xs: [Int], transform: (Int) -> Int) -> [Int] {
    var result : [Int] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

func doubleArray2(_ xs: [Int]) -> [Int] {
    return computeIntArray(xs, transform: { x in x * 2 })
}

// 泛型函数

func genericComputeArray<T>(_ xs: [Int], transform: (Int) -> T) -> [T] {
    var result : [T] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

// 进一步进行函数一般化(进一步泛型)

func map<Element, T>(_ xs: [Element], transform: (Element) -> T) -> [T] {
    var result : [T] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
    //return xs.map(transform)
}

// 定义了上面的函数，我们可以通过上面的map函数来定义genericComputeArray函数

func genericComputeArray2<T>(_ xs: [Int], transform: (Int) -> T) -> [T] {
    return map(xs, transform: transform)
}

// 比起定义一个顶层的map函数，按照swift的惯例将map定义为Array的扩展会更合适：
// 自己定义 map 函数（map函数的本质）

/*
extension Array {
    func map<T>(_ transform: (Element) -> T) -> [T] {
        var result : [T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

func genericComputeArray3<T>(_ xs: [Int], transform: (Int) -> T) -> [T] {
    return xs.map(transform)
}
 */

// 想必你会很乐意听到其实并不需要自己像这样来定义map函数，因为它已经是swift标准库的一部分了（实际上，它基于SequenceType协议被定义，我们会在之后第10章中提到）。















