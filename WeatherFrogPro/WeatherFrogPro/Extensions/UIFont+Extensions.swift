//
//  UIFont+Extensions.swift
//  csob-ceb-ios
//
//  Created by Igor Shmidt on 01/06/2017.
//  Copyright © 2017 Zentity, a.s. All rights reserved.
//

import UIKit

extension UIFont {
    /// Creates bold variant of current font with desired size
    ///
    /// - Parameter size: desired size to create font
    /// - Returns: Bold variant font with size.
    /// If current font's family contains no bold variant- system bold font of size will returned
    /// - Author: Igor Shmidt
    public func boldWithSize(_ fontSize: CGFloat) -> UIFont {
        struct K {
            static let bold = "bold"
        }
        let options: String.CompareOptions = [.caseInsensitive, .backwards]
        if self.fontName.range(of: K.bold, options: options) != nil {
            // font is already bold
            return self.withSize(fontSize)
        }
        // try to find Bold variant
        let fontNames = UIFont.fontNames(forFamilyName: self.familyName)
        for fontName in fontNames {
            if fontName.range(of: K.bold, options: options) != nil {
                // found bold- create
                return UIFont(name: fontName, size: fontSize)!
            }
        }
        // bold variant for current family not found- return system bild
        return UIFont.boldSystemFont(ofSize: fontSize)
    }

	class func csobFontDescriptor(weight: CGFloat) -> UIFontDescriptor {
		var fontDesc = systemFont(ofSize: UIFont.systemFontSize).fontDescriptor
		fontDesc = fontDesc.addingAttributes([UIFontWeightTrait: weight])
		return fontDesc
	}

	class func csobKeyValueFont(size: CGFloat?, weight: CGFloat?) -> UIFont {
		guard let size = size, let weight = weight else {
			return UIFont.systemFont(ofSize: UIFont.systemFontSize)
		}

		return UIFont.systemFont(ofSize: size, weight: weight)
	}

	class var csobTinyLightFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.tiny)(),
		                         weight: UIFontWeightLight)
	}

	class var csobTinyRegularFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.tiny)(),
		                         weight: UIFontWeightRegular)
	}

	class var csobTinySemiBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.tiny)(),
		                         weight: UIFontWeightSemibold)
	}

	class var csobTinyBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.tiny)(),
		                         weight: UIFontWeightBold)
	}

	class var csobSmallLightFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.small)(),
		                         weight: UIFontWeightLight)
	}

	class var csobSmallRegularFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.small)(),
		                         weight: UIFontWeightRegular)
	}

    class var csobSmallMediumFont: UIFont {
        return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.small)(),
                                 weight: UIFontWeightMedium)
    }

	class var csobSmallSemiBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.small)(),
		                         weight: UIFontWeightSemibold)
    }

    class var csobSmallMediumBoldFont: UIFont {
        return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.small)(),
                                 weight: UIFontWeightMedium)
    }

	class var csobSmallBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.small)(),
		                         weight: UIFontWeightBold)
	}

	class var csobMediumLightFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.medium)(),
		                         weight: UIFontWeightLight)
	}

	class var csobMediumRegularFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.medium)(),
		                         weight: UIFontWeightRegular)
	}

	class var csobMediumSemiBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.medium)(),
		                         weight: UIFontWeightSemibold)
	}

	class var csobMediumBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.medium)(),
		                         weight: UIFontWeightBold)
	}

	class var csobLargeLightFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.large)(),
		                         weight: UIFontWeightLight)
	}

	class var csobLargeRegularFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.large)(),
		                         weight: UIFontWeightRegular)
    }

    class var csobLargeSemiBoldFont: UIFont {
        return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.large)(),
                                 weight: UIFontWeightSemibold)
    }

    class var csobLargeMediumFont: UIFont {
        return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.large)(),
                                 weight: UIFontWeightMedium)
    }

	class var csobLargeBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.large)(),
		                         weight: UIFontWeightBold)
	}

	class var csobExtraLargeLightFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.extraLarge)(),
		                         weight: UIFontWeightLight)
	}

	class var csobExtraLargeRegularFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.extraLarge)(),
		                         weight: UIFontWeightRegular)
	}

    class var csobExtraLargeMediumFont: UIFont {
        return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.extraLarge)(),
                                 weight: UIFontWeightMedium)
    }

	class var csobExtraLargeSemiBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.extraLarge)(),
		                         weight: UIFontWeightSemibold)
	}

	class var csobExtraLargeBoldFont: UIFont {
		return UIFont.systemFont(ofSize: KeyValuePair.Size.size(KeyValuePair.Size.extraLarge)(),
		                         weight: UIFontWeightBold)
	}

    class var csobNavigationTitleFont: UIFont {
		return UIFont.systemFont(ofSize: UIFont.systemFontSize,
		                         weight: UIFontWeightBold)
    }

    class var csobNavigationSubTitleFont: UIFont {
		return UIFont.systemFont(ofSize: UIFont.smallSystemFontSize,
		                         weight: UIFontWeightThin)
    }
}
