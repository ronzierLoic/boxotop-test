//
//  UIView+Extension.swift
//  boxotop-test
//
//  Created by Loic RONZIER on 26/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

extension UIView {
    /// Apply corner radius on the view
    ///
    /// - Parameters withRadius: Radius of corner
    func applyCornerRadius(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    /// Apply a circle render on the view
    func applyCircleRender() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    /// Apply corner radius on the specific corners of the view
    ///
    /// Parameter:
    /// - corner: Array of corner
    /// - radius: Radius of corner
    func roundSpecificCorners(corners: UIRectCorner, radius: CGFloat) {
        let cornerMasks = [
            corners.contains(.topLeft) ? CACornerMask.layerMinXMinYCorner : nil,
            corners.contains(.topRight) ? CACornerMask.layerMaxXMinYCorner : nil,
            corners.contains(.bottomLeft) ? CACornerMask.layerMinXMaxYCorner : nil,
            corners.contains(.bottomRight) ? CACornerMask.layerMaxXMaxYCorner : nil,
            corners.contains(.allCorners) ? [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner, CACornerMask.layerMinXMaxYCorner, CACornerMask.layerMaxXMaxYCorner] : nil
        ].compactMap({ $0 })
        
        var maskedCorners: CACornerMask = []
        cornerMasks.forEach { mask in maskedCorners.insert(mask) }
        
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
    }
}
