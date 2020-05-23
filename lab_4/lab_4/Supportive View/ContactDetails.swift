//
//  ContactDetails.swift
//  lab_4
//
//  Created by Sergei Pshonnov on 22.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct ContactDetails: View {
    var contact: Contact
    var db: DBHelper
    
    @Binding var ContactModel: [Contact]
    
    @State var showEdit = false
    
    var body: some View {
        VStack() {
            VStack(alignment: .center) {
                Image("naruto")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                Text("\(self.contact.name) \(self.contact.surname)")
                    .font(.title)
                    .padding(.bottom)
                Text("\(self.contact.number)")
            }
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: {
            self.showEdit = !self.showEdit
        }) {
            Text("Изменить")
        }).sheet(isPresented: self.$showEdit) {
            EditView(contact: self.contact, db: self.db, showEdit: self.$showEdit, ContactModel: self.$ContactModel)
        }
        .padding()
    }
}

