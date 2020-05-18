//
//  WinView.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 17.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct WinView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        VStack {
            Spacer()
            Text("Ты победил!")
                .font(.title)
            Spacer()
            Button(action: {
                self.game.restart()
            }) {
                HStack {
                    Text("Начать заново")
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

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView().environmentObject(Game())
    }
}
