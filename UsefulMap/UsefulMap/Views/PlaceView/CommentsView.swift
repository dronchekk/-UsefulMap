//
//  CommentsView.swift
//  UsefulMap
//
//  Created by Dmitry Zasenko on 24.11.22.
//

import SwiftUI

struct CommentsView: View {
    
    //MARK: - Properties
    
    @State private var isCommentViewOpen: Bool = false
    @State private var newCommentText: String = ""
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Отзывы")
                    .font(.title)
                Spacer()
                
                if !isCommentViewOpen {
                    Button {
                        withAnimation {
                            isCommentViewOpen.toggle()
                        }
                    } label: {
                        Text("Написать отзыв")
                            .foregroundColor(.white)
                            .padding(10)
                            .padding(.horizontal, 10)
                            .background(.green)
                            .cornerRadius(15)
                    }
                }
            }//-HStack
            .padding()
            if isCommentViewOpen {
                addCommentView
            }
            Group {
                CommentView()
                CommentView()
                CommentView()
                CommentView()
            }
        }//-VStack
    }//-body
    
    //MARK: - Add Comment View
    
    var addCommentView: some View {
        return VStack {
            Text("Напиши свой отзыв:")
            TextEditor(text: $newCommentText)
                .padding()
                .background(Color.yellow.opacity(0.5))
                .frame(height: 100)
                .cornerRadius(20)
                .scrollContentBackground(.hidden)
            Button {
                withAnimation {
                    isCommentViewOpen.toggle()
                }
            } label: {
                Text("Добавить")
                    .foregroundColor(.white)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(.green)
                    .cornerRadius(15)
            }
            .padding(.bottom, 20)
            Divider()
                .padding(.vertical)
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
