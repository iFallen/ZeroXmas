//
//  FontUsageViewController.swift
//  ZeroXmas_Example
//
//  Created by screson on 2019/1/8.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class FontUsageViewController: ZXUIViewController {
    
    let tblList = UITableView()
    
    let titleFontList = [("Default Font Size", UIFont.zx.titleFont(),"UIFont.zx.titleFont()"),
                         ("Set Font Size to 15", UIFont.zx.titleFont(15),"UIFont.zx.titleFont(n)"),
                         ("Default Font Size - 2", UIFont.zx.titleFont(fix: -2),"UIFont.zx.titleFont(fix: -2)"),
                         ("Default Font Size + 3", UIFont.zx.titleFont(fix: 3),"UIFont.zx.titleFont(fix: 3)")]
    let bodyFontList = [("Default Font Size", UIFont.zx.bodyFont(),"UIFont.zx.bodyFontt()"),
                        ("Set Font Size to 15", UIFont.zx.bodyFont(15),"UIFont.zx.bodyFont(n)"),
                        ("Default Font Size - 2", UIFont.zx.bodyFont(fix: -2),"UIFont.zx.bodyFont(fix: -2)"),
                        ("Default Font Size + 3", UIFont.zx.bodyFont(fix: 3),"UIFont.zx.bodyFont(fix: 3)")]

    let markFontList = [("Default Font Size", UIFont.zx.markFont(),"UIFont.zx.markFontFont()"),
                        ("Set Font Size to 15", UIFont.zx.markFont(15),"UIFont.zx.markFontFont(n)"),
                        ("Default Font Size - 2", UIFont.zx.markFont(fix: -2),"UIFont.zx.markFontFont(fix: -2)"),
                        ("Default Font Size + 3", UIFont.zx.markFont(fix: 3),"UIFont.zx.markFontFont(fix: 3)")]
    let iconFont = [("Icon \u{e673} Font", UIFont.zx.iconFont(30),"\n font = UIFont.zx.iconFont(30) \n text = \"Icon \\u{e673} Font\"")
                        ]
    var lists = [(String, [(String, UIFont, String)])]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Font Usage"
        
        tblList.separatorColor = UIColor.zx.border
        tblList.estimatedRowHeight = 60
        tblList.dataSource = self
        tblList.rowHeight = UITableView.automaticDimension
        view.addSubview(tblList)
        tblList.snp.makeConstraints { (make) in
            make.size.equalTo(view)
        }
        
        lists = [("Title Font", self.titleFontList),
                 ("Body Font", self.bodyFontList),
                 ("Mark Font", self.markFontList),
                 ("IconFont", self.iconFont)]
        
        self.zx.addNavBarButtonItems(textNames: ["IconFont"], font: nil, color: UIColor.white, at: .right)

    }
    
    override func zx_rightBarButtonAction(index: Int) {
        URL.zx.openURL("https://www.iconfont.cn/help/detail?spm=a313x.7781069.1998910419.15&helptype=code") {
            UIAlertController.zx.showAlert(withTitle: "Failed", message: $0.description)
        }
    }
}

extension FontUsageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[section].1.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return lists.count
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
        
        
        let list = lists[indexPath.section].1[indexPath.row]
        cell!.textLabel?.text = "eff: " + list.0
        cell!.textLabel?.font = list.1
        cell!.detailTextLabel?.text = "code: " + list.2
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let temp = lists[section]
        return temp.0
    }
}

