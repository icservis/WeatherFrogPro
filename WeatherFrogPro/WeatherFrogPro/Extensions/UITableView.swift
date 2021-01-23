//
//  UITableView.swift
//  Wheel
//
//  Created by Denis Bogomolov on 25/10/2016.
//  Copyright © 2016 Zentity sro. All rights reserved.
//

import UIKit

extension UITableView {
    /// Setup default tableVie appearance 
    /// - sets background color same as of superview or clear
    /// - sets tableFooterView to avoid infinite separators
    /// - sets separatorStyle to None
    /// - Author: Igor Shmidt
    func setTableAppearance() {
        backgroundColor = superview?.backgroundColor ?? .clear
        tableFooterView = UIView()
        separatorStyle = .none
    }

    func register<T: UITableViewCell>(_ cellType: T.Type) where T: Reusable, T: NibLoadable {
        // don't duplicate register if already registerred
        guard  dequeueReusableCell(withIdentifier: cellType.reuseIdentifier) == nil else { return }
        let nib = UINib(nibName: cellType.nibName, bundle: Bundle(for: cellType.self))
        register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard  let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

	func register<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type) where T: Reusable, T: NibLoadable {
		// don't duplicate register if already registerred
		guard  dequeueReusableHeaderFooterView(withIdentifier: headerFooter.reuseIdentifier) == nil else { return }
		let nib = UINib(nibName: headerFooter.nibName, bundle: Bundle(for: headerFooter.self))
		register(nib, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
	}

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard  let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
