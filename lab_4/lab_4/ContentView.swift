//
//  ContentView.swift
//  lab_4
//
//  Created by Sergei Pshonnov on 21.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var db = DBHelper()
    @State var ContactModel: [Contact] = []
    @State var showAdd = false
    
    func deleteItem(at offset: IndexSet) {
        if let unwraped = offset.first {
            let itemId = self.ContactModel[unwraped].id
            self.db.deleteById(id: itemId)
            self.ContactModel.remove(atOffsets: offset)
        } else {
            print("Error while unwraping")
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(self.ContactModel) { contact in
                        NavigationLink(destination: ContactDetails(contact: contact, db: self.db, ContactModel: self.$ContactModel)) {
                            ContactRow(contact: contact)
                        }
                    }.onDelete(perform: deleteItem)
                }.navigationBarTitle("Контакты")
            }.onAppear(perform: {
                self.ContactModel = self.db.read()
            })
            Button(action: {
                self.showAdd = !self.showAdd
            }) {
                HStack {
                    Image(systemName: "text.badge.plus")
                    Text("Добавить контакт")
                }
            }.sheet(isPresented: $showAdd) {
                AddView(db: self.db, showAdd: self.$showAdd, ContactModel: self.$ContactModel)
            }
        }.padding(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
