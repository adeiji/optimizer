//
//  GRLoginViewController.swift
//  Graffiti
//
//  Created by adeiji on 4/5/18.
//  Copyright © 2018 Dephyned. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFacebookAuthUI

// This class simply acts as a container for the FirebaseAuthUI
// The FirebaseAuthUI must be presented modally, it can not be set as the rootViewController
// Therefore, in order to show it on launch, you need a skeleton view controller that will display
// the FirebaseAuthUI modally wants it's view appears

public class GRBaseLoginViewController : UIViewController {
    
    let loginVC:UIViewController
    init(loginVC: UIViewController) {
        self.loginVC = loginVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.present(self.loginVC, animated: false, completion: nil)
    }
}

public class GRLoginViewController: FUIAuthPickerViewController {

    let loginView = GRLoginView()
    
    override func viewDidLoad() {
        loginView.setup(with: self.view)

        loginView.eulaButton.addTargetClosure { (_) in
            UIApplication.shared.open(URL(string: "https://app.termly.io/document/terms-of-use-for-website/5e9e6606-5971-410e-8ed3-bd8f0beece8e")!, options: [:], completionHandler: nil);
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, authUI: FUIAuth) {
        super.init(nibName: nil, bundle: nil, authUI: authUI)
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When a user logs in then we need to add that user to the users collections so that we can add custom properties
    // besides the ones that are default with Firebase
    
    
    @objc func skipLoginButtonPressed () {
        Auth.auth().signInAnonymously { (user, error) in
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.isAnonymous = user?.isAnonymous
            // Push up the new view controller

            FirebasePersistenceManager.getDocumentsForUser(withCollection: "tags", userId: FirebasePersistenceManager.getUserId()) { (error, documents) in
                if error == nil {
                    var tags = [Tag]()
                    for tagDoc in documents! {
                        let tag = Tag().tagFromDictionary(dict: tagDoc.data, id: tagDoc.documentId)
                        tags.append(tag)
                    }
                    let viewTagsVC = GRViewTagsViewController(tags: tags, isSearch: false)
                    self.navigationController?.pushViewController(viewTagsVC, animated: true)
                }
            }
        }
    }
}
