//
//  ViewController.swift
//  Timer
//
//  Created by Aleksandr Ataev on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var timersData: [TimersData] = []
    let sections: [String] = ["Добавление таймеров", "Таймеры"]
    
    var addTimers = AddTimersCell()
    var timers = TimersCell()
    
    struct Cells {
        static let addTimersCell = "AddTimersCell"
        static let timersCell = "TimersCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мульти таймер"
        timersData = fetchTimers()
        configureTableView()
        setupToHideKeyboardOnTapOnView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(AddTimersCell.self, forCellReuseIdentifier: Cells.addTimersCell)
        tableView.register(TimersCell.self, forCellReuseIdentifier: Cells.timersCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return timersData.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.addTimersCell, for: indexPath) as! AddTimersCell
            tableView.rowHeight = 230
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.timersCell, for: indexPath) as! TimersCell
            let timersData = timersData[indexPath.row]
            cell.set(timersData: timersData)
            tableView.rowHeight = 50
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        cell?.selectionStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return sections[0]
        default:
            return sections[1]
        }
    }
}

extension ViewController {

    func fetchTimers() -> [TimersData] {
        
        let item1 = TimersData(nameTimer: "Timer 1", timer: "10:10")
        let item2 = TimersData(nameTimer: "Timer 2", timer: "04:15")
        let item3 = TimersData(nameTimer: "Timer 3", timer: "03:50")
        let item4 = TimersData(nameTimer: "Timer 4", timer: "12:20")
        let item5 = TimersData(nameTimer: "Timer 5", timer: "23:10")
        let item6 = TimersData(nameTimer: "Timer 6", timer: "20:55")
        let item7 = TimersData(nameTimer: "Timer 7", timer: "16:30")
        let item8 = TimersData(nameTimer: "Timer 8", timer: "17:40")
        let item9 = TimersData(nameTimer: "Timer 9", timer: "06:15")
        let item10 = TimersData(nameTimer: "Timer 10", timer: "15:20")
        
        return [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10]
    }
}

extension ViewController {
    
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
