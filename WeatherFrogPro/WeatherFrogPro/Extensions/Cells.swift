//
//  Cells.swift
//  csob-ceb-ios
//
//  Created by Denis Bogomolov on 16/02/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

protocol DataSettapble {
    associatedtype DataType
    func setup(with object: DataType)
}

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable { }
extension UICollectionViewCell: Reusable { }
extension UITableViewHeaderFooterView: Reusable { }

// see  NibLoadable.swift
extension UITableViewCell: NibLoadable { }
extension UICollectionViewCell: NibLoadable { }
extension UITableViewHeaderFooterView: NibLoadable { }
