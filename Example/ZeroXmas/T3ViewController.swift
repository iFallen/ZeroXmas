//
//  T3ViewController.swift
//  ZeroXmas_Example
//
//  Created by JuanFelix on 2019/1/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class T3ViewController: ZXUIViewController {

    override var preferredHidesBottomBarWhenPushed: Bool { return false }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "SHOW AS PRESENT"
        self.zx.addNavBarButtonItems(textNames: ["关闭"], font: nil, color: UIColor.yellow, at: .left)
        self.zx.addNavBarButtonItems(textNames: ["\u{e673}"], font: UIFont.zx.iconFont(30), color: UIColor.zx.subTint, at: .right, fixSpace: 5)
    }
    
    override func zx_leftBarButtonAction(index: Int) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func zx_rightBarButtonAction(index: Int) {
        UIAlertController.zx.showAlert(withTitle: "Info", message: "Test Message!")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
