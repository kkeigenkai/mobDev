//
//  Contact.swift
//  lab_4
//
//  Created by Sergei Pshonnov on 21.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import Foundation
import SwiftUI

class Contact: Identifiable {
    let id: String
    let name: String
    let surname: String
    let number: String
    
    init(id: String, name: String, surname: String, number: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.number = number
    }
}
