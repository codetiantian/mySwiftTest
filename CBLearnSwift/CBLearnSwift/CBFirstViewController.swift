//
//  CBFirstViewController.swift
//  CBLearnSwift
//
//  Created by Elaine on 15--5.
//  Copyright © 2015年 yinuo. All rights reserved.
//

import UIKit

protocol CBChageNameDelegate {
    //  代理方法

    func changeNameWithStr(strName : String, index : NSIndexPath)
}

typealias CBChangeNameBlock = (strName : String, index : NSIndexPath)->()

class CBFirstViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    var indexPath : NSIndexPath?
    var delegate : CBChageNameDelegate?
    
    var block : CBChangeNameBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // MARK:按钮点击
    @IBAction func sendButtonClicked(sender: UIButton) {
        if self.nameTextField.text?.characters.count == 0 {
            print("输入不能为空")
        } else {
//            print(self.nameTextField.text!)
//            self.delegate?.changeNameWithStr(self.nameTextField.text!, index: self.indexPath!)
            if  self.block != nil {
                self.block!(strName: self.nameTextField.text!, index : self.indexPath!);
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return  true
    }
}
