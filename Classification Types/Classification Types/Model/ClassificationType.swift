//
//  ClassificationType.swift
//  Classification Types
//
//  Created by Cassidy Pelchat on 7/30/19.
//  Copyright © 2019 Cassidy Pelchat. All rights reserved.
//

import Foundation

struct ClassificationType {
    let classification: Classification
    let title: String
    let date: Date
    
    init(classification: Classification, title: String, date: Date) {
        self.classification = classification
        self.title = title
        self.date = date
    }
    
    init?(classificationName: String, title: String, date: Date) {
        if let classification = Classification(rawValue: classificationName) {
            self.init(classification: classification, title: title, date: date)
        } else {
            return nil
        }
    }
}
