//
//  Priority.swift
//  App06-ToDo-Firebase
//
//  Created by user205865 on 10/11/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Priority:Identifiable, Codable{
    @DocumentID var id: String?
    var priority_id: String
    var priority: String
    var image: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case priority_id
        case priority
        case image
    }
    
}
