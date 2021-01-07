//
//  UICollectionView+.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        let name = String(describing: T.self)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: name)
    }
    
    func dequeue<T: UICollectionViewCell>(forIndexPath index: IndexPath)-> T {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: index) as! T
    }
    
}
