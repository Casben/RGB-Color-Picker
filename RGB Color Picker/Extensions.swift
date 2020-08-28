//
//  Extensions.swift
//  Color Picker
//
//  Created by Herbert Dodge on 8/27/20.
//  Copyright © 2020 D by Design. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
