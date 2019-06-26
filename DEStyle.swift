//
//  DEStyle.swift
//  Graffiti
//
//  Created by adeiji on 4/5/18.
//  Copyright © 2018 Dephyned. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import FirebaseAuth

public class StyleSettings {
    
    var navBarColor:UIColor!
    var colors:[SettingNames:UIColor] = [SettingNames:UIColor]()
    var showNavbarSubheading = true;
    
    enum SettingNames {
        case NavBarColor
        case NavBarFontColor
        case NavBarBorderColor
        case NavBarSubheadingColor
        case DefaultButtonColor
        case CancelButtonColor
        case MainAppColor
        case MainAppColorShade
        case ErrorColor
    }
    
    private static var sharedStyleSettings:StyleSettings = {
        let styleSettings = StyleSettings()
        return styleSettings
    }()
    
    class func shared() -> StyleSettings {
        return self.sharedStyleSettings
    }
    
    func initializeSettings (navBarColor: UIColor) {
        self.navBarColor = navBarColor        
    }
    
    func addColor (color: UIColor, name: SettingNames) {
        self.colors[name] = color;
    }
    
    func getColor (name: SettingNames) -> UIColor {
        return self.colors[name] ?? .white
    }

}

public enum FontSizes:CGFloat {
    case VerySmall = 13.0
    case Small = 16.0
    case Medium = 25.0
    case Large = 30.0
    case Header = 19.0
    case Logo = 38.0
}


/// The sizes used for the application
///
/// - smallMargin: The small margins for the app
/// - MinimalLargeMargin: The larger margins
/// - smallButton: The width and height of a small square button
/// - LargeButton: The width and height of a large square button
/// - OrangeRoundedButton: An orange button's width
/// - ButtonWithText: The width for a button with text
/// - ImageHeightIPad: The standard height for an image if the current device is an iPad
/// - ImageHeightIPhone: The standard height for an image if the current device is an iPhone
public enum Sizes:CGFloat {
    case smallMargin = 15.0
    case TextFieldOrLargeButtonHeight = 44.0
    case MinimalLargeMargin = 20.0
    case smallButton = 40.0
    case LargeButton = 70.0
    case OrangeRoundedButton = 45
    case ButtonWithText = 120.0
    case ImageHeightIPad = 500
    case ImageHeightIPhone = 200
}

public enum FontNames:String {
//    case logo = "Gill Sans"
    case header = "GillSans-SemiBold"
    case all = "Avenir-Book"
    case allBold = "HelveticaNeue-Bold"
//    case allLight = "GillSans-Light"
}

public enum CellType:String {
    case text = "text"
    case transition = "transition"
    case share = "share"
}

public struct SnapConstraint {
    var object:UIView!;
    var type:ConstraintType!
    var toType:ConstraintType!
    var offset:CGFloat = 0;
}

public enum ConstraintType {
    case left
    case right
    case bottom
    case top
    case width
    case height
}

public enum GRButtonType {
    case RedMapMarker
    case AddPlusSign
    case MessageBubble
    case LocationMarker
    case Heart
    case SendArrow
    case AddTagCamera
    case Menu
    case Back
    case Cancel
    case Search
    case Settings
    case Profile
    case Selection
    case Okay
    case Activity
    case TagMenu
    case TagPlace
    case SaveTag
    case Refresh
    case None
}

public enum ButtonRowType {
    case Instagram
    case EqualWidths
    case FullScreen
}

public extension UIColor {
    struct Style {
        // Hashtag Backgrounds
        static var htPeach: UIColor  { return UIColor(red: 253/255, green: 170/255, blue: 146/255, alpha: 1) }
        static var htTeal: UIColor  { return UIColor(red: 36/255, green: 216/255, blue: 191/255, alpha: 1) }
        static var htBlueish: UIColor  { return UIColor(red: 106/255, green: 173/255, blue: 247/255, alpha: 1) }
        static var htRedish: UIColor  { return UIColor(red: 253/255, green: 98/255, blue: 129/255, alpha: 1) }
        static var htDarkRed: UIColor  { return UIColor(red: 216/255, green: 87/255, blue: 69/255, alpha: 1) }
        static var htLightPurple: UIColor  { return UIColor(red: 205/255, green: 115/255, blue: 245/255, alpha: 1) }
        static var htLightBlue: UIColor  { return UIColor(red: 99/255, green: 193/255, blue: 225/255, alpha: 1) }
        static var htLightGreen: UIColor  { return UIColor(red: 118/255, green: 229/255, blue: 184/255, alpha: 1) }
        static var htLightOrange: UIColor  { return UIColor(red: 254/255, green: 204/255, blue: 151/255, alpha: 1) }
        static var htDarkPurple: UIColor  { return UIColor(red: 143/255, green: 136/255, blue: 252/255, alpha: 1) }
        static var htDookieGreen: UIColor  { return UIColor(red: 205/255, green: 219/255, blue: 57/255, alpha: 1) }
        static var htMintGreen: UIColor { return UIColor(red: 28/255, green: 183/255, blue: 148/255, alpha: 1) }
        static var htLightGreenishBlue: UIColor { return UIColor(red: 93/255, green: 238/255, blue: 197/255, alpha: 1) }
        static var htVeryLightGray: UIColor { return UIColor(red: 245/255, green: 246/255, blue: 250/255, alpha: 1) }        
        
        static var beige: UIColor { return UIColor(red: 241/255, green: 237/255, blue: 226/255, alpha: 1) }
        static var blueGrey: UIColor  { return UIColor(red: 97/255, green: 125/255, blue: 138/255, alpha: 1) }
        static var orange: UIColor  { return UIColor(red: 255/255, green: 158/255, blue: 112/255, alpha: 1) }
        static var textFieldBlueGrey: UIColor  { return UIColor(red: 78/255, green: 101/255, blue: 109/255, alpha: 1) }
        static var lightGray: UIColor  { return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1) }
        static var header: UIColor { return UIColor.Style.lightGray }
        static var darkBlueGrey: UIColor { return UIColor(red: 60/255, green: 66/255, blue: 81/255, alpha: 1) }
        static var blueGrayVariant: UIColor { return UIColor(red: 76/255, green: 83/255, blue: 100/255, alpha: 1) }
        static var lightBlue: UIColor { return UIColor(red: 117/255, green: 139/255, blue: 175/255, alpha: 1)}
        static var tagTagBackground: UIColor { return UIColor.Style.blueGrayVariant }
        static var followButton: UIColor { return UIColor.Style.orange }
        static var inviteFacebookButton: UIColor { return UIColor.Style.orange }
        static var navBarText: UIColor { return UIColor.Style.darkBlueGrey }
        static var backgroundColor: UIColor { return UIColor.Style.lightBlue }
    }
}

public enum AnimationType {
    case HorizontalExpansion
    case VerticalExpansion
    case SlideUp
}

public class Animation : UIView {
    
    var color:UIColor?
    var size:CGSize?
    let animation:AnimationType
    
    init(animation:AnimationType) {
        self.animation = animation
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show () {}
    
    func hide () {}
    
}

public struct Tile {
    var view:UIView
    var button:UIButton
    
    init(view:UIView, button:UIButton) {
        self.view = view
        self.button = button
    }
}

public class GRTileView : UIView {
        
    /// Add a tile button to the main screen
    ///
    /// - Parameters:
    ///   - imageName: Name of the image to show
    ///   - caption: The caption to show
    ///   - color: The background color of the tile
    ///   - textColor: The color of the text on the tile
    /// - Returns: The tile as a stack view
    public class func addTile (imageName: String, caption: String, color: UIColor, textColor: UIColor = .black, backgroundImageName: String? = nil) -> UIView {
        let tile = UIView();
        
        let topView = UIView();
        let imageView = UIImageView(image: UIImage(named: imageName));
        imageView.contentMode = .center
        let caption = Style.label(withText: caption, superview: nil, textColor: textColor);
        let bottomView = UIView();
        let stackView = Style.viewStack(withSuperview: tile, align: .center, views: [topView, imageView, caption, bottomView], equalHeights: true)
        
        if let backgroundImageName = backgroundImageName {
            let backgroundImageView = UIImageView(image: UIImage(named: backgroundImageName));
            stackView.addSubview(backgroundImageView)
            backgroundImageView.snp.makeConstraints { (make) in
                make.edges.equalTo(stackView)
            }
            
            backgroundImageView.layer.zPosition = -1
            let blackOverlayView = UIView()
            blackOverlayView.backgroundColor = .black
            blackOverlayView.layer.opacity = 0.7
            
            backgroundImageView.addSubview(blackOverlayView)
            blackOverlayView.snp.makeConstraints { (make) in
                make.edges.equalTo(backgroundImageView)
            }
        }
        
        stackView.backgroundColor = color
        stackView.layer.borderWidth = 1.0
        stackView.layer.borderColor = UIColor.white.cgColor
        
        return stackView;
    }
    
    public class func createTileView (superview: UIView, views: [UIView]) -> UIView {
        var tileLocation = 1;
        let tileView = UIView();
        
        views.forEach { (view) in
            tileView.addSubview(view)
            view.snp.makeConstraints({ (make) in
                if tileLocation == 1 || tileLocation == 2 {
                    make.top.equalTo(tileView)
                } else {
                    make.top.equalTo(views[tileLocation - 3].snp.bottom);
                }                                
                
                // Odd tile, left hand size of the tile view
                if (tileLocation % 2 > 0) {
                    make.left.equalTo(tileView)
                    make.right.equalTo(tileView.snp.centerX)
                } else {
                    make.right.equalTo(tileView)
                    make.left.equalTo(tileView.snp.centerX)
                }
                
                make.height.equalTo(view.snp.width)
                tileLocation = tileLocation + 1;
                
                if (view == views.last) {
                    make.bottom.equalTo(tileView)
                }
            })
        }
        
        superview.addSubview(tileView)
        return tileView
    }    
}

public class GRHelperView : UIView {
    
    weak var label:UILabel?
    weak var button:UIButton?
    
    open func setup (superview: UIView, text: String, buttonText: String, borderColor: UIColor = UIColor.Style.blueGrey) {
        superview.addSubview(self)
        
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = UIColor.Style.htBlueish
        self.layer.borderWidth = 0.5
        
        self.snp.makeConstraints { (make) in
            if superview.frame.size.width > 400 {
                make.width.equalTo(400)
                make.centerX.equalTo(superview)
                
            } else {
                make.left.equalTo(superview).offset(Sizes.smallMargin.rawValue * 2)
                make.right.equalTo(superview).offset(-Sizes.smallMargin.rawValue * 2)
            }
        }
        
        let label = Style.label(withText: text, fontName: .allBold, size:.Small, superview: self, textColor: UIColor.white, textAlignment: .center)
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(Sizes.smallMargin.rawValue * 3)
            make.right.equalTo(self).offset(-Sizes.smallMargin.rawValue * 3)
            make.top.equalTo(self).offset(Sizes.smallMargin.rawValue * 3)
            make.centerY.equalTo(superview)
        }
        
        self.label = label
        
        let button = Style.clearButton(with: buttonText, superview: self, fontSize: .Small, font: .allBold, backgroundColor: UIColor.Style.htPeach, cornerRadius: 0)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(label.snp.bottom).offset(Sizes.smallMargin.rawValue * 3)
            make.bottom.equalTo(self).offset(-Sizes.smallMargin.rawValue * 3)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
        self.button = button
    }
}

public class GRNavBar:UIView {
    weak var leftButton:UIButton!
    weak var rightButton:UIButton!
    weak var secondLeftButton:UIButton?
    weak var subheading:UILabel!
    weak var header:UILabel!
    var backButton:UIButton! {
        didSet {
            self.addSubview(self.backButton)
            self.backButton.snp.remakeConstraints { (make) in
                make.left.equalTo(self)
                if (Style.isIPhoneX()) {
                    make.top.equalTo(self).offset(45)
                } else {
                    make.top.equalTo(self).offset(15)
                }
                                
                make.width.equalTo(50)
                make.height.equalTo(50)                
            }
        }
    }
}


public class ButtonRow: UIView {
    
    var buttons = [UIButton]()
    weak var rightButton:UIButton!
    var kMargin = 5
    var type:ButtonRowType = .Instagram
    
    func addButton (button: UIButton) {
        self.addSubview(button)
        if type == .Instagram {
            button.snp.makeConstraints { (make) in
                if buttons.count > 0 {
                    make.left.equalTo((buttons.last?.snp.right)!)
                } else {
                    make.left.equalTo(self)
                }
                
                make.top.equalTo(self)
                make.width.equalTo(Sizes.smallButton.rawValue)
                make.height.equalTo(Sizes.smallButton.rawValue)
            }
        }
        self.buttons.append(button)
        
        if type == .EqualWidths {
            var counter = 0
            var previousButton:UIButton!            
            for button in self.buttons {
                button.snp.remakeConstraints({ (make) in
                    if button == buttons.first {
                        make.left.equalTo(self)
                    } else {
                        make.left.equalTo(previousButton.snp.right)
                        make.width.equalTo(previousButton)
                    }
                    if button == buttons.last {
                        make.right.equalTo(self)
                    } else {
                        make.right.equalTo(self.buttons[counter + 1].snp.left)
                    }
                    
                    make.top.equalTo(self)
                    make.bottom.equalTo(self)
                })
                
                previousButton = button
                counter = counter + 1
            }
        }
        
        
    }
    
    func addRightButton (button: UIButton) {
        self.addSubview(button)
        self.rightButton = button
        button.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self)
            make.width.equalTo(Sizes.smallButton.rawValue)
            make.height.equalTo(Sizes.smallButton.rawValue)
        }
    }
}

public class ColorView: UIView {
    
}

public class ActionCard: GRCard {
    weak var actionButton:UIButton?
    weak var cancelButton:UIButton?
}

public class Style {
    
    class func pushViewController (viewController: UIViewController) {
        if let _ = Auth.auth().currentUser {
            if let navController = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController as? UINavigationController {
                navController.pushViewController(viewController, animated: true)
            }
        }
    }
    
    class func topViewController () -> UIViewController? {
        if let _ = Auth.auth().currentUser {
            if let navController = (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController as? UINavigationController {
                return navController.topViewController
            }
        }
        
        return nil
    }
    
    /// Show a card at the bottom of the screen that shows that an action was a success
    ///
    /// - Parameters:
    ///   - message: The message to show the user
    ///   - superview: The view to add the card to
    /// - Returns: The card
    @discardableResult
    class func showMessageCard (message: String, superview: UIView, isError:Bool, slideUpFromBottom:Bool) -> GRCard {
       
        var cardBackgroundColor:UIColor!
        if isError {
            cardBackgroundColor = StyleSettings.shared().getColor(name: .ErrorColor)
        } else {
            cardBackgroundColor = .black
        }
        
        let messageCard = GRCard(color: cardBackgroundColor)
        
        let closeButton = Style.largeButton(with: "Okay", superview: nil, backgroundColor: StyleSettings.shared().getColor(name: .MainAppColor))
        messageCard.addElements(elements: [
            GRCardSet(content: Style.label(withText: message, superview: nil, textColor: .white), width: 11.0, height: nil, newLine: true, showMargins: true),
            GRCardSet(content: Style.label(withText: "", superview: nil), width: 12.0, height: 10.0),
            GRCardSet(content: closeButton, width: 5.0, height: 44.0, newLine: true, showMargins: true)])
        
        if slideUpFromBottom {
            messageCard.slideUp(superview: superview, margin: Sizes.smallMargin.rawValue)
        } else {
            messageCard.slideDown(superview: superview, margin: Sizes.smallMargin.rawValue)
        }
        
        closeButton.addTargetClosure { (_) in
            if (slideUpFromBottom) {
                messageCard.slideDownAndRemove(superview: superview)
            } else {
                messageCard.slideUpAndRemove(superview: superview)
            }
        }
        
        return messageCard
    }
    
    /// Show a card at the bottom of the screen that shows that an action was a success
    ///
    /// - Parameters:
    ///   - message: The message to show the user
    ///   - superview: The view to add the card to
    /// - Returns: The card
    class func showActionCard (message: String, superview: UIView, isError:Bool, actionButtonText:String, slideUpFromBottom:Bool) -> ActionCard {
        
        var cardBackgroundColor:UIColor!
        if isError {
            cardBackgroundColor = StyleSettings.shared().getColor(name: .ErrorColor)
        } else {
            cardBackgroundColor = .black
        }
        
        let actionCard = ActionCard(color: cardBackgroundColor)
        let actionButton = Style.largeButton(with: actionButtonText, superview: nil, backgroundColor: StyleSettings.shared().getColor(name: .MainAppColor))
        let closeButton = Style.largeButton(with: "Cancel", superview: nil, backgroundColor: StyleSettings.shared().getColor(name: .CancelButtonColor))
        
        actionCard.addElements(elements: [
            GRCardSet(content: Style.label(withText: message, superview: nil, textColor: .white), width: 11.0, height: nil, newLine: true, showMargins: true),
            GRCardSet(content: Style.label(withText: "", superview: nil), width: 12.0, height: 10.0),
            GRCardSet(content: actionButton, width: 5.0, height: 44.0, newLine: true, showMargins: true),
            GRCardSet(content: closeButton, width: 5.0, height: 44.0, newLine: false, showMargins: true)])
        
        if slideUpFromBottom {
            actionCard.slideUp(superview: superview, margin: Sizes.smallMargin.rawValue)
        } else {
            actionCard.slideDown(superview: superview, margin: Sizes.smallMargin.rawValue)
        }
        
        actionCard.actionButton = actionButton
        actionCard.cancelButton = closeButton
        closeButton.addTargetClosure { (_) in
            if slideUpFromBottom {
                actionCard.slideDownAndRemove(superview: superview)
            } else {
                actionCard.slideUpAndRemove(superview: superview)
            }
        }

        return actionCard
    }
    
    /// Overlay a view with a clear button that will be completely invisible.
    ///
    /// - Parameter view: The view to overlay with a button
    class func overlayViewWithClearButton (view: UIView) -> UIButton {
        let button = Style.clearButton(with: "", superview: view);
        button.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        return button;
    }
    
    /// Does a cool animatation for a view with a subview as a color, see getColorView()
    ///
    /// - Parameter view: The view to animate
    /// - Todo: Need to make sure that we use a ColorView class
    class func animateColorView (view: UIView?, timeInterval:Double, shouldExpand:Bool = true, completion: @escaping (Bool?) -> ()) {
        if let view = view {
            view.subviews.forEach { (subview) in
                if subview.isKind(of: ColorView.self) {
                    subview.snp.remakeConstraints({ (make) in
                        make.right.equalTo(view)
                        make.top.equalTo(view)
                        make.bottom.equalTo(view)
                        if shouldExpand {
                            make.width.equalTo(5)
                        } else {
                            make.left.equalTo(view)
                        }                        
                    })
                    UIView.animate(withDuration: timeInterval, animations: {
                        view.layoutIfNeeded()
                    }, completion: { (completed) in
                        if (completed) {
                            completion(completed)
                        }
                    })
                    
                }
            }
        }
    }
    
    class func getImageHeight () -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return Sizes.ImageHeightIPhone.rawValue
        }
        
        return Sizes.ImageHeightIPad.rawValue
    }
    
    /// Gets a view that has a subview that is a specific color
    ///
    /// - Parameter index: The index of the color you want, see Style.getColors(number: Int) for more information
    /// - Returns: A UIVIew
    class func getColorView (index: Int) -> UIView {
        let view = UIView()
        let colorView = ColorView()
        view.addSubview(colorView)
        colorView.backgroundColor = Style.getColor(number: index);

        colorView.snp.makeConstraints({ (make) in
            make.edges.equalTo(view)
        })        
        
        return view
    }
    
    class func getButtonRow (withSuperview superview: UIView, type: ButtonRowType, viewAbove: UIView?, viewBelow: UIView?, buttonType: ButtonRowType, height:CGFloat?) -> ButtonRow {
        let buttonRow = ButtonRow()
        buttonRow.type = buttonType
        superview.addSubview(buttonRow)
        if type == .FullScreen {
            buttonRow.snp.makeConstraints { (make) in
                make.left.equalTo(superview)
                make.right.equalTo(superview)
                if let viewAbove = viewAbove {
                    make.top.equalTo(viewAbove.snp.bottom)
                } else {
                    make.top.equalTo(superview)
                }
                
                if let viewBelow = viewBelow {
                    make.bottom.equalTo(viewBelow.snp.top)
                } else if height == nil {
                    make.bottom.equalTo(superview)
                }
                
                if let height = height {
                    make.height.equalTo(height)
                }
            }
        }
        
        return buttonRow;
        
    }
    
    /// Generates a button with a random color and text
    ///
    /// - Parameters:
    ///   - title: What you want the button to display text wise
    ///   - colorIndex: A number that represents a color - see GRButton for details
    /// - Returns: a GRButton
    class func getButtonWithRandomColor (withTitle title:String, colorIndex: Int, cornerRadius:CGFloat = 0) -> GRButton {
        let button = GRButton(type: .None)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.all.rawValue, size: FontSizes.Small.rawValue)
        button.sizeToFit()
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        button.setBackgroundColor(number: colorIndex)
        
        return button;
    }
    
    
    /// Get a color specific to the application
    ///
    /// - Parameter number: Int A number which represents the color that you want
    /// - Returns: A UIColor object
    class func getColor (number: Int? = nil) -> UIColor {
        var num = number
        if num == nil {
            num = Int(arc4random_uniform(10))
        }
        
        
        if num! > 9 {
            num = num! % 9
        }
        
        
        switch num {
        case 0:
            return UIColor.Style.htPeach
        case 1:
            return UIColor.Style.htTeal
        case 2:
            return UIColor.Style.htBlueish
        case 3:
            return UIColor.Style.htRedish
        case 4:
            return UIColor.Style.htLightPurple
        case 5:
            return UIColor.Style.htLightBlue
        case 6:
            return UIColor.Style.htLightGreen
        case 7:
            return UIColor.Style.htLightOrange
        case 8:
            return UIColor.Style.htDarkPurple
        case 9:
            return UIColor.Style.htDookieGreen
        default:
            return UIColor.Style.htMintGreen;
        }
    }
    
    class func addButtonToScrollView (title:String, colorIndex:Int, previousButton: GRButton!, isLast: Bool, scrollView: UIScrollView) -> GRButton {
        let button = GRButton(type: .None)
        scrollView.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            if previousButton == nil {
                make.left.equalTo(scrollView).offset(Sizes.smallMargin.rawValue)
            } else {
                make.left.equalTo(previousButton.snp.right).offset(Sizes.smallMargin.rawValue)
            }
            
            make.centerY.equalTo(scrollView)
            if isLast {
                make.right.equalTo(scrollView.snp.right).offset(-Sizes.smallMargin.rawValue)
            }
        }
        
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
        button.setBackgroundColor(number: colorIndex)
        return button
    }
    
    class func addButton (belowView view: UIView, withSuperview superview:UIView, height:CGFloat, width:CGFloat, backgroundColor: UIColor, textColor: UIColor, title: String, cornerRadius: CGFloat, fontSize: FontSizes) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        superview.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.bottom).offset(Sizes.smallMargin.rawValue)
            make.centerX.equalTo(view)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = backgroundColor
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.all.rawValue, size: fontSize.rawValue)
        button.showsTouchWhenHighlighted = true
        return button
    }
    
    
    /// Creates a view with all subviews stacked vertically
    ///
    /// - Parameters:
    ///   - superview: The superview for the stack view created
    ///   - align: How to align the text for all labels and text fields
    ///   - views: The views that will be stacked
    ///   - eachViewHeight: The height that you want each view, if nil, than the height of each view will be calculated based off of the size of the stack view
    /// - Returns: The created Stack View
    class func viewStack (withSuperview superview:UIView, align: NSTextAlignment, views: [UIView], eachViewHeight:Int? = nil, equalHeights:Bool = false) -> UIView {
        let stackView = UIView()
        superview.addSubview(stackView)
        var counter = 0;
        for view in views {
            if let view = view as? UILabel {
                view.textAlignment = align
            }
            
            stackView.addSubview(view)
            view.snp.makeConstraints { (make) in
                if view == views.first {
                    make.top.equalTo(stackView)
                } else {
                    make.top.equalTo(views[counter-1].snp.bottom)
                }
                make.left.equalTo(stackView)
                make.right.equalTo(stackView)
                
                if equalHeights {
                    if view != views.first {
                        make.height.equalTo(views[counter-1])
                    }
                } else if let height = eachViewHeight {
                    make.height.equalTo(height).priority(.high)
                }
                if view == views.last {
                    make.bottom.equalTo(stackView)
                }
            }
            counter = counter + 1
        }
        
        return stackView
    }
    
    class func tableView (withSuperview superview:UIView, viewAbove:UIView!, offset: CGFloat) -> UITableView {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        superview.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(superview)
            make.right.equalTo(superview)
            if viewAbove != nil {
                make.top.equalTo(viewAbove.snp.bottom).offset(offset)
            } else {
                make.top.equalTo(superview)
            }
            make.bottom.equalTo(superview)
        }
        
        tableView.layer.zPosition = 0;
        return tableView
    }
    
    class func leftBottomCornerButton (withSuperview superview:UIView, type: GRButtonType) -> GRButton {
        let button = GRButton(type: type)
        superview.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.equalTo(superview).offset(10)
            make.bottom.equalTo(superview).offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        button.layer.zPosition = 1
        return button
    }
    
    class func rightBottomCornerButton (withSuperview superview:UIView, type: GRButtonType) -> GRButton {
        let button = GRButton(type: type)
        superview.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.right.equalTo(superview).offset(-10)
            make.bottom.equalTo(superview).offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        button.layer.zPosition = 1
        return button
    }
    
    class func progressView (withSuperview superview: UIView) -> UIProgressView {
        let progressView = UIProgressView()
        progressView.tintColor = .white
        progressView.trackTintColor = .green
        superview.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.left.equalTo(superview).offset(Sizes.smallMargin.rawValue)
            make.right.equalTo(superview).offset(-Sizes.smallMargin.rawValue)
            make.bottom.equalTo(superview).offset(-Sizes.smallMargin.rawValue)
            make.height.equalTo(2)
        }
        
        return progressView
    }
    
    class func finishedTaskView (withSuperview superview: UIView, withTitle title: String) -> UIView {
        let progressViewContainer = UIView()
        superview.addSubview(progressViewContainer)
        progressViewContainer.backgroundColor = .black
        progressViewContainer.layer.opacity = 0.85
        progressViewContainer.snp.makeConstraints { (make) in
            make.left.equalTo(superview)
            make.right.equalTo(superview)
            make.bottom.equalTo(superview)
            make.height.equalTo(50)
        }
        
        let label = Style.label(withText: title, fontName: .all, size: .Small, superview: progressViewContainer, textColor: .white)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(progressViewContainer).offset(Sizes.smallMargin.rawValue)
            make.right.equalTo(progressViewContainer).offset(-Sizes.smallMargin.rawValue)
            make.centerY.equalTo(progressViewContainer)
        }
        
        let button = GRButton(type: .Okay)
        progressViewContainer.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.right.equalTo(progressViewContainer).offset(-Sizes.smallMargin.rawValue)
            make.centerY.equalTo(progressViewContainer)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        button.addTargetClosure { (button) in
            Style.finishedTaskViewOkayButtonPressed()
        }
        
        return progressViewContainer
    }
    
    class func finishedTaskViewOkayButtonPressed () {
        UtilityFunctions.removeTaskCompletedView()
    }
    
    class func isIPhoneX () -> Bool {
        if(UIDevice.current.userInterfaceIdiom == .phone) {
            switch (UIScreen.main.nativeBounds.size.height) {
            case 1136:
                return false;
            case 1334:
                return false;
            case 1920, 2208:
                return false;
            case 2436:
                return true;
            case 2688:
                return true;
            case 1792:
                return true;
            default:
                return false;
            }
        }
        
        return false;
    }
    
    /**
     * - Description Adds a navBar at the top of the superview with all the appropriate constraints
     * - Parameter header Set this to nil if you want to use the default text, otherwise give it a specific header text
     * - Parameter superview The view which will be the superview of the navBar
     * - Parameter leftButton The button which will show on the left side of the navBar
     * - Parameter rightButton The button which will show on the right side of the navBar
     * - Returns a UIView
     */
    class func navBar (withHeader header: String!, superview: UIView, leftButton: UIButton!, rightButton: UIButton!, addLeftButton:UIButton? = nil, isBackButton: Bool = false, subheadingText:String? = nil) -> GRNavBar {
        let navBar = GRNavBar()
        navBar.backgroundColor = StyleSettings.shared().getColor(name: .NavBarColor)
        navBar.layer.borderWidth = 0.25
        navBar.layer.borderColor = StyleSettings.shared().getColor(name: .NavBarBorderColor).cgColor
        superview.addSubview(navBar)
        
        navBar.snp.makeConstraints { (make) in
            make.left.equalTo(superview)
            make.top.equalTo(superview)
            make.right.equalTo(superview)
            if (isIPhoneX()) {
                make.height.equalTo(100)
            } else {
                make.height.equalTo(70)
            }
        }
        
        let headerLabel = UILabel()
        navBar.addSubview(headerLabel)
        if header != nil {
            headerLabel.text = header;
        } else {
            headerLabel.text = "GRAFFITI"
        }
        
        headerLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(navBar)
            if (isIPhoneX()) {
                make.centerY.equalTo(navBar).offset(20)
            } else {
                make.centerY.equalTo(navBar).offset(5)
            }
        }
        
        headerLabel.textColor = StyleSettings.shared().getColor(name: .NavBarFontColor)
        
        var myRightButton = rightButton
        myRightButton?.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        if myRightButton == nil {
            myRightButton = UIButton()
        }
        navBar.addSubview(myRightButton!)
        
        if let rightButton = rightButton as? GRButton {
            rightButton.snp.makeConstraints({ (make) in
                make.right.equalTo(navBar)
                make.centerY.equalTo(headerLabel)
                make.width.equalTo(60)
                make.height.equalTo(60)
            })
        } else {
            myRightButton!.snp.makeConstraints({ (make) in
                make.right.equalTo(navBar).offset(-Sizes.smallMargin.rawValue / 2.0)
                make.centerY.equalTo(headerLabel)
                make.width.equalTo(42)
                make.height.equalTo(navBar).offset(60)
            })
        }
        
        var myLeftButton = leftButton
        if myLeftButton == nil {
            myLeftButton = UIButton()
        }
        
        navBar.addSubview(myLeftButton!)
        myLeftButton!.snp.makeConstraints({ (make) in
            make.left.equalTo(navBar)
            make.centerY.equalTo(headerLabel).offset(5)
            make.width.equalTo(45)
            make.height.equalTo(50)
        })
        
        navBar.leftButton = myLeftButton
        
        if isBackButton {
            navBar.backButton = myLeftButton
        }
        
        if let addLeftButton = addLeftButton {
            navBar.addSubview(addLeftButton)
            addLeftButton.snp.makeConstraints({ (make) in
                make.left.equalTo(myLeftButton!.snp.right).offset(-Sizes.smallMargin.rawValue / 2.0)
                make.centerY.equalTo(headerLabel)
                make.width.equalTo(45)
                make.height.equalTo(50)
            })
            
            navBar.secondLeftButton = addLeftButton
        }
        
        let subheading = UILabel()
        if (!StyleSettings.shared().showNavbarSubheading) {
            subheading.isHidden = true
        }
        navBar.addSubview(subheading)
        subheading.font = UIFont.systemFont(ofSize: FontSizes.VerySmall.rawValue)
        subheading.snp.makeConstraints { (make) in
            make.centerX.equalTo(navBar)
            make.top.equalTo(headerLabel.snp.bottom).offset(-5)
            make.width.equalTo(200)
        }
        subheading.numberOfLines = 1
        subheading.textAlignment = .center
        subheading.textColor = StyleSettings.shared().getColor(name: .NavBarSubheadingColor)
        if let subheadingText = subheadingText {
            subheading.text = subheadingText
        }
        
        navBar.subheading = subheading
        
        navBar.rightButton = myRightButton
        navBar.header = headerLabel
        headerLabel.font = UIFont(name: FontNames.header.rawValue, size: FontSizes.Header.rawValue)
        
        return navBar;
    }
    
    /**
     
     Creates a UIImageView object, and also add the constraints, if you want to not use these constraints, than make sure that you set useDefaultConstraints to false.  The default constraints for the image are height and width of whatever you set and a left constant of 10 from it's superview's left side with a centerY equal to it's superview
     
     - parameters:
        - superview: UIView The superview of the view.  UIImageView will be added as a subview of the superview
        - isRound: CGFloat! Boolean value indicating whether you want the UIImageView to be round
        - width: CGFloat! The width of the image view
        - height: CGFloat! The height of the image view
        - useDefaultConstraints: Optional Bool Indicates whether you want to use the default constraints or not
     
     - returns:
        UIImageView - An instance of UIImageView added as a subview to the given superview with constraints added if desired
     */
    class func imageView (withSuperview superview: UIView, image:UIImage? = nil, isRound: Bool, width: CGFloat? = nil, height: CGFloat? = nil, useDefaultConstraints:Bool = true, showMargins:Bool = true, viewAbove:UIView? = nil) -> UIImageView {
        let imageView = UIImageView()
        superview.addSubview(imageView)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        if useDefaultConstraints {
            imageView.snp.makeConstraints { (make) in
                if showMargins {
                    make.left.equalTo(superview).offset(Sizes.MinimalLargeMargin.rawValue)
                    if let viewAbove = viewAbove {
                        make.top.equalTo(viewAbove.snp.bottom).offset(Sizes.MinimalLargeMargin.rawValue)
                    } else {
                        make.top.equalTo(superview).offset(Sizes.MinimalLargeMargin.rawValue)
                    }
                } else {
                    make.left.equalTo(superview)
                    if let viewAbove = viewAbove {
                        make.top.equalTo(viewAbove.snp.bottom)
                    } else {
                        make.top.equalTo(superview)
                    }
                }
                
                if let width = width {
                    make.width.equalTo(width)
                    if isRound {
                        imageView.layer.cornerRadius = width / 2
                    }
                } else {
                    make.width.equalTo(superview)
                }
                
                if let height = height {
                    make.height.equalTo(height)
                } else {
                    make.height.equalTo(imageView.snp.width)
                }
            }
        }
        
        imageView.clipsToBounds = true
        imageView.backgroundColor = self.getColor(number: 3)
        
        return imageView
    }
    
    class func userView (withSuperview superview: UIView, username: String, location: String?, profileImageUrl: String!, profileImage: UIImage!) -> TagHeaderView {
        let userView = TagHeaderView()
        superview.addSubview(userView)
        userView.snp.makeConstraints { (make) in
            make.left.equalTo(superview)
            make.right.equalTo(superview)
            make.top.equalTo(superview)
        }
        
        let imageView = Style.imageView(withSuperview: userView, isRound: true, width: 40, height: 40)
        if profileImage != nil {
            imageView.image = profileImage
        }
        
        if profileImage == nil && (profileImageUrl == nil || profileImageUrl == "") {
            imageView.backgroundColor = .gray
        }
        
        let usernameLabel = Style.label(withText: username, fontName: .allBold , size: .Small, superview: userView, textColor: .black)
        usernameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(Sizes.smallMargin.rawValue)
            make.left.equalTo(imageView)
            make.right.equalTo(userView)
        }
        
        let addressLabel = Style.label(withText: location ?? "No Location", fontName: .all, size: .Small, superview: userView, textColor: .black)
        addressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageView)
            make.top.equalTo(usernameLabel.snp.bottom).offset(2)
            make.right.equalTo(usernameLabel)
            make.bottom.equalTo(userView)
            
        }
        
        addressLabel.numberOfLines = 0
        userView.mainLabel = usernameLabel
        userView.descriptorLabel = addressLabel
        userView.imageView = imageView
        
        return userView
    }
    
    
    /// Gets a label with optional contraints added, and adds it to the superview
    /// Constraints are tied to all edges of superview unless a view above and view below are given in which
    /// it will be tied to the bottom of the view above and the top of the view below
    /// - Parameters:
    ///   - withText: The text to display
    ///   - fontName: The name of the font, of type FontNames, see DEStyle file for details
    ///   - size: The size of the font, of type FontSizes, see DEStyle file for details
    ///   - superview: The superview of this label
    ///   - textColor: THe color of the text for the label
    ///   - numberOfLines: The number of lines for the table, defaults to zero
    ///   - textAlignment: THe alignment of the table, defaults to left
    ///   - backgroundColor: The background color of the table, defaults to clear
    ///   - useConstraints: A boolean value indicating whether you want to use the default constraints or write your own
    ///   - viewAbove: The view above this label
    ///   - viewBelow: The view below this label
    /// - Returns: A UILabel
    class func label (withText: String,
                      fontName: FontNames = .all,
                      size:FontSizes = .Small,
                      superview: UIView!,
                      textColor: UIColor = .black,
                      numberOfLines:Int = 0,
                      textAlignment: NSTextAlignment = .left,
                      backgroundColor: UIColor? = nil,
                      useConstraints:Bool = false,
                      viewAbove:UIView? = nil,
                      viewBelow:UIView? = nil,
                      anchorToBottom: Bool = false,
                      useMargins:Bool = true,
                      viewLeft: UIView? = nil,
                      viewRight:UIView? = nil,
                      height:CGFloat? = nil) -> UILabel {
        let font = UIFont.init(name: fontName.rawValue, size: size.rawValue)
        let label = UILabel()
        label.text = withText
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        if superview != nil {
            superview.addSubview(label)
        }
        if let backgroundColor = backgroundColor {
            label.backgroundColor = backgroundColor
        }
        label.textAlignment = textAlignment
        
        if useConstraints {
            label.snp.makeConstraints({ (make) in
                
                if useMargins {
                    if let viewLeft = viewLeft {
                        make.left.equalTo(viewLeft.snp.right).offset(Sizes.smallMargin.rawValue)
                    } else {
                        make.left.equalTo(superview).offset(Sizes.smallMargin.rawValue)
                    }
                    if let viewRight = viewRight {
                        make.right.equalTo(viewRight.snp.left).offset(-Sizes.smallMargin.rawValue)
                    } else {
                        make.right.equalTo(superview).offset(-Sizes.smallMargin.rawValue)
                    }
                }
                if let height = height {
                    make.height.equalTo(height)
                }
                if let viewAbove = viewAbove {
                    if useMargins {
                        make.top.equalTo(viewAbove.snp.bottom).offset(Sizes.smallMargin.rawValue)
                    } else {
                        make.top.equalTo(viewAbove.snp.bottom)
                    }
                } else {
                    if useMargins {
                        make.top.equalTo(superview).offset(Sizes.smallMargin.rawValue)
                    } else {
                        make.top.equalTo(superview)
                    }
                }
                
                if let viewBelow = viewBelow {
                    make.bottom.equalTo(viewBelow.snp.top)
                }
                
                if anchorToBottom == true {
                    make.bottom.equalTo(superview).offset(-Sizes.smallMargin.rawValue)
                }
            })
        }
                
        return label
    }
    
    
    /// Creates a text field that spans across the its entire super view
    ///
    /// - Parameters:
    ///   - withPlaceholder: The placeholder for the text field
    ///   - superview: The superview for the text field
    ///   - color: The color of the text
    ///   - autocorrection: How to autocorrect
    ///   - borderColor: The color of the border
    /// - Returns: The text field
    class func wideTextField (withPlaceholder: String, superview: UIView?, color: UIColor, autocorrection: UITextAutocorrectionType = UITextAutocorrectionType.no, borderColor: UIColor? = nil, backgroundColor: UIColor = .clear) -> UITextField {
        let font = UIFont.init(name: FontNames.all.rawValue, size: FontSizes.Small.rawValue)
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: withPlaceholder,
                                                             attributes: [NSAttributedString.Key.foregroundColor: color])
        textField.autocapitalizationType = .none
        textField.textColor = color
        textField.autocorrectionType = autocorrection
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
        textField.font = font
        textField.backgroundColor = backgroundColor
        
        if let borderColor = borderColor {
            textField.layer.borderWidth = 0.5
            textField.layer.borderColor = borderColor.cgColor
        }
        
        if let superview = superview {
          superview.addSubview(textField)
        }
        return textField
    }
    
    class func clearButton (with title: String, superview: UIView!, fontSize: FontSizes = .Small, color: UIColor = UIColor.white, font: FontNames? = .all, borderWidth:CGFloat? = nil, borderColor:UIColor? = nil, backgroundColor:UIColor? = nil, cornerRadius:CGFloat = 0 ) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = UIFont.init(name: FontNames.all.rawValue, size: fontSize.rawValue)
        if let font = font {
            button.titleLabel?.font = UIFont.init(name: font.rawValue, size: fontSize.rawValue)
        }
        button.setTitle(title, for: .normal)
        if superview != nil {
            superview.addSubview(button)
        }
        button.backgroundColor = .clear
        button.setTitleColor(color, for: .normal)
        button.showsTouchWhenHighlighted = true
        button.layer.cornerRadius = cornerRadius
        
        if let backgroundColor = backgroundColor {
            button.backgroundColor = backgroundColor
        }
        
        if let borderWidth = borderWidth {
            button.layer.borderWidth = borderWidth
        }
        if let borderColor = borderColor {
            button.layer.borderColor = borderColor.cgColor
        }
        
        return button;
    }
    
    class func largeButton (with title: String, superview: UIView?, backgroundColor:UIColor? = nil, borderColor:UIColor? = nil, fontColor:UIColor? = nil) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = UIFont.init(name: FontNames.all.rawValue, size: FontSizes.Small.rawValue)
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.backgroundColor = .clear
        button.showsTouchWhenHighlighted = true
        if let backgroundColor = backgroundColor {
            button.backgroundColor = backgroundColor
        }
        
        if let borderColor = borderColor {
            button.layer.borderColor = borderColor.cgColor
            button.layer.borderWidth = 0.5
        }
        
        if let fontColor = fontColor {
            button.setTitleColor(fontColor, for: .normal)
        }
        
        if let superview = superview {
            superview.addSubview(button)
        }
        return button;
    }
}

// Enable the ability to use a closure for the UIButton target
typealias UIButtonTargetClosure = (UIButton) -> ()

extension UIButton {
    
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    private var targetClosure: UIButtonTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ClosureWrapper else {  return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, ClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addTargetClosure(closure: @escaping UIButtonTargetClosure) {
        targetClosure = closure
        addTarget(self, action: #selector(UIButton.closureAction), for: .touchUpInside)
    }
    
    @objc func closureAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure(self)
    }
}

public class ClosureWrapper: NSObject {
    let closure: UIButtonTargetClosure
    
    init(_ closure: @escaping UIButtonTargetClosure) {
        self.closure = closure
    }
    
}

public class TagHeaderView: UIView {
    weak var mainLabel:UILabel!
    weak var imageView:UIImageView!
    weak var descriptorLabel:UILabel!
}
