//
//  DrawView.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 17.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct DrawView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        VStack {
            Spacer()
            Text("Ничья")
                .font(.title)
            Spacer()
            Button(action: {
                self.game.restart()
            }) {
                GameButton(text: "Начать заново")
            }
        }
        .padding()
    }
}
