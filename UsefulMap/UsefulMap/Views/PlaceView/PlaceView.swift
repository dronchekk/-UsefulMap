//
//  PlaceView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct PlaceView: View {
    
    //MARK: - Properties
    
    let navigationController: UINavigationController
    let coordinator: Coordinator
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isLiked: Bool = false
    
    //MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: true) {
            ZStack(alignment: .top) {
                Image("IMG_0004")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                menu
                    .padding(.top, 50)
                    .padding()
            }//-ZStack
            VStack {
                Text("Здесь – вы становитесь главным героем книги, которую продолжают писать вот уже больше 20 лет, ее новой главы, где после короткого лирического вступления вас ждет несколько страниц аппетитно написанного содержания будущей сюжетной линии. Какую закуску выбрать в качестве завязки, какое блюдо подойдет в момент кульминации и какой десерт сопроводит вас в финале – решать только вам, но в эпилоге вам обязательно предложат рюмку ароматной домашней наливки на посошок.")
                    .font(.callout)
                    .padding(.vertical)
                
                Text("ул. Ломоносова, 2")
                    .bold()
                    .padding()
                
                HStack {
                    Button {
                    } label: {
                        Text("Позвонить")
                            .foregroundColor(.black)
                            .padding(10)
                            .padding(.horizontal, 10)
                            .background(.gray)
                            .cornerRadius(15)
                    }
                    Button {
                    } label: {
                        Text("Перейти на сайт")
                            .foregroundColor(.black)
                            .padding(10)
                            .padding(.horizontal, 10)
                            .background(.gray)
                            .cornerRadius(15)
                    }
                }
                .padding(.bottom, 20)
                Divider()
                CommentsView()
            }//-VStack
            .padding()
        }//-ScrollView
        .ignoresSafeArea(edges: .top)
        .onAppear() {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }//-body
    
    //MARK: - Menu
    
    var menu: some View {
        return HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12)
                    .foregroundColor(.white)
            }
            Spacer()
            Text("Браться Карамазовы")
                .lineLimit(1)
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.horizontal)
            Spacer()
            Button {
                withAnimation(.spring()) {
                    isLiked.toggle()
                }
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28)
                    .padding(.trailing, 10)
                    .foregroundColor(isLiked ? .red : .white)
            }
            Button {
                //открыть меню
            } label: {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28)
                    .foregroundColor(.white)
            }
        }//-HStack
        .padding(.horizontal)
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView(navigationController: UINavigationController(), coordinator: Coordinator(navigationController: UINavigationController()))
    }
}
