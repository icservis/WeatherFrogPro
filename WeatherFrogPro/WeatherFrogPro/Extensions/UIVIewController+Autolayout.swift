//
//  UIVIewController+Autolayout.swift
//  csob-ceb-ios
//
//  Created by Libor Kučera on 05.06.17.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension UIView {
    func anchorToSuperView(edges: UIRectEdge, insets: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            var constraints = [NSLayoutConstraint](); constraints.reserveCapacity(4)
            if edges.contains(.top) {
                constraints.append( self.topAnchor
                    .constraint(equalTo: superview.topAnchor, constant: insets.top) )
            }
            if edges.contains(.left) {
                constraints.append( self.leadingAnchor
                    .constraint(equalTo: superview.leadingAnchor, constant: insets.left) )
            }
            if edges.contains(.bottom) {
                constraints.append( self.bottomAnchor
                    .constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom) )
            }
            if edges.contains(.right) {
                constraints.append( self.trailingAnchor
                    .constraint(equalTo: superview.trailingAnchor, constant: -insets.right) )
            }
            NSLayoutConstraint.activate(constraints)
        }
    }

    func anchorToSuperViewMargins(edges: UIRectEdge) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let margins = superview.layoutMarginsGuide
            var constraints = [NSLayoutConstraint](); constraints.reserveCapacity(4)
            if edges.contains(.top) {
                constraints.append( self.topAnchor.constraint(equalTo: margins.topAnchor) )
            }
            if edges.contains(.left) {
                constraints.append( self.leadingAnchor.constraint(equalTo: margins.leadingAnchor) )
            }
            if edges.contains(.bottom) {
                constraints.append( self.bottomAnchor.constraint(equalTo: margins.bottomAnchor) )
            }
            if edges.contains(.right) {
                constraints.append( self.trailingAnchor.constraint(equalTo: margins.trailingAnchor) )
            }
            NSLayoutConstraint.activate(constraints)
        }
    }

    func anchorAllEdgesToSuperview(insets: UIEdgeInsets = .zero) {
        anchorToSuperView(edges: .all, insets: insets)
    }

    func anchorToCenterOfSuperView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        }
    }

    func anchorCenterHorizontallyToSuperView(margin: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margin).isActive = true
        }
    }

    func anchorCenterVerticalyToSuperView(margin: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: margin).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin).isActive = true
        }
    }
}
