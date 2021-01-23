//
//  LoadFromNib.swift
//  csob-ceb-ios
//
//  Created by Denis Bogomolov on 31/03/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

func loadFromNib<T: AnyObject>(named nibName: String = String(describing: T.self), owner: Any? = nil) -> T? {
    let nibContent = Bundle(for: T.self).loadNibNamed(nibName, owner: owner, options: nil)
    return nibContent?.first { $0 is T } as? T
}
