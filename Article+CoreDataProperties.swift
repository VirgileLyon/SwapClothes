//
//  Article+CoreDataProperties.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 22/03/2021.
//
//

import Foundation
import CoreData
import SwiftUI


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        let request = NSFetchRequest<Article>(entityName: "Article")
        request.sortDescriptors = [NSSortDescriptor(key: "category", ascending: true)]
        return request
    }

    @NSManaged public var id: UUID
    @NSManaged public var articleDescription: String
    @NSManaged public var category: String
    @NSManaged public var image: String
    @NSManaged public var name: String
    @NSManaged public var size: String
    @NSManaged public var state: String
    @NSManaged public var isLiked: Bool

}
extension Article {
    private func load(fileName: String) -> UIImage? {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    var imagePicked: UIImage {
        load(fileName: image) ?? UIImage(named: "AjouterImage")!
    }
}

extension Article {
    var inputImg: UIImage {
        UIImage()
    }
}
extension Article {
    var imageImg: Image {
        Image(name)
    }
}
extension Article {
    func imageUI(_ inputImg: UIImage) -> Image {
       return Image(uiImage: self.inputImg)
    }
//    var imageUI: Image {
//        Image(uiImage: self.inputImg)
//    }
}
//extension Article {
//    private func imageUI(inputImage: UIImage) {
//        imagePicked
////        guard let inputImage = inputImage else { return }
////                    imageS = Image(uiImage: inputImage)
//    }
//}

extension Article : Identifiable {

    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
}

    
