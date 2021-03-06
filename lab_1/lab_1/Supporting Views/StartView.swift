//
//  StartView.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 17.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        VStack {
            Spacer()
            Text("Кости")
                .font(.system(size: 54))
                .fontWeight(.semibold)
            Text("Наберите 100 очков быстрее противника")
                .font(.subheadline)
            Spacer()
            Button(action: {
                self.game.update_game_state()
            }) {
                GameButton(text: "Кинуть кубик")
            }
        }
        .padding()
    }
}
