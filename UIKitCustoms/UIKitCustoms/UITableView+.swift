//
//  UITableView+.swift
//  UIKitCustoms
//
//  Created by Yousef on 1/7/21.
//

import UIKit

extension UITableView {
    
    func isLastCellVisible(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }
        return lastIndexPath == indexPath
    }
    
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        let name = String(describing: T.self)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    func dequeue<T: UITableViewCell>()-> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self)) as! T
    }
    
}
