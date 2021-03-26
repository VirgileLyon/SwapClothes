//
//  testView.swift
//  Swap Clothes
//
//  Created by Iliane Zedadra on 20/03/2021.
//

import SwiftUI

struct EmptyStackView: View {
    var body: some View {
        VStack {
            
            Image(errorCard.image)
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                
                .frame(width: 300, height: 300)
                
                .aspectRatio(contentMode: .fit)
            Text("Oops...").font(.title).foregroundColor(.amaranth).bold()
            Text("We've run out of articles.").font(.title2)
            Spacer()
                .frame(height : 10)
            Text("(Artwork by Burnt Toast ®)").font(.caption)
            
           
           
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStackView()
    }
}
