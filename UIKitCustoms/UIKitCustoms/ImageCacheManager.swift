//
//  ImageCacheManager.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

public class ImageCacheManager {
    
    private init() {}
    
    public static let `default` = ImageCacheManager()
    
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    public func clearCache(forUrl url: String) {
        imageCache.removeObject(forKey: url as AnyObject)
    }
    
    public func clearCache() {
        imageCache.removeAllObjects()
    }
    
    internal func cache(image: UIImage, url: String) {
        imageCache.setObject(image, forKey: url as AnyObject)
    }
    
    internal func cachedImage(forUrl url: String)-> UIImage? {
        return imageCache.object(forKey: url as AnyObject)
    }
    
}
