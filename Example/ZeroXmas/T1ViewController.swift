//
//  T1ViewController.swift
//  ZeroXmas_Example
//
//  Created by JuanFelix on 2019/1/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit


/// Usage
class T1ViewController: ZXUIViewController {
    
    override var preferredHidesBottomBarWhenPushed: Bool { return false }
    
    var tblList: UITableView!
    let itemList = ["Color Usage", "Font Usage", "NavBar Usage", "Keyboard Notice Usage", "Alert Usage", "Date Usage", "Tiny Network Request Usage", "String Value", "Common Utils"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Usage"
        
        tblList = UITableView.init(frame: .zero, style: .plain)
        tblList.delegate = self
        tblList.dataSource = self
        tblList.backgroundColor = UIColor.zx.background
        tblList.separatorColor = UIColor.zx.border
        tblList.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.zx.reuseIdentifier)
        view.addSubview(tblList)
        tblList.snp.makeConstraints { (make) in
            make.size.equalTo(view)
        }
    }
}

extension T1ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.zx.reuseIdentifier, for: indexPath)
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.textLabel?.font = UIFont.zx.titleFont()
        cell.textLabel?.textColor = UIColor.zx.mark
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = UIColor.zx.title
        cell.textLabel?.text = itemList[indexPath.item]
        return cell
    }
}

extension T1ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            navigationController?.pushViewController(FontUsageViewController(), animated: true)
        } else if indexPath.row == 4 {
            navigationController?.pushViewController(AlertUsageViewController(), animated: true)
        } else {//from sb
            guard let type = ZXSBControllerType(rawValue: indexPath.row) else {
                return
            }
            navigationController?.pushViewController(UIStoryboard.zx.controller(type), animated: true)
        }
    }
}
