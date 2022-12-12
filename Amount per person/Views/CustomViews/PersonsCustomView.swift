//
//  PersonsCustomView.swift
//  Amount per person
//
//  Created by Паша Хоренко on 18.09.2022.
//

import UIKit

class PersonsCustomView: UIView {
    
    var personsCounter = 1
    
    // MARK: UI-elemants
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .center
        return label
    }()
    private let personeBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 45 )
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("–", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 50)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    let numberPersonsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.textAlignment = .center
        return label
    }()
    
    @objc func plusButtonTapped() {
        personsCounter += 1
        numberPersonsLabel.text = "\(personsCounter)"
    }
    
    @objc func minusButtonTapped() {
        
        if personsCounter != 1 {
            personsCounter -= 1
            numberPersonsLabel.text = "\(personsCounter)"
        }
    }
    
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
        addSubview(personeBackgroundView)
        addSubview(numberPersonsLabel)
        addSubview(plusButton)
        addSubview(minusButton)
    }
    
    // MARK: - Constraints
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            personeBackgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            personeBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            personeBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            personeBackgroundView.heightAnchor.constraint(equalToConstant: 85),
            
            plusButton.centerYAnchor.constraint(equalTo: personeBackgroundView.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: personeBackgroundView.trailingAnchor, constant: -10),
            plusButton.widthAnchor.constraint(equalTo: personeBackgroundView.heightAnchor, multiplier: 0.9),
            plusButton.heightAnchor.constraint(equalTo: personeBackgroundView.heightAnchor, multiplier: 0.9),
            
            minusButton.centerYAnchor.constraint(equalTo: personeBackgroundView.centerYAnchor),
            minusButton.leadingAnchor.constraint(equalTo: personeBackgroundView.leadingAnchor, constant: 10),
            minusButton.widthAnchor.constraint(equalTo: personeBackgroundView.heightAnchor, multiplier: 0.9),
            minusButton.heightAnchor.constraint(equalTo: personeBackgroundView.heightAnchor, multiplier: 0.9),
            
            numberPersonsLabel.centerXAnchor.constraint(equalTo: personeBackgroundView.centerXAnchor),
            numberPersonsLabel.centerYAnchor.constraint(equalTo: personeBackgroundView.centerYAnchor),
            numberPersonsLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            numberPersonsLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor)
        ])
    }
}
