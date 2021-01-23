//
//  UISearchBar+Color.swift
//  csob-ceb-ios
//
//  Created by Administrator on 02/08/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension UISearchBar {
	public func setSearchTextBackgroundColor(color: UIColor) {
		let clrChange = subviews.flatMap { $0.subviews }
		guard let sc = (clrChange.first(where: { $0 is UITextField }) as? UITextField) else { return }
        switch searchBarStyle {
        case .minimal:
            sc.layer.backgroundColor = color.cgColor
            sc.layer.cornerRadius = 6
        case .prominent, .default:
            sc.backgroundColor = color
            backgroundImage = UIImage()
        }
	}

	public func setSearchTextColor(color: UIColor) {
		let clrChange = subviews.flatMap { $0.subviews }
		guard let sc = (clrChange.first(where: { $0 is UITextField }) as? UITextField) else { return }
		sc.textColor = color
	}
}
