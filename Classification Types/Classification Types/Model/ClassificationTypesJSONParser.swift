//
//  ClassificationTypesJSONParser.swift
//  Classification Types
//
//  Created by Cassidy Pelchat on 7/30/19.
//  Copyright © 2019 Cassidy Pelchat. All rights reserved.
//

import Foundation

class ClassificationTypesJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [ClassificationType] {
        var classificationTypes = [ClassificationType]()
        dateFormatter.dateFormat = "YYY-MM-dd'T'HH:mm:ssZ"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options:  []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let classificationName = observation["classification"],
                            let title = observation["title"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let classificationType = ClassificationType(classificationName: classificationName, title: title, date: date) {
                                classificationTypes.append(classificationType)
                            }
                        }
                    }
                }
            }
        }
        
        return classificationTypes
    }
    
}
