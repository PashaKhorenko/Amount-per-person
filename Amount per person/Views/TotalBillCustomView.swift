//
//  TotalBillCustomView.swift
//  Amount per person
//
//  Created by Паша Хоренко on 18.09.2022.
//

import UIKit

class TotalBillCustomView: UIView {
    
    // MARK: UI-elemants
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    let totalTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.textAlignment = .center
        textField.tintColor = #colorLiteral(red: 0.2705882353, green: 0.2745098039, blue: 0.3333333333, alpha: 1)
        textField.font = UIFont(name: "Avenir Next Bold", size: 40)
        textField.placeholder = "10 000"
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(totalTextField)
    }
    
    // MARK: - Constraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            totalTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            totalTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalTextField.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
}

