//
//  NibLoadable.swift
//  csob-ceb-ios
//
//  Created by Igor Shmidt on 30/08/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension NibLoadable where Self: UIViewController {
    static var nibName: String {
        return String(describing: self.classForCoder())
    }
}

func loadFromNib<T: NibLoadable>(named nibName: String = T.nibName, owner: Any? = nil,
                 options: [AnyHashable : Any]? = nil, bundle: Bundle = Bundle(for: T.self)) -> T? where T: UIView {
    let nibContent = bundle.loadNibNamed(nibName, owner: owner, options: nil)
    return nibContent?.first { $0 is T } as? T
}

func loadFromNib<T: NibLoadable>(named nibName: String = T.nibName,
                 bundle: Bundle = Bundle(for: T.self)) -> T where T: UIViewController {
    return T(nibName: nibName, bundle: bundle)
}

@discardableResult
func loadNibContentView(owner: UIView) -> UIView? {
    let type = type(of: owner)
    let bundle = Bundle(for: type)

    guard let container = bundle.loadNibNamed(String(describing: type), owner: owner)?.first as? UIView else {
        return nil
    }

    container.translatesAutoresizingMaskIntoConstraints = true
    container.frame = owner.bounds
    container.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    owner.addSubview(container)

    return container
}
