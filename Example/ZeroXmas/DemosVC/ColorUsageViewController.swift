//
//  ColorUsageViewController.swift
//  ZeroXmas_Example
//
//  Created by screson on 2019/1/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ColorUsageViewController: ZXUIViewController {

    @IBOutlet weak var tblList: UITableView!
    
    let tintColorList = [("BackgroundColor",UIColor.zx.background,"UIColor.zx.background"),
                         ("TintColor",UIColor.zx.tint,"UIColor.zx.tint"),
                         ("SubTintColor",UIColor.zx.subTint,"UIColor.zx.subTint"),
                         ("BorderColor",UIColor.zx.border,"UIColor.zx.border"),
                         ("EmptyColor",UIColor.zx.empty,"UIColor.zx.empty"),
                         ("CustomAColor",UIColor.zx.customA,"UIColor.zx.customA"),
                         ("CustomBColor",UIColor.zx.customB,"UIColor.zx.customB"),
                         ("CustomCColor",UIColor.zx.customC,"UIColor.zx.customC")]
    
    let textColorList = [("TitleColor",UIColor.zx.title,"UIColor.zx.title"),
                         ("BodyColor",UIColor.zx.body,"UIColor.zx.body"),
                         ("MarkColor",UIColor.zx.mark,"UIColor.zx.mark")]
    
    let navBarColorList = [("Background Color",UIColor.zx.navBar.background,"UIColor.zx.navBar.background"),
                           ("Title Color",UIColor.zx.navBar.title,"UIColor.zx.navBar.title"),
                           ("Button Item Color",UIColor.zx.navBar.buttonText,"UIColor.zx.navBar.buttonText")]
    
    let tabBarColorList = [("Background Color",UIColor.zx.tabBar.background,"UIColor.zx.tabBar.background"),
                           ("Normal Color",UIColor.zx.tabBar.normal,"UIColor.zx.tabBar.normal"),
                           ("Selected Color",UIColor.zx.tabBar.selected,"UIColor.zx.tabBar.selected")]
    
    var lists = [String: [(String, UIColor, String)]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the
        title = "Color Usage"
        lists = ["Tint Color": self.tintColorList,
                "Text Color": self.textColorList,
                "NavigationBar Color": self.navBarColorList,
                "TabBar Color": self.tabBarColorList]
    }
    
}

extension ColorUsageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let temp = lists.values.map { return $0 }
        return temp[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ColorUsageCell.zx.reuseIdentifier) as! ColorUsageCell
        let temp = lists.values.map { return $0 }
        let list = temp[indexPath.section][indexPath.row]
        cell.lbTitle.text = list.0
        cell.colorView.backgroundColor = list.1
        cell.lbCode.text = "code: " + list.2
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let temp = lists.keys.map { return $0 }
        return temp[section]
    }
}


extension ColorUsageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
