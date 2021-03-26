//
//  ArticleCategory.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 22/03/2021.
//

import Foundation

enum ArticleCategory: String, CaseIterable, Identifiable {
    var id: ArticleCategory {self}
    case Top, Trousers, Skirt, Dress, Jacket, Sandals, Shoes, Scarf
    
  
}
