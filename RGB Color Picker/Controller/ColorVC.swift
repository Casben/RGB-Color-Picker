//
//  ViewController.swift
//  Refactored Color Picker
//
//  Created by Herbie Dodge on 8/13/19.
//  Copyright © 2019 D by Design. All rights reserved.
//

import UIKit

class ColorVC: UIViewController {
    
    let redSlider = CustomSliderView(label: "Red", color: .systemRed)
    let greenSlider = CustomSliderView(label: "Green", color: .systemGreen)
    let blueSlider = CustomSliderView(label: "Blue", color: .systemBlue)
    let colorView = UIView()
    
    let labelView = CustomLabelView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @objc func changeColorComponent() {
        
        labelView.redValue.text = "\((Int(round(self.redSlider.slider.value))))"
        labelView.greenValue.text = "\((Int(round(self.greenSlider.slider.value))))"
        labelView.blueValue.text = "\((Int(round(self.blueSlider.slider.value))))"
        
        let red = CGFloat(redSlider.slider.value)
        let green = CGFloat(greenSlider.slider.value)
        let blue = CGFloat(blueSlider.slider.value)
        
        colorView.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    func configure() {
       view.backgroundColor = .systemBackground
        colorView.backgroundColor = .black
        colorView.layer.borderWidth = 7
        
        view.addSubviews(colorView, labelView)
        
        NSLayoutConstraint.activate([
            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorView.widthAnchor.constraint(equalToConstant: 240),
            colorView.heightAnchor.constraint(equalToConstant: 240),
            
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.bottomAnchor.constraint(equalTo: colorView.topAnchor, constant: -25),
            labelView.widthAnchor.constraint(lessThanOrEqualToConstant: 240),
            labelView.heightAnchor.constraint(lessThanOrEqualToConstant: 240)
            
        ])
        
        configureSliderStackView()
        configureSilders()
    }
    
    func configureSliderStackView() {
        let stackView = UIStackView(arrangedSubviews: [redSlider, greenSlider, blueSlider])
        let padding: CGFloat = 50
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubviews(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110)
        ])
    }
    
    func configureSilders() {
        redSlider.slider.addTarget(self, action: #selector(changeColorComponent), for: .valueChanged)
        greenSlider.slider.addTarget(self, action: #selector(changeColorComponent), for: .valueChanged)
        blueSlider.slider.addTarget(self, action: #selector(changeColorComponent), for: .valueChanged)
    }

}
