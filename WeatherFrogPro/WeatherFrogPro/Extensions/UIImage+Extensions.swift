//
//  UIImage+Extensions.swift
//  csob-ceb-ios
//
//  Created by Administrator on 26/07/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension UIImage {

	//https://stackoverflow.com/questions/2658738/the-simplest-way-to-resize-an-uiimage
    class func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage {

		UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
		image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
		let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()

		return newImage
	}

	//https://stackoverflow.com/questions/23041811/create-a-clear-uisearchbar
	class func image(with color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
		let frame = CGRect(origin: CGPoint.zero, size: size)

		UIGraphicsBeginImageContext(frame.size)
		guard let context = UIGraphicsGetCurrentContext() else { fatalError() }
		context.setFillColor(color.cgColor)
		context.fill(frame)
		guard let image = UIGraphicsGetImageFromCurrentImageContext() else { fatalError() }
		UIGraphicsEndImageContext()

		return image
	}
}
