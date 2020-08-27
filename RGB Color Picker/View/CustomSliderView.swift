//
//  CustomSliderView.swift
//  Color Picker
//
//  Created by Herbert Dodge on 8/27/20.
//  Copyright © 2020 D by Design. All rights reserved.
//

import UIKit

class CustomSliderView: UIView {
    
    let label = UILabel()
    var color = UIColor()
    let slider = UISlider()

    init(label: String, color: UIColor) {
        super.init(frame: .zero)
        self.label.text = label
        self.color = color
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubviews(label, slider)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            slider.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            slider.widthAnchor.constraint(equalToConstant: 175)
        ])
        label.textColor = color
        configureSlider()
    }
    
    func configureSlider() {
        slider.minimumValue = 0.0
        slider.maximumValue = 255.0
        slider.value = 0.0
        slider.minimumTrackTintColor = color
        
    }
    
    
}
