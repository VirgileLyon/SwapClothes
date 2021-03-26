////
////  sandbox.swift
////  SwipeCoreData
////
////  Created by Diaraye Fadika on 24/03/2021.
////
//
//import SwiftUI
//
//struct sandbox: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct sandbox_Previews: PreviewProvider {
//    static var previews: some View {
//        sandbox()
//    }
//}
//
//
////
////  CardDescriptionView.swift
////  SwipeCoreData
////
////  Created by Diaraye Fadika on 23/03/2021.
////
//
//import SwiftUI
//
//struct CardDescriptionView: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @Environment(\.editMode) var editMode
//    @State  var categoryPicked: ArticleCategory = .haut
//    @State  var sizePicked: ArticleSize = .M
//    @State var statePicked: ArticleState = .neuf
//    @State private var showNewArticle = false
//    @State var description: String = ""
//    var article : Article
//    //    @Binding var articleImage: String
//    //    @Binding var articleCategory: ArticleCategory
//    //    @Binding var articleSize : ArticleSize
//    //    @Binding var articleState: ArticleState
//    //    @Binding var articleDescription: String
//    var body: some View {
//        VStack {
//            HStack{
//                if editMode?.wrappedValue == .active {
//                    cancel
//                }
//                
//                Spacer()
//                edit
//            }
//            ZStack {
//                VStack {
//                    Image(uiImage: article.imagePicked)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 400, height: 400)
//                        .clipShape( RoundedRectangle(cornerRadius: 25.0))
//                    if editMode?.wrappedValue == .inactive {
//                        Divider()
//                        ScrollView {
//                            VStack(alignment : .leading) {
//                                
//                                Text("Category").font(.title2).bold().foregroundColor(.green)
//                                
//                                Text(article.category)
//                                
//                                Text("Size").font(.title2).bold().foregroundColor(.green)
//                                Text(article.size)
//                                
//                                Text("State").font(.title2).bold().foregroundColor(.green)
//                                Text(article.state)
//                                
//                                Text("Description").font(.title2).bold().foregroundColor(.green)
//                                Text(article.articleDescription)
//                                
//                            }.padding()
//                        }
//                    } else {
//                        Form {
//                            Picker("Catégorie", selection: $categoryPicked) {
//                                ForEach(ArticleCategory.allCases) {
//                                    Text($0.rawValue)
//                                }
//                            }.disabled(editMode?.wrappedValue == .inactive)
//                            
//                            Picker("Taille", selection: $sizePicked) {
//                                ForEach(ArticleSize.allCases) {
//                                    article in
//                                    Text(article.rawValue).tag(article)
//                                    //                            Text($0.rawValue)
//                                }
//                            }.disabled(editMode?.wrappedValue == .inactive)
//                            
//                            Picker("État", selection: $statePicked) {
//                                ForEach(ArticleState.allCases) {
//                                    article in
//                                    Text(article.rawValue).tag(article)
//                                    //                            Text($0.rawValue)
//                                }
//                            }.disabled(editMode?.wrappedValue == .inactive)
//                            
//                            TextField("Décris ton article ...", text: $description)
//                                .disabled(editMode?.wrappedValue == .inactive)
//                            //                            .padding()
//                            
//                        }
//                   
//                        validationButton
//                    }
//                    
//                }
//                
//            }
//        }.navigationBarTitle(article.articleDescription)
//    }
//}
//extension CardDescriptionView {
//    private var cancel: some View {
//        Button("Annuler") {
//            //            draftProfile = modelData.profile
//            editMode?.animation().wrappedValue = .inactive
//        }
//    }
//}
//extension CardDescriptionView {
//    private var edit: some View {
//        EditButton()
//    }
//}
//extension CardDescriptionView {
//    var validationButton: some View {
//        Button(action: {
//            updateArticle(article: article)
//        }, label: {
//            HStack(alignment:.center) {
//                Spacer()
//                Text("Valider")
//                    .font(.title3)
//                    .foregroundColor(.white)
//                    .padding(.vertical, 15)
//                    .padding(.horizontal, 40)
//                    .background(Color.green)
//                    .cornerRadius(10)
//                Spacer()
//            }
//        })
//    }
//}
//extension CardDescriptionView {
//    func updateArticle(article: Article) {
//        let articleUpdated = Article(context: managedObjectContext)
//        
//        articleUpdated.name = String(categoryPicked.rawValue)
//        articleUpdated.category = String(categoryPicked.rawValue)
//        articleUpdated.size = String(sizePicked.rawValue)
//        articleUpdated.state = String(statePicked.rawValue)
//        articleUpdated.articleDescription = description
//        articleUpdated.id = UUID()
//        articleUpdated.isLiked = false
//        articleUpdated.image = ""
//        do {
//            try managedObjectContext.save()
//        }
//        catch {
//            print(error.localizedDescription)
//        }
//    }
//}
//struct CardDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let chemise = Article(context: context)
//        chemise.name = "Chemise"
//        chemise.category = "Chemise"
//        chemise.size = "S/36/8"
//        chemise.articleDescription = "Très tendance"
//        chemise.state = "Neuf"
//        return CardDescriptionView(article: chemise)
//            //        return CardDescriptionView(categoryPicked: .constant(ArticleCategory(rawValue: "Jupe")!), sizePicked: .constant(ArticleSize(rawValue: "M")!), statePicked: .constant(ArticleState(rawValue: "Neuf")!), description: .constant(""), article: chemise)
//            .environment(\.managedObjectContext, context)
//    }
//}
//
////    //            managedObjectContext: chemise,
//////            editMode: ArticleCategory(),
////    ArticleCategory: .constant(ArticleCategory(rawValue: "Jupe")!),
////    ArticleSize:
////    ArticleState: ,
////    ArticleDescription:
