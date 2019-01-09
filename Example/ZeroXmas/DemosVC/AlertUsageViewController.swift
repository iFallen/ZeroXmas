//
//  AlertUsageViewController.swift
//  ZeroXmas_Example
//
//  Created by screson on 2019/1/9.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class AlertUsageViewController: ZXUIViewController {
    
    let tblList = UITableView()
    
    let alertList = [("Show Message", "UIAlertController.zx.showAlert(withTitle: String?, message: String?)"),
                     ("Show Message with Action", "UIAlertController.zx.showAlert(wihtTitle: String?, message: String?, buttonText: String?, action: (() -> Void)?)"),
                     ("Show Message with Actions", "UIAlertController.zx.showAlert(wihtTitle: String?, message: String?, buttonTexts: Array<String>, action: ((Int) -> Void)?)")]
    
    let actionSheetList = [("Show Message", "UIAlertController.zx.showActionSheet(withTitle: String?, message: String?, buttonTexts: Array<String>, cancelText: String?, action: ((Int) -> Void)?)"),
                            ("Show Message from sender [for iPad]", "        UIAlertController.zx.showActionSheet(withTitle: String?, message: String?, buttonTexts: Array<String>, cancelText: String?, sender: UIView?, action: ((Int) -> Void)?)")]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alert Usage"
        
        tblList.separatorColor = UIColor.zx.border
        tblList.estimatedRowHeight = 60
        tblList.dataSource = self
        tblList.delegate = self
        tblList.rowHeight = UITableView.automaticDimension
        view.addSubview(tblList)
        tblList.snp.makeConstraints { (make) in
            make.size.equalTo(view)
        }
    }
    
}

extension AlertUsageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if indexPath.section == 0 {
                switch indexPath.row {
                case 0:
                    UIAlertController.zx.showAlert(withTitle: "Title", message: "Message")
                case 1:
                    UIAlertController.zx.showAlert(withTitle: "Title", message: "Message", buttonText: nil) {
                        print("Action")
                    }
                case 2:
                    UIAlertController.zx.showAlert(withTitle: "Title", message: "Message", buttonTexts: ["Action1", "Action2", "Action3"]) { (index) in
                        print("Action index \(index)")
                    }
                default: break
                }
            } else {
                if indexPath.row == 0 {
                    if UIDevice.zx.isPad {
                        UIAlertController.zx.showActionSheet(withTitle: "Title", message: "Message", buttonTexts: ["Action1", "Action2"], cancelText: nil, sender: tableView.cellForRow(at: indexPath)) { (index) in
                            print("Action sheet button action index \(index)")
                        }
                    } else {
                        UIAlertController.zx.showActionSheet(withTitle: nil, message: "Message", buttonTexts: ["Action1", "Action2"], cancelText: nil) { (index) in
                            print("Action index \(index)")
                        }
                    }
                    
                } else {
                    UIAlertController.zx.showActionSheet(withTitle: "Title", message: "Message", buttonTexts: ["Action1", "Action2"], cancelText: nil, sender: self.navigationController?.navigationBar) { (index) in
                        print("Action sheet button action index \(index)")
                    }
                }
            }
        }
    }
}
extension AlertUsageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return alertList.count
        }
        return actionSheetList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? =
            tableView.dequeueReusableCell(withIdentifier: UITableViewCell.zx.reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
                                   reuseIdentifier: UITableViewCell.zx.reuseIdentifier)
            cell?.selectionStyle = .none
        }
        cell!.textLabel?.textColor = UIColor.zx.title
        cell!.detailTextLabel?.font = UIFont.zx.bodyFont()
        cell!.detailTextLabel?.textColor = UIColor.zx.tint
        cell!.detailTextLabel?.numberOfLines = 0
        
        var list: (String, String)!
        if indexPath.section == 0 {
            list = alertList[indexPath.row]
        } else {
            list = actionSheetList[indexPath.row]
        }
        cell!.textLabel?.text = list?.0
        cell!.detailTextLabel?.text = (list?.1)!
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Alert"
        }
        return "Action Sheet"
    }
}


