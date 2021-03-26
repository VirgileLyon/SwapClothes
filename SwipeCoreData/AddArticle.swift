//
//  AddArticle.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 22/03/2021.
//

import SwiftUI

struct AddArticle: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var categoryPicked: ArticleCategory = .Top
    @State var sizePicked: ArticleSize = .M
    @State var statePicked: ArticleCondition = .neuf
    @State private var showNewArticle = false
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage = UIImage()
    
    @State var description: String = ""
    @State private var selectedImage: String?
    
    var body: some View {
        NavigationView {
            VStack {
                
                ZStack {
                    if inputImage == UIImage() {
                        TshirtAddArticle()
                        Text("Add your article's photo")
                           
                    }
                    else {
                        VStack {
                            Image(uiImage: inputImage)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                Form {
                    
                    Picker("Category", selection: $categoryPicked) {
                        ForEach(ArticleCategory.allCases) {
                            
                            Text($0.rawValue)
                        }
                        
                    }
                    Picker("Size", selection: $sizePicked) {
                        ForEach(ArticleSize.allCases) {
                            article in
                            Text(article.rawValue).tag(article)
                            
                        }
                    }
                    Picker("Condition", selection: $statePicked) {
                        ForEach(ArticleCondition.allCases) {
                            article in
                            Text(article.rawValue).tag(article)
                            
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Description")
                        
                        TextField("Describe your article...", text: $description)
                
                            .frame(height:50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                   
                    validationButton
                }
            }
            
            .navigationBarTitle("Add an article")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage
                   
            ) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$inputImage
                )
            }
           
            
        } .sheet(isPresented: $showNewArticle, content: {
    
            NewArticle(newArticleCategory: $categoryPicked, newArticleSize : $sizePicked, newArticleState: $statePicked, newArticleDescription: $description, showNewArticle: $showNewArticle, newNewImage: $inputImage)
                .environment(\.managedObjectContext, managedObjectContext)
            
        })
    }
    func loadImage() {
    
    }
}
extension AddArticle {
    var validationButton: some View {
        Button(action: {
            save()
            showNewArticle = true
            
        }, label: {
            
            
            
               
                HStack(alignment:.center) {
                    Spacer()
                    Text("Add")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 45)
                        .background(Color.mint)
                        .cornerRadius(10)
                    Spacer()
                }
            
        })
    }
}

extension AddArticle {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    private func save() {
        
        let newArticle = Article(context: managedObjectContext)
        newArticle.name = String(categoryPicked.rawValue)
        newArticle.category = String(categoryPicked.rawValue)
        newArticle.size = String(sizePicked.rawValue)
        newArticle.state = String(statePicked.rawValue)
        newArticle.articleDescription = description
        newArticle.id = UUID()
        newArticle.isLiked = false
        newArticle.image = "\(newArticle.id).jpg"
        if let data = inputImage.jpegData(compressionQuality: 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("\(newArticle.id).jpg")
            try? data.write(to: filename)
        }
        
        do {
            try managedObjectContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
struct AddArticle_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        return AddArticle()
            .environment(\.managedObjectContext, context)
    }
}
