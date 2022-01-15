//
//  LanguageVC.swift
//  AnimatedTextFieldDemo
//
//  Created by Ibrahim Mo Gedami on 02/02/2021.
//

import UIKit

class LanguageVC: UIViewController {
    
    var storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func BackBuTapped(_ sender: LocalizableButton) {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func signupClicked(_ sender: LocalizableButton) {
        
//        self.property()
//        self.dismissKeyboard() //TO dismiss the Keyboard on the click of SIGNUP button.
        guard let window = UIApplication.shared.keyWindow else {return}
        let actionSheet = UIAlertController()
        // change to arabic
        actionSheet.addAction(UIAlertAction(title: "عربي", style: .default, handler: { [weak self] (action:UIAlertAction) in
            guard let self = self else {return}
                Language.setAppLanguage(lang: "ar")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
            
            let vc = self.storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                 
                window.rootViewController = vc
        }))
        // change to english
        actionSheet.addAction(UIAlertAction(title: "English", style: .default, handler: { [weak self](action:UIAlertAction) in
            guard let self = self else {return}

                Language.setAppLanguage(lang: "en")
                //self.mainPre?.getData(lang: "en")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
            let vc = self.storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                window.rootViewController = vc
        }))
        
        if Language.currentLanguage() == "en" {
            actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
            
            self.present(actionSheet, animated: true)
        }
        else {
            actionSheet.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }
        
    }

}
