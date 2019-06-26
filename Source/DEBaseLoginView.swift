//
//  DEBaseLoginView.swift
//  Graffiti
//
//  Created by adeiji on 4/13/18.
//  Copyright © 2018 Dephyned. All rights reserved.
//

import UIKit

public class DEBaseLoginView: UIView {

    var textFields = [UITextField]()
    var buttons = [UIButton]()
    weak var errorLabel:UILabel!
    
    var kSideMargin = 30
    var kHeight = 45
    
    func setup (superview: UIView, shouldShowLogo: Bool, textFieldsPlaceholders: [String], buttonTitles: [String], labelLogoText: String!, shouldShowSignUp: Bool) {
        superview.addSubview(self)
        self.backgroundColor = .white
        self.snp.makeConstraints { (make) in
            make.edges.equalTo(superview)
        }
        var viewAbove:UIView!
        
        if shouldShowLogo {
            let text = labelLogoText != nil ? labelLogoText : "graffiti"
            let labelLogo = Style.label(withText: text!, fontName: .all, size: .Logo, superview: self, textColor: UIColor.Style.darkBlueGrey)
            labelLogo.snp.makeConstraints { (make) in
                make.top.equalTo(self).offset(75)
                make.centerX.equalTo(self)
            }
            viewAbove = labelLogo
        }
        
        // Goes above username
        let errorMessageLabel = Style.label(withText: "", fontName: .all, size: .VerySmall, superview: self, textColor: UIColor.Style.darkBlueGrey)
        errorMessageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(kSideMargin)
            make.right.equalTo(self).offset(kSideMargin)
            if viewAbove == nil {
                make.top.equalTo(self).offset(100)
            } else {
                make.top.equalTo(viewAbove.snp.bottom).offset(35)
            }
        }
        self.errorLabel = errorMessageLabel
        
        viewAbove = self.errorLabel
        
        for placeholder in textFieldsPlaceholders {
            let textField = Style.wideTextField(withPlaceholder: placeholder, superview: self, color: UIColor.Style.darkBlueGrey)
            textField.snp.makeConstraints { (make) in
                make.left.equalTo(self).offset(kSideMargin)
                make.right.equalTo(self).offset(-kSideMargin)
                make.height.equalTo(kHeight)
                if viewAbove != nil {
                    make.top.equalTo(viewAbove.snp.bottom).offset(Sizes.smallMargin.rawValue)
                } else {
                    make.top.equalTo(self).offset(100)
                }
            }
            
            textField.autocapitalizationType = .none
            textField.layer.cornerRadius = 5
            self.textFields.append(textField)
            viewAbove = textField
        }
        
        
        if shouldShowSignUp {
            let labelNoAccount = Style.label(withText: "Don't have an account", fontName: .all, size: .VerySmall, superview: self, textColor: UIColor.Style.darkBlueGrey)
            labelNoAccount.snp.makeConstraints { (make) in
                make.left.equalTo(self).offset(kSideMargin)
                make.top.equalTo(viewAbove.snp.bottom).offset(5)
            }
            
            let signUpButton = Style.clearButton(with: "Sign Up", superview: self, fontSize: .Small)
            signUpButton.snp.makeConstraints { (make) in
                make.left.equalTo(labelNoAccount.snp.right).offset(2)
                make.centerY.equalTo(labelNoAccount)
            }
            viewAbove = signUpButton
        }
        
        for title in buttonTitles {
            let extraButton = Style.largeButton(with: title, superview: self, backgroundColor: UIColor.Style.darkBlueGrey, fontColor: .white)            
            extraButton.snp.makeConstraints { (make) in
                make.centerX.equalTo(self)
                make.top.equalTo(viewAbove.snp.bottom).offset(40)
                make.left.equalTo(self).offset(kSideMargin)
                make.right.equalTo(self).offset(-kSideMargin)
                make.height.equalTo(kHeight)
            }
            extraButton.layer.cornerRadius = 5.0
            self.buttons.append(extraButton)
            viewAbove = extraButton
        }

        
    }
}
