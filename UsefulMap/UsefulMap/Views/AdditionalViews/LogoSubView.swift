//
//  LogoSubView.swift
//  UsefullMap
//
//  Created by Eduard on 19.11.2022.
//

import SwiftUI

struct LogoSubView: View {
    
    let logoSize = GlobalProperties.share.logoSize
    
    var body: some View {
        HStack{
            Spacer()
            Image("IMG_0004")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: logoSize, height: logoSize)
            Image("UsefulMap (text, black)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: logoSize*0.65)
            Spacer()
        }
    }
}


