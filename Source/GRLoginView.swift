//
//  GRLoginView.swift
//  Graffiti
//
//  Created by adeiji on 4/5/18.
//  Copyright © 2018 Dephyned. All rights reserved.
//

import UIKit

public class GRLoginView: UIView {

    weak var skipButton:UIButton!
    weak var eulaButton:UIButton!
    
    func setup (with superview:UIView) {
        superview.addSubview(self)
        self.backgroundColor = .white
        self.snp.makeConstraints { (make) in
            make.edges.equalTo(superview)
        }
        
        let labelLogo = Style.label(withText: "graffiti", fontName: .all, size: .logo, superview: self, color: UIColor.Style.darkBlueGrey)
        labelLogo.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(75)
            make.centerX.equalTo(self)
        }

        let eula = Style.label(withText: "By signing up you agree to our", size: .verySmall, superview: self, color: UIColor.Style.darkBlueGrey)
        eula.snp.makeConstraints { (make) in
            make.centerX.equalTo(labelLogo)
            make.bottom.equalTo(self).offset(-30)
        }
        
        let eulaButton = Style.clearButton(with: "Terms and Aggrements", superview: self, fontSize: .verySmall, color: UIColor.Style.darkBlueGrey, font: .allBold)
        eulaButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(labelLogo)
            make.top.equalTo(eula.snp.bottom).offset(-5)
        }
        self.eulaButton = eulaButton;
        
        let skipButton = Style.clearButton(with: "Click here to skip logging in for now", superview: self, fontSize: .small)
        skipButton.isHidden = true
        skipButton.setTitleColor(UIColor.Style.darkBlueGrey, for: .normal)
        skipButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-5)
        }
        self.skipButton = skipButton
        
    }

}
