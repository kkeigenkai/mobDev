//
//  EditView.swift
//  lab_4
//
//  Created by Sergei Pshonnov on 22.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct EditView: View {
    var contact: Contact
    var db: DBHelper
    
    @Binding var showEdit: Bool
    @Binding var ContactModel: [Contact]
    
    @State var name = ""
    @State var surname = ""
    @State var number = ""
    
    func handleEdit() {
        if self.name != "" && self.surname != "" && self.number != "" {
            self.db.update(id: self.contact.id, name: self.name, surname: self.surname, number: self.number)
            
            self.ContactModel = self.ContactModel.map { item in
                if item.id == self.contact.id {
                    return Contact(id: self.contact.id, name: self.name, surname: self.surname, number: self.number)
                }
                return item
            }
            
            self.name = ""
            self.surname = ""
            self.number = ""
            self.showEdit = !self.showEdit
        }
    }
    
    var body: some View {
        VStack {
            Text("Добавить контакт")
                .font(.title)
                .fontWeight(.medium)
            List {
                TextField("Введите имя", text: $name)
                TextField("Введите фамилию", text: $surname)
                TextField("Введите номер", text: $number, onCommit: self.handleEdit)
            }
            Button(action: {
                self.handleEdit()
            }) {
                Text("Изменить")
            }
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            self.name = self.contact.name
            self.surname = self.contact.surname
            self.number = self.contact.number
        })
    }
}
