//
//  ArticleState.swift
//  SwipeCoreData
//
//  Created by Diaraye Fadika on 22/03/2021.
//

import Foundation

enum ArticleCondition: String, CaseIterable, Identifiable {
    case neuf = "Never worn"
    case tresBonEtat = "Very good"
    case bonEtat = "Good"
    case satisfaisant = "Okay"
    var id: ArticleCondition {self}
}
