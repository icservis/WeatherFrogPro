//
//  UITableViewCell+LeftMoveControl.swift
//  csob-ceb-ios
//
//  Created by Yan Zaitsev on 14/09/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    //Use this method in tableView(willDisplay:forRowAt) to move reordering control to left side of cell
    func moveReorderingControlToLeft() -> UIView? {
        var control: UIView?
        subviews.forEach {
            if $0.description.range(of: "UITableViewCellReorderControl") != nil {
                let resizedGripView = UIView(frame: CGRect(x: 0, y: 0, width: $0.frame.maxX, height: $0.frame.maxY))
                resizedGripView.addSubview($0)
                addSubview(resizedGripView)
                let transform = CGAffineTransform(translationX: $0.frame.size.width - frame.size.width, y:  0)
                resizedGripView.transform = transform
                resizedGripView.tag = 421
                control = resizedGripView
            }
        }
        return control
    }

    //Use this method in tableView(willDisplay:forRowAt) to hide reordering control that was moved to left side of cell
    func hideLeftReorderingControl() {
        viewWithTag(421)?.removeFromSuperview()
    }
}

/* TableAdapter Example
class ExRatesViewControllerTableAdapter: SortableSectionTableAdapter<ExRate, ExRateCell, ExRateSectionHeader> {
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        super.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
        if tableView.isEditing {
            let control = cell.moveReorderingControlToLeft()
            control?.backgroundColor = .csobNavBar
        } else {
            cell.hideLeftReorderingControl()
        }
    }
}
 
 tableView.setEditing(true, animated: true)
 tableView.reloadData() <- this call is required to update cell layouts
 */
