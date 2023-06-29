//
//  NewHabbitViewController.swift
//  Habbits
//
//  Created by Никита Васильев on 20.06.2023.
//

import UIKit

class NewHabbitViewController: UIViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        layout()
        title = "Сегодня"
        
        // MARK: - adding buttons in tapbar
        
        let saveButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
        
        let cancelButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
        
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let name: UILabel = {
        let textField = UILabel()
        textField.text = "Название"
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let color: UILabel = {
        let textField = UILabel()
        textField.text = "Цвет"
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let time: UILabel = {
        let textField = UILabel()
        textField.text = "Время"
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var colorImage: UIButton = {
        let imageView = UIButton()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemTeal
        imageView.isUserInteractionEnabled = true
        imageView.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return imageView
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Бегать по утрам, спать 8 часов и тд"
        textField.font = .systemFont(ofSize: 16)
        textField.textAlignment = .left
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.textColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let everyDay: UILabel = {
        let textField = UILabel()
        textField.text = "Каждый день в "
        textField.font = .systemFont(ofSize: 16)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(everyDay)
        contentView.addSubview(name)
        contentView.addSubview(nameTextField)
        contentView.addSubview(time)
        contentView.addSubview(color)
        contentView.addSubview(timePicker)
        contentView.addSubview(colorImage)
        openTimePicker()
    }
    
    // MARK: - Button funcs
    
    @objc func saveButtonTapped() {
        let newHabit = Habit(name: "Выпить стакан воды перед завтраком",
                             date: Date(),
                             color: .systemRed)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTap() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        present(colorPicker, animated: true, completion: nil)
    }
    
    // MARK: - Adding timePicker
    
    let timePicker = UIDatePicker()
    
    func openTimePicker()  {
        timePicker.datePickerMode = UIDatePicker.Mode.time
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.backgroundColor = UIColor.white
        timePicker.addTarget(self, action: #selector(NewHabbitViewController.startTimeDiveChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc func startTimeDiveChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
    }
    
    // MARK: - Autolayouts
    
    func layout() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            nameTextField.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            
            color.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            color.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            
            colorImage.topAnchor.constraint(equalTo: color.bottomAnchor, constant: 8),
            colorImage.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            colorImage.widthAnchor.constraint(equalToConstant: 40),
            colorImage.heightAnchor.constraint(equalToConstant: 40),
            
            time.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            time.topAnchor.constraint(equalTo: color.bottomAnchor, constant: 70),
            
            everyDay.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 8),
            everyDay.leadingAnchor.constraint(equalTo: color.leadingAnchor),
            
            timePicker.leadingAnchor.constraint(equalTo: everyDay.trailingAnchor, constant: 5),
            timePicker.topAnchor.constraint(equalTo: everyDay.topAnchor, constant: -7)
        ])
    }
}

extension NewHabbitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        colorImage.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorImage.backgroundColor = viewController.selectedColor
    }
}
