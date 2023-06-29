//
//  InfoViewController.swift
//  Habbits
//
//  Created by Никита Васильев on 19.06.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        layout()
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let info: UILabel = {
        let textField = UILabel()
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.text = "asgfdgdfgdfgdfgdfgdffgds"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.numberOfLines = 0
        return textField
    }()
    
    private let infoText: UILabel = {
        let textField = UILabel()
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.text = "asgfdgdfgdfgdfgdfgdffgds"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.numberOfLines = 0
        return textField
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Autolayouts
    
    func layout() {
        
        view.addSubview(scrollView)
        
        UIKit.NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(infoText)
        
        UIKit.NSLayoutConstraint.activate([
            
            infoText.topAnchor.constraint(equalTo: scrollView.topAnchor),
            infoText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            infoText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoText.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
    }
}



