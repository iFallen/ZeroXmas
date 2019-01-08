//
//  T2ViewController.swift
//  ZeroXmas_Example
//
//  Created by JuanFelix on 2019/1/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class T2ViewController: ZXUIViewController {

    override var preferredHidesBottomBarWhenPushed: Bool { return false }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "TabbarItem Use Origin Image"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
