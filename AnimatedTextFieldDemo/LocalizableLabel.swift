//
//  LocalizableLabel.swift
//  AnimatedTextFieldDemo
//
//  Created by Ibrahim Mo Gedami on 02/02/2021.
//

import UIKit

@IBDesignable
class LocalizableLabel: UILabel {
    
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
            self.text = _arabicText
            if self.textAlignment != .center {
                self.textAlignment = .right
            }
            
        }
        else{
            self.text = _englishText
            if self.textAlignment != .center{
                self.textAlignment = .left
            }
            
        }
        
        self.font = UIFont(name: "Cairo", size: self.font.pointSize)
    }
    
    
}
