//
//  GRViewWithTableView.swift
//  PMULibrary
//
//  Created by adeiji on 2019/3/29.
//  Copyright © 2019 Dephyned. All rights reserved.
//

import Foundation
import UIKit

/// This view displays a view with a GRNavBar and UITableView.
public class GRViewWithTableView: GRView {
    weak var tableView:UITableView?
    
    func setup(superview: UIView, navBarText:String) -> GRViewWithTableView {
        super.setup(superview: superview)
        self.navBar?.header.text = navBarText
        self.navBar?.backButton = GRButton(type: .Back)
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.allowsSelection = false
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navBar?.snp.bottom ?? self)
            make.right.equalTo(self)
            make.left.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        self.tableView = tableView
        return self
    }
}
