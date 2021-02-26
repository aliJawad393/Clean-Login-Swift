//
//  UIFontExtension.swift
//  Clean Login
//
//  Created by Ali Jawad on 26/02/2021.
//  Copyright © 2021 Ali Jawad. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class func systemFontOfAdjustableSize(_ fontSize: CGFloat) -> UIFont {
        let multiplier = min((UIScreen.main.bounds.size.width / 375), 2)
        return .systemFont(ofSize: (fontSize * multiplier))
    }
}
