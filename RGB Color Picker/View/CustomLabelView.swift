//
//  CustomLabelView.swift
//  Color Picker
//
//  Created by Herbert Dodge on 8/27/20.
//  Copyright © 2020 D by Design. All rights reserved.
//

import UIKit

class CustomLabelView: UIView {

    let redValueLabel: UILabel = {
       let label = UILabel()
        label.text = "Red:"
        label.textColor = .systemRed
        return label
    }()
    let greenValueLabel: UILabel = {
       let label = UILabel()
        label.text = "Green:"
        label.textColor = .systemGreen
        return label
    }()
    let blueValueLabel: UILabel = {
       let label = UILabel()
        label.text = "Blue:"
        label.textColor = .systemBlue
        return label
    }()
    
    let redValue: UILabel = {
       let label = UILabel()
        label.text = "0"
        return label
    }()
    let greenValue: UILabel = {
       let label = UILabel()
        label.text = "0"
        return label
    }()
    let blueValue: UILabel = {
       let label = UILabel()
        label.text = "0"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabelStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabelStackView() {
        let labelStackView = UIStackView(arrangedSubviews: [redValueLabel, greenValueLabel, blueValueLabel])
        let valueStackView = UIStackView(arrangedSubviews: [redValue, greenValue, blueValue])
        let stackView = UIStackView(arrangedSubviews: [labelStackView, valueStackView])
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        labelStackView.axis = .vertical
        valueStackView.axis = .vertical
        
        
        stackView.addSubviews(labelStackView, valueStackView)
        addSubviews(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: 240)
        ])
    }
}
