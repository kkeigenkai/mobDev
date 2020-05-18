//
//  Game.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 17.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//
import Foundation
import SwiftUI
import GameKit

enum Game_State {
    case start
    case game
    case win
    case lose
    case draw
}

class Game: ObservableObject {
    @Published var game_state: Game_State = Game_State.start
    @Published var player_score: Int = 0
    @Published var bot_score: Int = 0
    let cube = GKRandomDistribution(lowestValue: 1, highestValue: 6)
    var player_move: [Int] = [0, 0]
    var bot_move: [Int] = [0, 0]

    @objc func update_game_state() {
//        game_state = .game
        if game_state != .start {
            if player_score >= 100 || bot_score >= 100 {
                if player_score >= 100 && bot_score >= 100 {
                    game_state = .draw
                } else if player_score > bot_score {
                    game_state = .win
                } else if player_score < bot_score {
                    game_state = .lose
                }
            }
        } else {
            game_state = .game
        }
        
    }
    
//    @objc func game_state() {
//        game_state = .game
//    }
    
    @objc func make_move() {
        repeat {
            player_move[0] = cube.nextInt()
            player_move[1] = cube.nextInt()
        } while player_move[0] == player_move[1]

        repeat {
            bot_move[0] = cube.nextInt()
            bot_move[1] = cube.nextInt()
        } while bot_move[0] == bot_move[1]
        
        player_score += player_move[0] + player_move[1]
        bot_score += bot_move[0] + bot_move[1]
        
    }
    
    func restart() {
        player_score = 0
        player_move[0] = 0
        player_move[1] = 0
        
        bot_score = 0
        bot_move[0] = 0
        bot_move[1] = 0
        
        game_state = .game
    }
    
}
