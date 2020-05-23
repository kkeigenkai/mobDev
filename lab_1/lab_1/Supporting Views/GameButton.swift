//
//  GameButton.swift
//  lab_1
//
//  Created by Sergei Pshonnov on 19.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import SwiftUI

struct GameButton: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
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
