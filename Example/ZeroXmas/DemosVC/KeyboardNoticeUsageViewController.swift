
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
        self.zx.addKeyboardNotification()
    }
    
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
    
    deinit {
        self.zx.removeKeyboardNotification()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func touchDown(_ sender: Any) {
        self.view.endEditing(true)
    }
    
}

extension KeyboardNoticeUsageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
