//
//  UIImageView+.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

public extension UIImageView {
    
    /// Fetches and sets image from given url then fires completion with true, if failed sets the given default image and fires completion with false
    /// - Parameters:
    ///   - url: url to load data from
    ///   - forceReload: Ignore cached image and reload, false by default
    ///   - defaultImage: default image to set in case of failure
    ///   - completion: gets fired after end of operation passing true if success, false otherwise
    func setImage(fromURL url: URL, forceReload: Bool = false, defaultImage: UIImage? = nil, completion: ((Bool)-> ())? = nil) {
        DispatchQueue.global(qos: .userInitiated).async {
            if !forceReload,
               let cachedImg = ImageCacheManager.default.cachedImage(forUrl: url.absoluteString) {
                DispatchQueue.main.async { self.image = cachedImg; completion?(true) }
                return
            }
            
            guard let data = try? Data(contentsOf: url),
                  let img = UIImage(data: data) else {
                print("Failed to load image from \(url)")
                DispatchQueue.main.async { self.image = defaultImage; completion?(false) }
                return
            }
            
            DispatchQueue.main.async {
                self.image = img;
                ImageCacheManager.default.cache(image: img, url: url.absoluteString)
                completion?(true)
            }
            
        }
        
    }
    
}
