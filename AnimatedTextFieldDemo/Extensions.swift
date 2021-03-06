//
//  Extensions.swift
//  AnimatedTextFieldDemo
//
//  Created by Ibrahim Mo Gedami on 02/02/2021.
//

import Foundation

extension String {
    // MARK: Localization
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    public var isEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                     options: .regularExpression, range: nil, locale: nil) != nil
    }
}
