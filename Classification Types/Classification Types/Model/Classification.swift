//
//  Classification.swift
//  Classification Types
//
//  Created by Cassidy Pelchat on 7/30/19.
//  Copyright © 2019 Cassidy Pelchat. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
