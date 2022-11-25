//
//  ListItemView.swift
//  UsefulMap
//
//  Created by Dmitry Zasenko on 24.11.22.
//

import SwiftUI

struct ListItemView: View  {
    
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .padding()
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 8)
                .foregroundColor(.gray)
        }
    }
}
