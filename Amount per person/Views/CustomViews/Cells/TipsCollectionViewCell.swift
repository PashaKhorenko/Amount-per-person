//
//  TipsCollectionViewCell.swift
//  Amount per person
//
//  Created by Паша Хоренко on 18.09.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    // MARK: UI-elemants
    let tipPercentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5%"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 30)
        label.textAlignment = .center
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderColor = #colorLiteral(red: 0.2705882353, green: 0.2745098039, blue: 0.3333333333, alpha: 1)
                UIView.animate(withDuration: 0.1) {
                    self.layer.borderWidth = 3
                }
            } else {
                UIView.animate(withDuration: 0.1) {
                    self.layer.borderWidth = 0
                }
                
            }
        }
    }
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstreints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setConstreints
    func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9490196078, blue: 0.9411764706, alpha: 1)
        layer.cornerRadius = 10
        addSubview(tipPercentageLabel)
    }
    
    // MARK: setConstreints
    func setConstreints() {
        NSLayoutConstraint.activate([
            tipPercentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            tipPercentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
