//
//  ContactRow.swift
//  lab_4
//
//  Created by Sergei Pshonnov on 22.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    var body: some View {
        HStack {
            Image("naruto")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
            Text(contact.name)
            Text(contact.surname)
        }
    }
}
