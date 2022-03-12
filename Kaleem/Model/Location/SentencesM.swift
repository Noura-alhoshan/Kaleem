//
//  SentencesM.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 09/08/1443 AH.
//

import Foundation
import FirebaseFirestoreSwift



struct DocSentences: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    
    var sentencesArray: [String]
    var category: String
    
    
    
}
