//
//  TipsCustomView.swift
//  Amount per person
//
//  Created by Паша Хоренко on 18.09.2022.
//

import UIKit

class TipsCustomView: UIView {
    
    // MARK: UI-elemants
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tips"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        label.textAlignment = .center
        return label
    }()
    private let tipsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.layer.cornerRadius = 10
        return collectionView
    }()
    
    private let tipsArray = ["5%", "10%", "25%", "50%"]
    private var selectedItemIndexPath: IndexPath?
    var tipCount = 0
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setDelegates
    func setDelegates() {
        tipsCollectionView.delegate = self
        tipsCollectionView.dataSource = self
    }
    
    // MARK: - setupViews
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(tipsCollectionView)
        
        tipsCollectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    
}

// MARK: - UICollectionViewDataSource
extension TipsCustomView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tipsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.tipPercentageLabel.text = tipsArray[indexPath.item]
        
        return cell
    }
    
}


// MARK: - UICollectionViewDelegate
extension TipsCustomView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedItemIndexPath == indexPath {
            
            tipsCollectionView.deselectItem(at: indexPath, animated: true)
            tipCount = 0
            selectedItemIndexPath = nil
            
        } else {
            
            selectedItemIndexPath = indexPath
            
            switch indexPath.item {
            case 0:
                tipCount = 5
            case 1:
                tipCount = 10
            case 2:
                tipCount = 25
            case 3:
                tipCount = 50
            default:
                fatalError("The selected cell does not exist.")
            }
            
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension TipsCustomView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: tipsCollectionView.frame.height * 0.9,
               height: tipsCollectionView.frame.height * 0.9)
    }
}


// MARK: - Constraints
extension TipsCustomView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            tipsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            tipsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tipsCollectionView.heightAnchor.constraint(equalToConstant: 85),
        ])
    }
}
