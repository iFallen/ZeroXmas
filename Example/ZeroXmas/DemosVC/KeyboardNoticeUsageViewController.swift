
//
//  KeyboardNoticeUsageViewController.swift
//  ZeroXmas_Example
//
//  Created by JuanFelix on 2019/1/9.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class KeyboardNoticeUsageViewController: ZXUIViewController {

    @IBOutlet weak var bottomOffset: NSLayoutConstraint!
    @IBOutlet weak var lbMessageInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Keyboard Notice Usage"
        //Keyboard Notifiaction
        self.zx.addKeyboardNotification()
        //Application Notification
        self.zx.addApplicationNotification()
    }
    
    deinit {
        self.zx.removeKeyboardNotification()
        self.zx.removeApplicationNotification()
    }

    @IBAction func touchDown(_ sender: Any) {
        self.view.endEditing(true)
    }
}

//MARK: - Keyboard Notifiaction
extension KeyboardNoticeUsageViewController {
    override func zx_keyboardWillShow(duration dt: Double, userInfo: Dictionary<String, Any>) {
        self.lbMessageInfo.text = "keyboardWillShow"
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        transition.isRemovedOnCompletion = true
        self.lbMessageInfo.layer.add(transition, forKey: nil)
    }
    
    override func zx_keyboardWillChangeFrame(beginRect: CGRect, endRect: CGRect, duration dt: Double, userInfo: Dictionary<String, Any>) {
        self.bottomOffset.constant = endRect.size.height
        UIView.animate(withDuration: dt) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func zx_keyboardWillHide(duration dt: Double, userInfo: Dictionary<String, Any>) {
        self.lbMessageInfo.text = "keyboardWillHide"
        self.bottomOffset.constant = 0
        UIView.animate(withDuration: dt) {
            self.view.layoutIfNeeded()
        }
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        transition.isRemovedOnCompletion = true
        self.lbMessageInfo.layer.add(transition, forKey: nil)
        
    }
}

extension KeyboardNoticeUsageViewController {
    override func zx_appWillResignActive(notice: Notification) {
        print("zx_appWillResignActive")
    }
    
    override func zx_appWillEnterForeground(notice: Notification) {
        print("zx_appWillEnterForeground")
    }
    
    override func zx_appDidBecomeActive(notice: Notification) {
        print("zx_appDidBecomeActive")
    }
    
    override func zx_appDidEnterBackground(notice: Notification) {
        print("zx_appDidEnterBackground")
    }
    
    override func zx_appWillTerminate(notice: Notification) {
        print("zx_appWillTerminate")
    }

}

extension KeyboardNoticeUsageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
