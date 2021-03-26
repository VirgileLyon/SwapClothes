//
//  CardDescriptionView.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 23/03/2021.
//

import SwiftUI

struct CardDescriptionView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var article : Article
    
    var body: some View {
        ZStack {
            VStack {
                Image(uiImage: article.imagePicked)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 400)
                    .clipShape( RoundedRectangle(cornerRadius: 25.0))
                Divider()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Category").font(.title3).bold().foregroundColor(.mint)
                        Text(article.category)
                            .padding(.bottom, 2)
                        
                        Text("Size").font(.title3).bold().foregroundColor(.mint)
                        Text(article.size)
                            .padding(.bottom, 2)
                        
                        Text("Condition").font(.title3).bold().foregroundColor(.mint)
                        Text(article.state)
                            .padding(.bottom, 2)
                        
                        Text("Description").font(.title3).bold().foregroundColor(.mint)
                        Text(article.articleDescription )
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                    }.padding()
                }
            }
        }.navigationBarTitle(article.category)
    }
}
struct CardDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let chemise = Article(context: context)
        chemise.name = "Chemise"
        chemise.category = "Chemise"
        chemise.size = "S/36/8"
        chemise.articleDescription = "A shirt my ex husband loved so much, I need to get rid of it"
        chemise.state = "Never worn"
        
        return CardDescriptionView(article: chemise)
            .environment(\.managedObjectContext, context)
    }
}
