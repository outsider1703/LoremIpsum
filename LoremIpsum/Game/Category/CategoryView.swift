//
//  ContentView.swift
//  LoremIpsum
//
//  Created by ingvar on 11.09.2024.
//

import SwiftUI

// MARK: - Model

struct Category: Identifiable {
    var id: String { name }
    
    /// Название категории
    let name: String
    /// Цвет категории
    let color: Color
}

// MARK: - ViewModel

final class GameCategory: ObservableObject {
    
    @Published private(set) var category = [
        Category(name: "Логика", color: Color(red: 205/255, green: 69/255, blue: 125/255)),
        Category(name: "Мультики", color: Color(red: 67/255, green: 221/255, blue: 101/255)),
        Category(name: "Страны", color: Color(red: 242/255, green: 202/255, blue: 60/255)),
        Category(name: "Правила", color: Color(red: 60/255, green: 155/255, blue: 242/255))
    ]
}

// MARK: - UI

struct CategoryView: View {
    
    @StateObject var categoryList: GameCategory = .init()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 255/255, green: 249/255, blue: 228/255).opacity(1)
                    .ignoresSafeArea()
                
                List {
                    ForEach(categoryList.category) { category in
                        ZStack {
                            CategoryCell(categortModel: category)
                            NavigationLink(destination: GameNumberView(title: category.name)) {
                                EmptyView()
                            }
                            .opacity(0.0)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
