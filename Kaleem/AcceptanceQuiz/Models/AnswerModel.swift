//
//  AnswerModel.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID() // Setting the UUID ourselves inside of the model, because API doesn't return a unique ID for each answer
    var text: String
    var isCorrect: Bool
}
