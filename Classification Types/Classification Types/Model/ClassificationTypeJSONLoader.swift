//
//  ClassificationTypeJSONLoader.swift
//  Classification Types
//
//  Created by Cassidy Pelchat on 7/30/19.
//  Copyright © 2019 Cassidy Pelchat. All rights reserved.
//

import Foundation

class ClassificationTypesJSONLoader {
    
    class func load(fileName: String) -> [ClassificationType] {
        var observations = [ClassificationType]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = ClassificationTypesJSONParser.parse(data)
            
        }
        
        return observations
    }
    
}
