//
//  StudyView.swift
//  LoremIpsum
//
//  Created by ingvar on 11.09.2024.
//

import SwiftUI

struct TabScreenView: View {
    var body: some View {
        TabView {
            StudyView()
                .tabItem { Label("Study", systemImage: "book") }
            CategoryView()
                .tabItem { Label("Game", systemImage: "person") }
        }
    }
}

struct StudyView: View {
    @State private var showSheet = false
    @State private var text = ""
    @State private var placeHolder = "Hello, world!"
    
    var body: some View {
        VStack {
            TextField("Input text:", text: $text)
                .padding()
            SearchField(text: $text)
                .placeholder(placeHolder)
                .padding()
            
            Button("Modal Screen") {
                showSheet.toggle()
            }
            .font(.largeTitle)
            .sheet(isPresented: $showSheet) {
                SheetView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 255/255, green: 249/255, blue: 228/255))
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
    }
}

struct SearchField: UIViewRepresentable {
    @Binding var text: String
    
    private var placeholder = ""
    
    init(text: Binding<String>) {
        _text = text
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        return searchBar
    }
    
    // Always copy the placeholder text across on update
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
        uiView.backgroundColor = UIColor(red: 255/255, green: 249/255, blue: 228/255, alpha: 1)
    }
    
    func placeholder(_ string: String) -> SearchField {
        var view = self
        view.placeholder = string
        return view
    }
}
