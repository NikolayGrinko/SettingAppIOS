//
//  ViewController.swift
//  SettingsAppIOS
//
//  Created by Николай Гринько on 18.07.2023.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingOptionsType]
}

enum SettingOptionsType {
    case staticCell(model: SettingOptions)
    case switchCell(model: SettingSwitchOptions)
}

struct SettingSwitchOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    let isOn: Bool
}

struct SettingOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        models.append(Section(title: "General", options: [
            .switchCell(model: SettingSwitchOptions(title: "Airplane mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed, handler: {
            }, isOn: true)),
        ]))
        models.append(Section(title: "General", options: [
            .staticCell(model: SettingOptions(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped first cell")
            }),
            .staticCell(model: SettingOptions(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
            }),
            .staticCell(model: SettingOptions(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingOptions(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
            }),
        ]))
        models.append(Section(title: "Informations", options: [
            .staticCell(model: SettingOptions(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            }),
            .staticCell(model: SettingOptions(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
            }),
            .staticCell(model: SettingOptions(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingOptions(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
            }),
        ]))
        models.append(Section(title: "Apps", options: [
            .staticCell(model: SettingOptions(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
            }),
            .staticCell(model: SettingOptions(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
            }),
            .staticCell(model: SettingOptions(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
            }),
            .staticCell(model: SettingOptions(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
            }),
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}

