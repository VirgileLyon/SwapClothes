//
//  NewArticle.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 22/03/2021.
//

import SwiftUI

struct NewArticle: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var newArticleCategory: ArticleCategory
    @Binding var newArticleSize : ArticleSize
    @Binding var newArticleState: ArticleCondition
    @Binding var newArticleDescription: String
    @Binding var showNewArticle: Bool
    //    @Binding var newImage: Image
    @Binding var newNewImage: UIImage
    //    @Binding var newImageString: String
    
    var body: some View {
      
        NavigationView {
            ScrollView {
                
                VStack(alignment : .leading) {
                    
                    Image(uiImage: newNewImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 400)
                        .clipShape( RoundedRectangle(cornerRadius: 25.0))
                    Divider()
                    
                    Text("Catégorie").foregroundColor(.mint).font(.title3).bold()
                    Text(newArticleCategory.rawValue)
                        .padding(.bottom, 2)
                    Text("Taille").foregroundColor(.mint).font(.title3).bold()
                    Text(newArticleSize.rawValue)
                        .padding(.bottom, 2)
                    Text("État").foregroundColor(.mint).font(.title3).bold()
                    Text(newArticleState.rawValue)
                        .padding(.bottom, 2)
                    Text("Description").foregroundColor(.mint).font(.title3).bold()
                    Text(newArticleDescription).frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
                }
            }.padding(.bottom, 2).navigationBarItems(trailing: closeButton).padding().navigationBarTitle("Added!")
            }
    }
}

extension NewArticle {
    private var closeButton: some View {
        Button("Close") {
            showNewArticle = false
        }.foregroundColor(.mint)
    }
}

struct NewArticle_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return NewArticle(
            newArticleCategory: .constant(ArticleCategory(rawValue: "Jupe")!),
            newArticleSize: .constant(ArticleSize(rawValue: "M")!),
            newArticleState: .constant(ArticleCondition(rawValue: "Neuf")!),
            newArticleDescription: .constant(""), showNewArticle: .constant(true), newNewImage: .constant(#imageLiteral(resourceName: "scarfA1")))
            .environment(\.managedObjectContext, context)
        
    }
}
