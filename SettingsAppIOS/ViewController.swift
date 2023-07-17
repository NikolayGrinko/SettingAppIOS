//
//  ViewController.swift
//  SettingsAppIOS
//
//  Created by Николай Гринько on 18.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private let tibleView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

