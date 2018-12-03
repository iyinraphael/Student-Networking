//
//  Student.swift
//  Student Networking
//
//  Created by Iyin Raphael on 12/3/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String
    
    var firstName: String {
        return String(name.split(separator: " ")[0])
    }
    
    var lastName: String? {
        guard let last = name.split(separator: " ").last else {return nil}
        return String(last)
    }
}
