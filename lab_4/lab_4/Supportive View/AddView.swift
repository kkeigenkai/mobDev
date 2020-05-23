//
//  AddView.swift
//  lab_4
//
//  Created by Sergei Pshonnov on 22.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct AddView: View {
    var db: DBHelper
    @Binding var showAdd: Bool
    @Binding var ContactModel: [Contact]
    @State var name = ""
    @State var surname = ""
    @State var number = ""
    
    func handleAdd() {
        if self.name != "" && self.surname != "" && self.number != "" {
            let id = UUID().uuidString
            self.db.insert(id: id, name: self.name, surname: self.surname, number: self.number)
            self.ContactModel.append(Contact(id: id, name: self.name, surname: self.surname, number: self.number))
            self.name = ""
            self.surname = ""
            self.number = ""
            self.showAdd = !self.showAdd
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
                TextField("Введите номер", text: $number, onCommit: self.handleAdd)
            }
            Button(action: {
                self.handleAdd()
            }) {
                Text("Добавить")
            }
            Spacer()
        }.padding()
    }
}
//
//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}
