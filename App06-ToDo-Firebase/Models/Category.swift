//
//  Task.swift
//  App06-ToDo-Firebase
//
//  Created by user205865 on 10/7/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Category:Identifiable, Codable{
    @DocumentID var id: String?
    var category_id: String
    var category: String
    var image: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case category_id
        case category
        case image
    }
    
}

