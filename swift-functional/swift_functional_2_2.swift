//
//  swift_functional_2_2.swift
//  swift-functional
//
//  Created by CMVIOS1 on 2017/7/21.
//  Copyright © 2017年 CMV. All rights reserved.
//

import UIKit

class swift_functional_2_2: NSObject {
    
}

// func myFilter(/* parameters */) -> Filter

//MARK: - 模糊

/// 高斯模糊滤镜
///
/// - Parameter radius: 模糊半径
/// - Returns: <#return value description#>
func blur(_ radius: Double) -> Filter {
    return { image in
        let parameters : [String : Any] = [
            kCIInputRadiusKey: radius,
            kCIInputImageKey: image
        ]
        guard let filter = CIFilter(name: "CIGaussianBlur",withInputParameters: parameters) else {
            fatalError()
        }
        guard let outputImage = filter.outputImage else {
            fatalError()
        }
        return outputImage
    }
}

//MARK: - 颜色叠层
// 定义一个能够在图像上覆盖纯色叠层的滤镜

/// 颜色生成滤镜
///
/// - Parameter color: 颜色
/// - Returns: <#return value description#>
func colorGenerator(_ color:UIColor) -> Filter {
    return { _ in
        let c = CIColor(color: color)
        let parameters = [kCIInputColorKey: c]
        guard let filter = CIFilter(name: "CIConstantColorGenerator", withInputParameters: parameters) else {
            fatalError()
        }
        guard let outputImage = filter.outputImage else {
            fatalError()
        }
        return outputImage
    }
}

/// 定义合成滤镜
///
/// - Parameter overlay: <#overlay description#>
/// - Returns: <#return value description#>
func compositeSourceOver(_ overlay: CIImage) -> Filter {
    return { image in
        let parameters = [
            kCIInputBackgroundImageKey: image,
            kCIInputImageKey: overlay
        ]
        guard let filter = CIFilter(name: "CISourceOverCompositing", withInputParameters: parameters) else { fatalError() }
        guard let outputImage = filter.outputImage else { fatalError() }
        let cropRect = image.extent
        return outputImage.cropping(to: cropRect)
    }
}

/// 创建颜色叠层滤镜
///
/// - Parameter color: <#color description#>
/// - Returns: <#return value description#>
func colorOverlay(_ color: UIColor) -> Filter {
    return { image in
        let overlay = colorGenerator(color)(image)
        return compositeSourceOver(overlay)(image)
    }
}
































