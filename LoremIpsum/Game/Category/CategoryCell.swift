//
//  CategoryCell.swift
//  LoremIpsum
//
//  Created by ingvar on 11.09.2024.
//

import SwiftUI

struct CategoryCell: View {
    
    var categortModel: Category
    
    var body: some View {
        HStack {
            Text(categortModel.name)
        }
        .frame(maxWidth: .infinity, minHeight: 68)
        .background(categortModel.color)
        .cornerRadius(12)
    }
}

