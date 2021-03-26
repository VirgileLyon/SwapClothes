//
//  ArticlesView.swift
//  SwipeCoreData
//
//  Created by Iliane Zedadra on 25/03/2021.
//


import SwiftUI

struct ArticlesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Article.fetchRequest()) var articles: FetchedResults<Article>
    @Binding var isPresented:Bool
    
  
    var body: some View {
        NavigationView {
        List{
            ForEach(articles, id:\.self) { article in
                ArticleRow(article: article, context: .list)
                    .environment(\.managedObjectContext, managedObjectContext)
            }.onDelete(perform: delete)
            .navigationBarTitle("My articles", displayMode: .inline)
        }.navigationBarItems(trailing: Button(action: { isPresented.toggle() }, label: {
            Text("Dismiss").foregroundColor(.mint)
        }))
        }
    }
}

extension ArticlesView {
    private func delete(indexSet: IndexSet) {
            for index in indexSet {
                let articleToDelete = articles[index]
                managedObjectContext.delete(articleToDelete)
//                try? managedObjectContext.save()
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
}
extension ArticlesView {
    private var edit: some View {
    EditButton()
    }
}
struct ArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
        return ArticlesView( isPresented: .constant(true))
            .environment(\.managedObjectContext, context)
        
    }
}
