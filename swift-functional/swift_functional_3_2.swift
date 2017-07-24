//
//  swift_functional_3_2.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/24.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_3_2: NSObject {

}

let exampleFiles = ["README.md","HelloWorld.swift","FlappyBird.swift"]

func getSwiftFiles(_ files: [String]) -> [String] {
    var result: [String] = []
    for file in files {
        if file.hasSuffix(".swift") {
            result.append(file)
        }
    }
    return result
}

//getSwiftFiles(exampleFiles)

extension Array {
    func filter(_ includeElement: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where includeElement(x) {
            result.append(x)
        }
        return result
    }
}

func getSwiftFiles2(_ files: [String]) -> [String] {
    
    return files.filter{ file in file.hasSuffix(".swift") }
    
//    return files.filter({ file in file.hasSuffix(".swift") })
    
//    return files.filter({ (file) -> Bool in
//        file.hasSuffix(".swift")
//    })
}

































