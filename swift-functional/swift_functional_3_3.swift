//
//  swift_functional_3_3.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/24.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_3_3: NSObject {

}

// 计算数组中的和
func sum(_ xs: [Int]) -> Int {
    var result: Int = 0
    for x in xs {
        result += x
    }
    return result
}

//sum([1,2,3,4])


// 计算数组中的乘积
func product(_ xs: [Int]) -> Int {
    var result : Int = 1
    for x in xs {
        result = x * result
    }
    return result
}

// 连接数组中的所有字符串:
func concatenate(_ xs: [String]) -> String {
    var result : String = ""
    for x in xs {
        result += x
    }
    return result
}

// 连接数组中的字符串并插入一个单独的首行，以及在每一项后面追加一个换行符
func prettyPrintArray(_ xs: [String]) -> String {
    var result : String = "Entries in the array xs:\n"
    for x in xs {
        result = "  " + result + x + "\n"
    }
    return result
}

extension Array {
    func reduce<T>(_ initial: T,combine:(T,Element) -> T) -> T {
        var result = initial
        for x in self {
            result = combine(result,x)
        }
        return result
    }
}

func sumUsingReduce(_ xs: [Int]) -> Int {
    
    return xs.reduce(0){ result,x in result + x }
    
//    return xs.reduce(0, combine: { result,x in result + x })
    
//    return xs.reduce(0, { (result, x) -> Int in
//        result + x
//    })
}

func productUsingReduce(_ xs: [Int]) -> Int {
    return xs.reduce(1, combine: *)
}

func concatUsingReduce(_ xs: [Int]) -> Int {
    return xs.reduce(1, combine: +)
}



// for循环 编写
func flatten<T>(xss: [[T]]) -> [T] {
    var result : [T] = []
    for xs in xss {
        result += xs
    }
    return result
}

// reduce 编写
func flattenUsingReduce<T>(xss: [[T]]) -> [T] {
    return xss.reduce([]){ result,xs in result + xs }
}


extension Array {
    
    // 使用reduce 重新定义map
    func mapUsingReduce<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([]){ result,x in result + [transform(x)] }
    }
    
    // 使用reduce 重新定义filter
    func filterUsingReduce(_ includeElement: (Element) -> Bool) -> [Element] {
        return reduce([]) { result,x in
            return includeElement(x) ? result + [x] : result
        }
    }
}
















