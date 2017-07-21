//
//  swift_functional_2_1.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/21.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_2_1: NSObject {

}

// CIFilter 是 Core Image 中的核心类之一，用于创建图像滤镜。当实例化一个CIFilter对象时，你(几乎)总是通过KCIInputImageKey键提供输入图像，再通过kCIOutputImageKey键取回处理后的图像。取回结果可以作为下一个滤镜的输入值

// 将 Filter 类型定义为一个函数，该函数接受一个图像作为参数并返回一个新的图像:

typealias Filter = (CIImage) -> CIImage





































