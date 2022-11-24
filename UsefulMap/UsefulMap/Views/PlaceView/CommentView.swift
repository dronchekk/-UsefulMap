//
//  CommentView.swift
//  UsefulMap
//
//  Created by Dmitry Zasenko on 24.11.22.
//

import SwiftUI

struct CommentView: View {
    
    @State private var isLiked: Bool = false
    var likeCount: UInt = 2
    
    var body: some View {
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Alisa")
                        .bold()
                        .padding(.vertical, 4)
                    Spacer()
                    Button {
                        isLiked.toggle()
                    } label: {
                        Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Text(String(likeCount))
                        .font(.footnote.bold())
                }
                Text("Какую закуску выбрать в качестве завязки, какое блюдо подойдет в момент кульминации и какой десерт сопроводит вас в финале – решать только вам, но в эпилоге вам обязательно предложат рюмку ароматной домашней наливки на посошок.")
                    .font(.subheadline)
                Text("22.03.2022")
                    .font(.footnote.bold())
                    .padding(.vertical, 4)
            }
            Spacer()
            
        }
        .padding()
        .background(.gray)
        .cornerRadius(20)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
