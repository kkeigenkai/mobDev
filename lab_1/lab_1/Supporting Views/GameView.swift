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
            VStack {
                Text("🤖")
                    .font(.system(size: 68))
                Text(String(self.game.bot_score))
                    .font(.title)
                Spacer()
                ZStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray)
                            .frame(width: 100, height: 100)
                        Spacer()
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray)
                            .frame(width: 100, height: 100)
                    }
                    HStack {
                        Text(String(self.game.bot_move[0]))
                            .foregroundColor(.white)
                            .font(.title)
                        Spacer()
                        Text(String(self.game.bot_move[1]))
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(40)
                }
                
                Spacer()
            }
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray)
                            .frame(width: 100, height: 100)
                        Spacer()
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray)
                            .frame(width: 100, height: 100)
                    }
                    HStack {
                        Text(String(self.game.player_move[0]))
                            .foregroundColor(.white)
                            .font(.title)
                        Spacer()
                        Text(String(self.game.player_move[1]))
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(40)
                }
                Spacer()
                Text(String(self.game.player_score))
                    .font(.title)
                Spacer()
            }
            Button(action: {
                self.game.make_move()
                self.game.update_game_state()
            }) {
                HStack {
                    Text("Кинуть кубик")
                        .fontWeight(.regular)
                        .font(.title)
                }
                .padding(.horizontal, 17)
                .padding(.vertical, 9)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
            }
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Game())
    }
}
