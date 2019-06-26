//
//  GRCard.swift
//  PMULibrary
//
//  Created by adeiji on 2019/3/28.
//  Copyright © 2019 Dephyned. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public struct GRCardSet {
    let content:UIView
    let width:CGFloat
    let height:CGFloat?
    var newLine:Bool
    let showMargins:Bool
    let name:String?
    
    /// Initialize the GRCardSet object
    ///
    /// - Parameters:
    ///   - content: The view to associate with the card
    ///   - width: The width of the view, in increments of 1.0.  With 1.0 being the smallest, and 12.0 being full screen
    ///   - height: The height in pixels of the view
    ///   - newLine: Whether you want this card to appear on a new line or on the same line with the previous card
    ///   - showMargins: Do you want to show the standard margins on the left and righth side of this view
    ///   - shouldOverlay: Should you overlay this object to it's superview
    ///   - name: The name of the element, this is important if you need to debug, you can use this name to know which element is being looked at when debugging.
    init(content: UIView, width: CGFloat, height:CGFloat? = nil, newLine: Bool = true, showMargins:Bool = false, name: String? = nil) {
        self.content = content
        self.width = width
        self.height = height
        self.newLine = newLine
        self.showMargins = showMargins
        self.name = name
    }
}

/// A GRCard is a basically a container that contains elements organized in a very specific way
/// They can be stacked horizontally or vertically
/// A GRCard differs from a Stack View in that a Stack View is used to split a view into equal sizes whereas a GRCard can have elements of all sizes
/// organized within it.
/*:
    How to use the card
 
    let cardSet1 = GRCardSet(content: UIView(), width: 12.0, height: nil, newLine: true, showMargins: true, name: "RandomGenericButton")
    let cardSet2 = GRCardSet(content: UIView(), width: 12.0, height: nil, newLine: true, showMargins: true, name: "RandomGenericButton2")
    let card = GRCard(color: .white)
    card.addElements(elements: [cardSet1, cardSet2])
    card.addToSuperview(superview: self.view, margin: Sizes.smallMargin.rawValue, viewAbove:nil, anchorToBottom:false)
 */
public class GRCard : UIView {
    
    weak var header:UIView?
    weak var topConstraint:Constraint?
    
    weak var viewAbove: UIView?
    /// The margin that should be around this card
    var margin: CGFloat?
    /// Whether or not this card should be anchored to the bottom of it's superview
    var anchorToBottom:Bool?
    var elements:[GRCardSet] = [GRCardSet]()
    
    init(color: UIColor?) {
        super.init(frame: .zero)
        if let color = color {
            self.backgroundColor = color;
        } else {
            self.backgroundColor = .white
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func GetSpacer (height: CGFloat, color: UIColor = .clear, showMargins: Bool = true) -> GRCardSet {
        let view = UIView()
        view.backgroundColor = color
        return GRCardSet(content: view, width: 12.0, height: height, newLine: true, showMargins: showMargins)
    }
    
    class func GetSeperator (color: UIColor, showMargins: Bool = false) -> GRCardSet {
        let view = UIView()
        view.backgroundColor = color
        let seperator = GRCardSet(content: view, width: 12.0, height: 0.5, newLine: true, showMargins: showMargins, name: nil)
        return seperator
    }
    
    // This is the constraint that attaches the last element to the bottom of the Card
    var bottomConstraint:Constraint?
    
    func slideDownAndRemove (superview: UIView) {
        
        if let topConstraint = self.topConstraint {
            topConstraint.update(offset: 5000)
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            superview.layoutIfNeeded()
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    func slideUpAndRemove (superview: UIView) {
        
        if let topConstraint = self.topConstraint {
            topConstraint.update(offset: -5000)
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            superview.layoutIfNeeded()
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    
    
    /// Slide the card up from the bottom of the screen, and adds the view to the superview
    ///
    /// - Parameters:
    ///   - superview: Add the card to this superview
    ///   - margin: The margins relative to the superview
    func slideDown (superview:UIView, margin: CGFloat) {
        
        superview.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.left.equalTo(superview).offset(margin)
            make.right.equalTo(superview).offset(-margin)
            make.bottom.equalTo(superview.snp.top)
        }
        
        superview.layoutIfNeeded()
        
        self.snp.remakeConstraints { (make) in
            make.left.equalTo(superview).offset(margin)
            make.right.equalTo(superview).offset(-margin)
            self.topConstraint = make.top.equalTo(superview).offset(margin).constraint
        }
        
        UIView.animate(withDuration: 0.2) {
            superview.layoutIfNeeded()
        }
    }
    
    
    /// Slide the card up from the bottom of the screen, and adds the view to the superview
    ///
    /// - Parameters:
    ///   - superview: Add the card to this superview
    ///   - margin: The margins relative to the superview
    func slideUp (superview:UIView, margin: CGFloat) {
        
        superview.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.left.equalTo(superview).offset(margin)
            make.right.equalTo(superview).offset(-margin)
            make.top.equalTo(superview.snp.bottom)
        }
        
        superview.layoutIfNeeded()
        
        self.snp.remakeConstraints { (make) in
            make.left.equalTo(superview).offset(margin)
            make.right.equalTo(superview).offset(-margin)
            self.topConstraint = make.bottom.equalTo(superview).offset(-margin).constraint
        }
        
        UIView.animate(withDuration: 0.2) {
            superview.layoutIfNeeded()
        }
    }
    
    
    /// Add the card to a view
    ///
    /// - Parameters:
    ///   - superview: The view to add the card to
    ///   - margin: The margin for the view
    ///   - viewAbove: If there is a view you want this card to be below
    ///   - anchorToBottom: Whether the card should be anchored to the bottom of the view
    func addToSuperview (superview: UIView, margin: CGFloat, viewAbove: UIView?, anchorToBottom:Bool = false) {
        superview.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.left.equalTo(superview).offset(margin)
            make.right.equalTo(superview).offset(-margin)
            
            make.width.equalTo(UIScreen.main.bounds.size.width - (margin * 2.0))
            
            if let viewAbove = viewAbove {
                self.topConstraint = make.top.equalTo(viewAbove.snp.bottom).offset(margin).constraint
            } else {
                self.topConstraint = make.top.equalTo(superview).offset(margin).constraint
            }
            
            if anchorToBottom {
                make.bottom.equalTo(superview).offset(-margin)
            }
        }
        
        self.margin = margin
        self.viewAbove = viewAbove
        self.anchorToBottom = anchorToBottom
        
    }
    
    /// Adds a header to the card of type UILabel
    ///
    /// - Parameter label: The label to add as the header
    func setHeader (header: String) {
        
        let label = Style.label(withText: header, superview: self);
        self.header = label;
        
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.top.equalTo(self).offset(Sizes.smallMargin.rawValue)
        }
        
        label.text = header;
    }
    
    /// Add an element to the card
    ///
    /// - Parameter element: The element to add to the card
    func addElement (element: GRCardSet, atIndex:Int? = nil) {
        if let bottomConstraint = self.bottomConstraint {
            bottomConstraint.deactivate()
        }
        
        if let index = atIndex {
            self.elements.insert(element, at: index)
        } else {
            self.elements.append(element);
        }
        
        self.addElements(elements: self.elements);
    }
    
    func addElements (elements: [GRCardSet]) {
        var index = 0;
        
        if elements.first == nil {
            return
        }
        
        if (self.elements.count == 0) {
            self.elements.append(contentsOf: elements)
        }
        
        var elementAbove = elements.first!.content
        
        elements.forEach { (element) in
            element.content.removeFromSuperview()
            self.addSubview(element.content)
            
            element.content.snp.makeConstraints({ (make) in
                if (element.content == elements.first?.content) {
                    if let header = header {
                        // Set the top of this element relative to the header label
                        make.top.equalTo(header.snp.bottom).offset(Sizes.smallMargin.rawValue)
                    } else {
                        // Set the top of this element relative to the card's top
                        make.top.equalTo(self).offset(Sizes.smallMargin.rawValue)
                    }
                } else {
                    if element.newLine {
                        // Set the top of this element relative to the element above it
                        make.top.equalTo(elementAbove.snp.bottom).offset(Sizes.smallMargin.rawValue)
                        elementAbove = element.content
                        
                    } else {
                        make.top.equalTo(elements[index - 1].content)
                        // Set the left and right margins relative to the card
                    }
                }
                // LEFT CONSTRAINT
                if (element.newLine) {
                    if element.showMargins {
                        // Set the left margins relative to the card
                        make.left.equalTo(self).offset(Sizes.smallMargin.rawValue)
                    } else {
                        make.left.equalTo(self)
                    }
                } else {
                    if element.showMargins {
                        make.left.equalTo(elements[index - 1].content.snp.right).offset(Sizes.smallMargin.rawValue)
                    } else {
                        make.left.equalTo(elements[index - 1].content.snp.right)
                    }
                }
                
                // If element is a text field than give it a specific height
                if (element.content.isKind(of: UITextField.self)) {
                    make.height.equalTo(Sizes.TextFieldOrLargeButtonHeight.rawValue)
                } else if let height = element.height {
                    make.height.equalTo(height)
                }
                
                // WIDTH OR RIGHT CONSTRAINT
                // Set the right contraint or the width.  If the element is full screen and we want to show the margins than we set the right constraint, otherwise we set the elements width
                if (element.width == 12.0 && element.showMargins) {
                    make.right.equalTo(self).offset(-Sizes.smallMargin.rawValue)
                } else {
                    if element.width != 12.0 {
                        make.width.equalTo(self.getWidth(width: element.width, showMargins: element.showMargins))
                    } else {
                        make.width.equalTo(self)
                    }
                }
                
                // If element is a text field than give it a specific height
                if (element.content.isKind(of: UITextField.self)) {
                    make.height.equalTo(Sizes.TextFieldOrLargeButtonHeight.rawValue)
                }
                // Set the bottom element
                if (element.content == elements.last?.content) {
                    self.bottomConstraint = make.bottom.equalTo(self).offset(-Sizes.smallMargin.rawValue).constraint
                }
            })
            
            index = index + 1;
        }
    }
    
    func getWidth (width: CGFloat, showMargins: Bool) -> CGFloat {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenColSize = screenWidth / 12.0
        
        if (showMargins) {
            return width * screenColSize - (Sizes.smallMargin.rawValue * 2);
        } else {
            return width * screenColSize;
        }
    }    
}
