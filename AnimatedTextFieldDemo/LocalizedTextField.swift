//
//  LocalizedTextField.swift
//  AnimatedTextFieldDemo
//
//  Created by Ibrahim Mo Gedami on 02/02/2021.
//

import UIKit

class LocalizedTextField : UITextField {
    
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkforLanguage), name: NSNotification.Name("checkForLang"), object: nil)
        
        checkforLanguage()
    }
    
    @objc func checkforLanguage() {
        let lang = Language.currentLanguage()
        
        
        if lang.contains("ar") {
            let rightParagraphStyle = NSMutableParagraphStyle()
            rightParagraphStyle.alignment = .right
            let attributedPlaceholder = NSAttributedString(string: _arabicText, attributes: [NSAttributedString.Key.paragraphStyle: rightParagraphStyle])
            self.textAlignment = .right
            self.attributedPlaceholder = attributedPlaceholder
            
        }
        else{
            let leftParagraphStyle = NSMutableParagraphStyle()
            leftParagraphStyle.alignment = .left
            let attributedPlaceholder = NSAttributedString(string: _englishText, attributes: [NSAttributedString.Key.paragraphStyle: leftParagraphStyle])
            self.textAlignment = .left
            self.attributedPlaceholder = attributedPlaceholder
            
        }
        self.font = UIFont(name: "Cairo", size: self.font!.pointSize)
    }
}
