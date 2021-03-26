//
//  ProfileView.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 23/03/2021.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.editMode) var editMode
    @ObservedObject var settingsStore: SettingsStore
    @FetchRequest(fetchRequest: Article.fetchRequest()) var articles: FetchedResults<Article>
    
    @State private var isPresented = false
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                Image("MemojiMan")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .shadow(radius: 3)
                
                HStack{
                    Image(systemName: "checkmark.shield")
                    if editMode?.wrappedValue == .inactive {
                        Text(settingsStore.username)
                    } else {
                        TextField("Username", text: $settingsStore.username)
                            .frame(maxHeight:30)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                HStack{
                    Image(systemName: "location")
                    if editMode?.wrappedValue == .inactive {
                        Text(settingsStore.location)
                    } else {
                        TextField("location", text: $settingsStore.location)
                            .frame(maxHeight:30)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                Spacer()
                Text("\(articles.count) articles")
                    .padding(.trailing, 250)
                Spacer()
                ScrollView{
                    LazyVGrid(columns: gridItems){
                        ForEach(articles) {article in
                            NavigationLink(destination: CardDescriptionView(article: article)){
                                ArticleRow(article: article, context: .grid)
                                    .environment(\.managedObjectContext, managedObjectContext)
                            }
                            .environment(\.managedObjectContext, managedObjectContext)
                        }
                    }
                }
                .navigationBarTitle("My profile")
                .navigationBarItems(leading: modifierButton , trailing: editButton)
            }
        }.sheet(isPresented: $isPresented, content: {
            ArticlesView(isPresented: $isPresented)
        })
    }
    private var modifierButton: some View {
        Button(action: { isPresented.toggle() }, label: {
            Text("Remove")
        })
    }
}
extension ProfileView {
    private var editButton: some View {
        Button(action: {
            self.editMode?.wrappedValue = .active == self.editMode?.wrappedValue ? .inactive : .active
        }) {
            Text(.active == self.editMode?.wrappedValue ? "Done" : "Edit")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return ProfileView(settingsStore: SettingsStore())
            .environment(\.managedObjectContext, context)
        
    }
}


//    struct ArticleRow: View {
//        
//        let dressing: Article
//        
//        var body: some View {
//            HStack{
//                Image(dressing.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 260, height: 260)
//            }
//            .padding()
//            
//        }
//    }

