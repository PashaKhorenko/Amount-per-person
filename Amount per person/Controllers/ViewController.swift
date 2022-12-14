//
//  ViewController.swift
//  Amount per person
//
//  Created by Паша Хоренко on 18.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: UI-elemants
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.textAlignment = .center
        return label
    }()
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "raccoon")
        return imageView
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the bill amount, number of people, tip percentage and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 14)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 3
        return label
    }()
    let totalBillCustomView = TotalBillCustomView()
    let personsCustomView = PersonsCustomView()
    let tipsCustomView = TipsCustomView()
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.2705882353, green: 0.2745098039, blue: 0.3333333333, alpha: 1)
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 25)
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    // MARK: - Keyboard operation
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
    }

    // MARK: - setupViews
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillCustomView)
        view.addSubview(personsCustomView)
        view.addSubview(calculateButton)
        view.addSubview(tipsCustomView)
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillCustomView.totalTextField.text,
              let totalBillInt = Int(totalBill) else {
            descriptionLabel.text = "Enter the bill amount, number of people, tip percentage and click \"Calculate\""
            descriptionLabel.textColor = .red
            return
        }

        let sum = totalBillInt + totalBillInt * tipsCustomView.tipCount / 100
        let persons = personsCustomView.personsCounter
        let result = Double(sum) / Double(persons)
        
        let formattedResult = Int(result.rounded(.up))
        
        if formattedResult == 0 {
            descriptionLabel.text = "Enter the bill amount, number of people, tip percentage and click \"Calculate\""
            descriptionLabel.textColor = .black
        } else {
            descriptionLabel.text = "Bill: \(formattedResult) per person."
            descriptionLabel.textColor = .black
        }
    }
}

// MARK: - Constraints
extension ViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: totalBillCustomView.topAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            totalBillCustomView.bottomAnchor.constraint(equalTo: personsCustomView.topAnchor, constant: -15),
            totalBillCustomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillCustomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillCustomView.heightAnchor.constraint(equalToConstant: 100),
            
            personsCustomView.bottomAnchor.constraint(equalTo: tipsCustomView.topAnchor, constant: -15),
            personsCustomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsCustomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsCustomView.heightAnchor.constraint(equalToConstant: 100),
            
            tipsCustomView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -20),
            tipsCustomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsCustomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsCustomView.heightAnchor.constraint(equalToConstant: 100),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 70),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
