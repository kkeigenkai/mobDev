//
//  ContentView.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 16.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var game: Game
    
    func containedView() -> AnyView {
        switch game.game_state {
        case .start:
            return AnyView(StartView())
        case .game:
            return AnyView(GameView())
        case .win:
            return AnyView(WinView())
        case .lose:
            return AnyView(LoseView())
        case .draw:
            return AnyView(DrawView())
        }
    }
    
    var body: some View {
        ZStack {
            containedView()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Game())
    }
}
