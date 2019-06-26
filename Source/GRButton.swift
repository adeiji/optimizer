//
//  GRCameraButton.swift
//  Graffiti
//
//  Created by adeiji on 4/6/18.
//  Copyright © 2018 Dephyned. All rights reserved.
//

import UIKit

public class GRButton : UIButton {
    
    let type: GRButtonType
    var userSelected = false
    
    init(type: GRButtonType) {
        self.type = type
        super.init(frame: .zero)
        self.contentEdgeInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
        self.titleLabel?.font = UIFont(name: FontNames.allBold.rawValue, size: FontSizes.Small.rawValue)
    }        
    
    func setBackgroundColor (number: Int? = nil) {
        var num = number
        if num == nil {
            num = Int(arc4random_uniform(10))
        }
        
        switch num {
        case 0:
            self.backgroundColor = UIColor.Style.htPeach
        case 1:
            self.backgroundColor = UIColor.Style.htTeal
        case 2:
            self.backgroundColor = UIColor.Style.htBlueish
        case 3:
            self.backgroundColor = UIColor.Style.htRedish
        case 4:
            self.backgroundColor = UIColor.Style.htLightPurple
        case 5:
            self.backgroundColor = UIColor.Style.htLightBlue
        case 6:
            self.backgroundColor = UIColor.Style.htLightGreen
        case 7:
            self.backgroundColor = UIColor.Style.htLightOrange
        case 8:
            self.backgroundColor = UIColor.Style.htDarkPurple
        case 9:
            self.backgroundColor = UIColor.Style.htDookieGreen
        default:
            break;
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.clearsContextBeforeDrawing = false
        self.showsTouchWhenHighlighted = true

        if self.type == .Back {
            GraffitiStyle.drawBack(frame: rect, resizing: .aspectFill)
        } 
    }
}
