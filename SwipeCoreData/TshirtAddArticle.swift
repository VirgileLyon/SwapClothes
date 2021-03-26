//
//  TshirtAddArticle.swift
//  SwipeCoreData
//
//  Created by Ny Dina on 24/03/2021.
//

import SwiftUI

struct TshirtAddArticle: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: 260, height: 260)
                .foregroundColor(.mint)
                .opacity(0.5)
            Image("AjouterImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 260, height: 260)
                .opacity(0.6)
        }
    }
}

struct TshirtAddArticle_Previews: PreviewProvider {
    static var previews: some View {
        TshirtAddArticle()
    }
}
