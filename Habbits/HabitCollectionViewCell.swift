//
//  HabbitCell.swift
//  Habbits
//
//  Created by Никита Васильев on 21.06.2023.
//

import UIKit

final class HabitCollectionViewCell: UITableViewCell {
    
    private var indexPathCell = IndexPath()
    
    func setIndexPath(indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private let contentWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let heart: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image =  UIImage(systemName: "heart.fill")
        imageView.backgroundColor = .white
        imageView.backgroundColor = UIColor.white.withAlphaComponent(0)
        imageView.tintColor = UIColor.red
        imageView.isHidden = true
        return imageView
    }()
    
    private let counter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        descriptionText.text = nil
        counter.text = nil
    }
    
    func setupCell(model: Habbit) {
        name.text = model.name
        descriptionText.text = model.description
        counter.text = "Счетчик: " + String(model.counter)
    }
    
    // MARK: - Making Autolayouts
    
    private func addViews() {
        
        contentView.addSubview(contentWhiteView)
        
        contentWhiteView.addSubview(name)
        contentWhiteView.addSubview(descriptionText)
        contentWhiteView.addSubview(counter)
        
        layout()
    }
    
    // MARK: - Autolayouts
    
    private func layout() {
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            contentWhiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentWhiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentWhiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentWhiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            name.topAnchor.constraint(equalTo: contentWhiteView.topAnchor, constant: inset),
            name.leadingAnchor.constraint(equalTo: contentWhiteView.leadingAnchor, constant: inset),
            name.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -120),
            
            
            descriptionText.topAnchor.constraint(equalTo: name.bottomAnchor, constant: inset/2),
            descriptionText.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            //            descriptionText.trailingAnchor.constraint(equalTo: contentWhiteView.trailingAnchor, constant: -inset),
            
            
            counter.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 25),
            counter.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            counter.bottomAnchor.constraint(equalTo: contentWhiteView.bottomAnchor, constant: -inset)
        ])
    }
}
