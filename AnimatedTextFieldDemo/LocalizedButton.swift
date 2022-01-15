//
//  LocalizedButton.swift
//  AnimatedTextFieldDemo
//
//  Created by Ibrahim Mo Gedami on 02/02/2021.
//

import UIKit

class LocalizableButton: UIButton {

    private var _arabicText = ""
    private var _englishText = ""
    
    @IBInspectable var arabicText : String {
        set(value){
            _arabicText = value
        }
        get {
            return _arabicText
        }
        
    }
    
    @IBInspectable var englishText : String  {
        set(value){
            _englishText = value
        }
        get{
            return _englishText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        checkforLanguage()
       
    }

    @objc func checkforLanguage() {
        let lang = Language.currentLanguage()
        
        
        if lang.contains("ar") {
            self.setTitle(_arabicText, for: .normal)
            
        }
        else{
            self.setTitle(_englishText, for: .normal)
            self.titleEdgeInsets.left = self.titleEdgeInsets.right
            self.titleEdgeInsets.right = 0

        }
        
//        self.titleLabel?.font = UIFont(name: "Cairo", size: self.titleLabel!.font.pointSize)
    }
    
}
