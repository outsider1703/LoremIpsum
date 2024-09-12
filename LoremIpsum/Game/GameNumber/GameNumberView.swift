//
//  GameNumberView.swift
//  LoremIpsum
//
//  Created by ingvar on 12.09.2024.
//

import SwiftUI

// MARK: - UI

struct GameNumberView: View {
        
    let title: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 255/255, green: 249/255, blue: 228/255).opacity(1)
                    .ignoresSafeArea()
            }
            .navigationBarTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
