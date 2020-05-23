//
//  dice.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 19.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct Dice: View {
    var score: [Int]
    
    var body: some View {
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
                Text(String(self.score[0]))
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
                Text(String(self.score[1]))
                    .foregroundColor(.white)
                    .font(.title)
            }
            .padding(40)
        }
    }
}
