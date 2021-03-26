//
//  ArticleRow.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 22/03/2021.
//

import SwiftUI

struct ArticleRow: View {
    let article: Article
    var context: displayContext = .grid
    
    var body: some View {
        VStack{
            if context == .grid{
                gridDisplay
            } else {
                listDisplay
            }
        }
    }
}
extension ArticleRow {
    enum displayContext {
        case grid, list
    }
}
extension ArticleRow {
    
    private var gridDisplay: some View {
        HStack{
                    Image(uiImage: article.imagePicked)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        
                        
                        
                }
                .padding()
    }
    private var listDisplay: some View {
//            HStack {
////            Image(article.image)
//            Image(uiImage: article.imagePicked)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(maxWidth: 50)
//            VStack(alignment: .leading) {
//                Text(article.category).bold().font(.title3)
//                Spacer()
////                Text("Taille : \(article.size)")
////                Text("État : \(article.state)")
//            } .padding(.leading, 20)
//
//        }
        HStack{
            Image(uiImage: article.imagePicked)
                .resizable()
                .frame(maxWidth: 60, maxHeight: 60)
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 3 )
                .frame(maxWidth: 70, maxHeight: 70)
            Text(article.category)
            
        }
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let chemise = Article(context: context)
        chemise.name = "Chemise"
        chemise.category = "Chemise"
        chemise.size = "S/36/8"
        chemise.articleDescription = "Très tendance"
        chemise.state = "Neuf"
        return ArticleRow(article: chemise)
    }
}

