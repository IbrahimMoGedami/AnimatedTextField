//
//  ViewController.swift
//  AnimatedTextFieldDemo
//
//  Created by Ibrahim Mo Gedami on 30/01/2021.
//

import UIKit
import Localize_Swift

class ViewController: UIViewController , UITextFieldDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var NameLbl: LocalizableLabel!
    
    @IBOutlet weak var PasswordLbl: LocalizableLabel!
    
    @IBOutlet weak var NameTxf: LocalizedTextField!
    @IBOutlet weak var PasswordTxf: LocalizedTextField!
    
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
//    @IBOutlet weak var NameView: UIView!
//    @IBOutlet weak var PasswordView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        NameTxf.delegate = self
        PasswordTxf.delegate = self
        
        self.property()
        
        SignUpBtn.backgroundColor = UIColor.black
        SignUpBtn.setTitleColor(UIColor.white, for: .normal)
        SignUpBtn.layer.borderWidth = 1
        SignUpBtn.layer.borderColor = UIColor.black.cgColor
        
        //Tap guesture recognizer to hide keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == NameTxf{
            
            NameTxf.font = UIFont.italicSystemFont(ofSize: 15)
            NameLbl.isHidden = false
            NameTxf.placeholder = "namePlaceholder".localized()
            NameLbl.text = NameTxf.placeholder
            NameLbl.textColor = #colorLiteral(red: 0.07450980392, green: 0.3294117647, blue: 0.2980392157, alpha: 1)
            //NameView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
        }
        
        else if textField == PasswordTxf
        {
            PasswordTxf.font = UIFont.italicSystemFont(ofSize: 15)
            PasswordLbl.isHidden = false
            PasswordLbl.text = PasswordTxf.placeholder
            PasswordTxf.placeholder = "passwordPlaceholder".localized()
            //            PasswordView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            PasswordLbl.textColor = #colorLiteral(red: 0.07450980392, green: 0.3294117647, blue: 0.2980392157, alpha: 1)
        }
    }
  
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == NameTxf
        {
            if NameTxf.text == ""
            {
                NameTxf.font = UIFont.italicSystemFont(ofSize: 25)
                NameLbl.isHidden = true
                NameLbl.text = NameTxf.placeholder
                NameTxf.placeholder = "namePlaceholder".localized()
                //                NameView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            }else{
                //NameTxf.font = UIFont.italicSystemFont(ofSize: 25)
                //                NameTxf.placeholder = "Name"
                //                //                NameView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
                //                NameLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
        }
        else if textField == PasswordTxf
        {
            if PasswordTxf.text == ""
            {
                PasswordTxf.font = UIFont.italicSystemFont(ofSize: 25)
                PasswordLbl.isHidden = true
                PasswordTxf.placeholder = "passwordPlaceholder".localized()
                //                PasswordView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            }
        }
        
        
    }
    
    //Action on SingUp button Clicked.
    @IBAction func signupClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LanguageVC") as! LanguageVC
            navigationController?.pushViewController(vc, animated: true)
                 
       
        
    }
    
    
    //Function to set the property of Textfields, Views corresponding to TextFields and Labels.
    func property(){
        
        NameLbl.isHidden =  true
        PasswordLbl.isHidden = true
        
        NameTxf.text = ""
        PasswordTxf.text = ""
        
        NameTxf.placeholder = "namePlaceholder".localized()
        PasswordTxf.placeholder = "passwordPlaceholder".localized()
        
        
        self.NameTxf.font = UIFont.italicSystemFont(ofSize: 25)
        self.PasswordTxf.font = UIFont.italicSystemFont(ofSize: 25)
        
        PasswordTxf.isSecureTextEntry = true
        NameTxf.autocorrectionType = .no
        
//        NameView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
//        PasswordView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    }
    
}

