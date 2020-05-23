//
//  GameView.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 17.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        VStack {
            Button(action: {
                self.game.game_state = .start
            }) {
                HStack {
                    Text("🏚")
                        .font(.system(size: 40))
                    Spacer()
                }
            }
            VStack {
                Text("🤖")
                    .font(.system(size: 68))
                Text(String(self.game.bot_score))
                    .font(.title)
                Spacer()
                Dice(score: self.game.bot_move)
                Spacer()
            }
            VStack {
                Spacer()
                Dice(score: self.game.player_move)
                Spacer()
                Text(String(self.game.player_score))
                    .font(.title)
                Spacer()
            }
            Button(action: {
                self.game.make_move()
                self.game.update_game_state()
            }) {
                GameButton(text: "Кинуть кубик")
            }
        }
        .padding()
    }
}
