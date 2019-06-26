//
//  GRViewWithScrollView.swift
//  PMULibrary
//
//  Created by adeiji on 3/2/19.
//  Copyright © 2019 Dephyned. All rights reserved.
//

import Foundation
import UIKit

public class GRContainerView : UIView {
    
    weak var activeField:UITextField?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.activeField?.resignFirstResponder()
    }
}

public class GRViewWithScrollView : UIView, UITextFieldDelegate {
    
    weak var navBar:GRNavBar!
    weak var scrollView:UIScrollView!
    weak var containerView:GRContainerView!
    weak var activeField:UITextField?
    weak var loadingView:UIView?
    
    // When a text field is clicked and the keyboard shows and the scroll view scrolls in order to show the text field
    // this is the amount extra or less than you want the scroll view to scroll
    var scrollWhenTextFieldClickedOffset:CGFloat = 0
    
    /// Show a white faded screen with a spinner in the middle indicating that there is a action in progress
    func showLoading (superview: UIView? = nil) {
        
        let fadedView = UIView()
        
        if let superview = superview {
            superview.addSubview(fadedView)
        } else {
            self.addSubview(fadedView)
        }
        
        fadedView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        fadedView.backgroundColor = .white
        fadedView.layer.opacity = 0.7
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.startAnimating()
        fadedView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(fadedView)
        }
        
        self.loadingView = fadedView
    }
        
    /// Remove the white faded screen showing the action in progress is done
    func hideLoading () {
        self.loadingView?.removeFromSuperview()
    }
    
    func addScrollViewAndContainerView () {
        let scrollView = UIScrollView()
        
        self.addSubview(scrollView)
        self.scrollView = scrollView
        scrollView.alwaysBounceVertical = true
        scrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self.navBar.snp.bottom)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        let containerView = GRContainerView();
        self.scrollView.alwaysBounceHorizontal = false
        self.scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        self.containerView = containerView
    }
    
    /// Creates the ConferenceMainPageView UI Elements and layouts
    ///
    /// - Returns: The ConferenceMainPageView
    @discardableResult
    func setup (superview: UIView) -> GRViewWithScrollView {
        superview.addSubview(self)
        self.registerForKeyboardNotifications()
        self.navBar = Style.navBar(withHeader: "PMU Conference", superview: self, leftButton: nil, rightButton: nil);
        
        self.addScrollViewAndContainerView()
        self.backgroundColor = .white;
        self.snp.makeConstraints { (make) in
            make.edges.equalTo(superview)
        }
        
        self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: self.containerView.bounds.size.height)
        
        return self;
    }
    
    func updateScrollViewContentSize () {
        self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: self.containerView.bounds.size.height)
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardAppear(_:)), name: UIControl.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardDisappear(_:)), name: UIControl.keyboardDidHideNotification, object: nil)
    }
    
    // Don't forget to unregister when done
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIControl.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIControl.keyboardDidHideNotification, object: nil)
    }
    
    @objc func onKeyboardAppear(_ notification: NSNotification) {
        let info = notification.userInfo!
        let rect: CGRect = info[UIResponder.keyboardFrameBeginUserInfoKey] as! CGRect
        let kbSize = rect.size
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height + self.scrollWhenTextFieldClickedOffset, right: 0)
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
        
        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your application might not need or want this behavior.
        var aRect = self.containerView.frame;
        aRect.size.height -= kbSize.height;
        
        if let activeField = self.activeField {
            if !aRect.contains(activeField.frame.origin) {
                let scrollPoint = CGPoint(x: 0, y: activeField.frame.origin.y-kbSize.height + 100 )
                self.scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    @objc func onKeyboardDisappear(_ notification: NSNotification) {
        self.scrollView.contentInset = UIEdgeInsets.zero
        self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
        self.containerView.activeField = self.activeField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeField = nil
        self.containerView.activeField = self.activeField
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.activeField?.resignFirstResponder()
    }
}
