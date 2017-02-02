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
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.width / 10
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeLabel.text = ""
        temperatureLabel.text = ""
        summaryLabel.text = ""
        iconView.image = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timeLabel.text = ""
        temperatureLabel.text = ""
        summaryLabel.text = ""
        iconView.image = nil
    }
    
}
