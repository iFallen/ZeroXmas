//
//  T3ViewController.swift
//  ZeroXmas_Example
//
//  Created by JuanFelix on 2019/1/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class T3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.zx.background
        self.zx.addNavBarButtonItems(textNames: ["关闭"], font: nil, color: nil, at: .left)
    }
    
    override func zx_leftBarButtonAction(index: Int) {
        self.dismiss(animated: true, completion: nil)
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
