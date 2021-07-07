//
//  TimersCell.swift
//  Timer
//
//  Created by Aleksandr Ataev on 06.07.2021.
//

import UIKit

class TimersCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let timerLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timerLabel)
        configureNameLabel()
        configureTimerLabel()
        setNameLabelConstraints()
        setTimerLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(timersData: TimersData) {
        nameLabel.text = timersData.nameTimer
        timerLabel.text = timersData.timer
    }
    
    
    func configureNameLabel() {
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textAlignment = .left
    }
    
    func configureTimerLabel() {
        timerLabel.adjustsFontSizeToFitWidth = true
        timerLabel.textAlignment = .right
    }
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
    }
    
    func setTimerLabelConstraints() {
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timerLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20).isActive = true
        timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
