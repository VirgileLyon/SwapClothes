//
//  ArticleSize.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 22/03/2021.
//

import Foundation

enum ArticleSize: String, CaseIterable, Identifiable {
    var id: ArticleSize {self}
    case XXXS = "XXXS/30/2"
    case XXS = "XXS/32/4"
    case XS = "XS/34/6"
    case S = "S/36/8"
    case M = "M/38/10"
    case L = "L/40/12"
    case XL = "XL/42/14"
    case XXL = "XXL/44/16"
    case XXXL = "XXXL/46/18"
    case unique = "Unique size"
    
}
