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
}
