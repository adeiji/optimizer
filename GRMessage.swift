//
//  GRMessage.swift
//  PMULibrary
//
//  Created by adeiji on 2019/3/28.
//  Copyright © 2019 Dephyned. All rights reserved.
//

import Foundation


/// Messages from the server to display
public struct Message : Codable {    
    /// When the message expires
    let expiration:String?
    /// The message the display
    let message:String?
    /// The name of the message
    let name:String?
}
