//
//  HabitsViewController.swift
//  Habbits
//
//  Created by Никита Васильев on 19.06.2023.
//

import UIKit

class HabitsViewController: UIViewController {
    
    var delegate: UITableViewDelegate?
    
    var allHabbits = Habbit.maketHabbit()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HabitCollectionViewCell.self, forCellReuseIdentifier: HabitCollectionViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        layout()
        setupHeader()
    }
    
    func setupHeader() {
        let textField = UILabel()
        textField.font = UIFont(name: "HelveticaNeue", size: 30)
        textField.text = "Сегодня"
        textField.frame(forAlignmentRect: CGRect(x: 0, y: 100, width: 10, height: 200))
        self.navigationItem.titleView = textField
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let buttonAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        navigationItem.rightBarButtonItem = buttonAdd
        
    }
    
    // MARK: - adding NewHabbitViewController
    
    @objc func add() {
        let newHabbitViewController = NewHabbitViewController()
        newHabbitViewController.modalPresentationStyle = .fullScreen
        present(newHabbitViewController, animated: true)
    }
    
    // MARK: - Autolayouts
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HabitsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allHabbits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitCollectionViewCell.identifier, for: indexPath) as! HabitCollectionViewCell
        cell.setupCell(model: allHabbits[indexPath.row])
        //            cell.delegate = self
        cell.setIndexPath(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

extension HabitsViewController: UITableViewDelegate {
}

