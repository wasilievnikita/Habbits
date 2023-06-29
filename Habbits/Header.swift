//
//  Header.swift
//  Habbits
//
//  Created by Никита Васильев on 21.06.2023.
//

import UIKit

class Header: UIView {
    
    
    
    private let today: UILabel = {
        let textField = UILabel()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Сегодня"
        textField.font = UIFont(name: "HelveticaNeue", size: 30)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(today)
    }
    
    func tuneView() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
    
            today.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            today.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            today.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
    
        ])
    }
}
