//
//  UIImage.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

enum UIImageException: Error {
    case unableToDecodeToBase64
}

extension UIImage {
    
    func encodeToBase64() throws -> String {
        let data = pngData() ?? jpegData(compressionQuality: 1)
        guard let imageData = data else {
            throw UIImageException.unableToDecodeToBase64
        }
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        return strBase64
    }
    
    var bytesSize: Int {
        return self.jpegData(compressionQuality: 1)?.count ?? 0
    }
    
    var kilobytesSize: Int {
        return bytesSize / 1024
    }
    
    var megabytesSize: Int{
        return kilobytesSize / 1024
    }
    
    func compressed(quality: CGFloat = 0.5) -> UIImage? {
        guard let data = self.jpegData(compressionQuality: quality) else {return nil}
        return UIImage(data: data)
    }
    
    func imageOrientation()->UIImage {
        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }
        var transform: CGAffineTransform = CGAffineTransform.identity
        switch self.imageOrientation {
        case UIImageOrientation.down, UIImageOrientation.downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: CGFloat(Double.pi))
            break
        case UIImageOrientation.left, UIImageOrientation.leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(Double.pi / 2))
            break
        case UIImageOrientation.right, UIImageOrientation.rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: CGFloat(-(Double.pi / 2)))
            break
        case UIImageOrientation.up, UIImageOrientation.upMirrored:
            break
        @unknown default:
            fatalError("unknown image orientation")
        }
        
        switch self.imageOrientation {
        case UIImageOrientation.upMirrored, UIImageOrientation.downMirrored:
            transform.translatedBy(x: self.size.width, y: 0)
            transform.scaledBy(x: -1, y: 1)
            break
        case UIImageOrientation.leftMirrored, UIImageOrientation.rightMirrored:
            transform.translatedBy(x: self.size.height, y: 0)
            transform.scaledBy(x: -1, y: 1)
        case UIImageOrientation.up, UIImageOrientation.down, UIImageOrientation.left, UIImageOrientation.right:
            break
        @unknown default:
            fatalError("unknown image orientation")
        }
        
        let ctx:CGContext = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: (self.cgImage)!.bitsPerComponent, bytesPerRow: 0, space: (self.cgImage)!.colorSpace!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        ctx.concatenate(transform)
        
        switch self.imageOrientation {
        case UIImageOrientation.left, UIImageOrientation.leftMirrored, UIImageOrientation.right, UIImageOrientation.rightMirrored:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.height, height: self.size.width))
            break
        default:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
            break
        }
        
        let cgimg:CGImage = ctx.makeImage()!
        let img:UIImage = UIImage(cgImage: cgimg)
        
        return img
    }
    
    func resizeByByte(maxByte: Int, completion: @escaping (Data) -> Void) {
        var compressQuality: CGFloat = 1
        var imageData = Data()
        var imageByte = self.jpegData(compressionQuality: 1)?.count
        
        while imageByte! > maxByte {
            imageData = self.jpegData(compressionQuality: compressQuality)!
            imageByte = self.jpegData(compressionQuality: compressQuality)?.count
            compressQuality -= 0.1
        }
        
        if maxByte > imageByte! {
            completion(imageData)
        } else {
            completion(self.jpegData(compressionQuality: 1)!)
        }
    }
    
    func resize(withPercentage percentage: CGFloat) -> UIImage? {
        let newRect = CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage))
        UIGraphicsBeginImageContextWithOptions(newRect.size, true, 1)
        self.draw(in: newRect)
        defer {UIGraphicsEndImageContext()}
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}

