//
//  WeatherView.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 01.02.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import UIKit

class WeatherView: UICollectionReusableView {
        
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        summaryLabel.text = ""
        iconView.image = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        summaryLabel.text = ""
        iconView.image = nil
    }
}
