//
//  UIFont+Extension.swift
//  StakeApp
//
//  Created by Gio's Mac on 16.01.25.
//

import UIKit

extension UIFont {
    //MARK: font extension
    static func montserratVariableFontWght(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-VariableFont_wght", size: size) ?? .systemFont(ofSize: size)
    }

    static func montserratItalicVariableFontwght(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Italic-VariableFont_wght", size: size) ?? .systemFont(ofSize: size)
    }

    static func goldmanRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Goldman-Regular", size: size) ?? .systemFont(ofSize: size)
    }

    static func goldmanBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Goldman-Bold", size: size) ?? .systemFont(ofSize: size)
    }
}


