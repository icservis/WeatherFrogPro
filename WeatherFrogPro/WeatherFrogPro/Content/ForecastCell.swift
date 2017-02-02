//
//  ForecastCell.swift
//  WeatherFrogPro
//
//  Created by Libor Kučera on 01.02.17.
//  Copyright © 2017 Libor Kučera. All rights reserved.
//

import UIKit

class ForecastCell: UICollectionViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.width / 10
    }
    
}
