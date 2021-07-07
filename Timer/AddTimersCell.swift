//
//  addTimersCell.swift
//  Timer
//
//  Created by Aleksandr Ataev on 06.07.2021.
//

import UIKit

class AddTimersCell: UITableViewCell {
    
    let nameTextField = UITextField()
    let timeInSecTextField = UITextField()
    let addButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameTextField)
        contentView.addSubview(timeInSecTextField)
        contentView.addSubview(addButton)
        configureNameTextField()
        configureTimeInSecTextField()
        configureAddButton()
        setNameTextFieldConstraints()
        setTimeInSecTextFieldConstraints()
        setAddButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNameTextField() {
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "Название таймера"
        nameTextField.textAlignment = .left
    }
    
    func configureTimeInSecTextField() {
        timeInSecTextField.borderStyle = .roundedRect
        timeInSecTextField.placeholder = "Время в секундах"
        timeInSecTextField.textAlignment = .left
    }
    
    func configureAddButton() {
        addButton.backgroundColor = .secondarySystemBackground
        addButton.layer.cornerRadius = 12
        addButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
    }
    
    func setNameTextFieldConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    func setTimeInSecTextFieldConstraints() {
        timeInSecTextField.translatesAutoresizingMaskIntoConstraints = false
        timeInSecTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15).isActive = true
        timeInSecTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        timeInSecTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130).isActive = true
        timeInSecTextField.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    func setAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: timeInSecTextField.bottomAnchor, constant: 35).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
