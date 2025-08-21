//
//  Photo.swift
//  nasa-api-practice
//
//  Created by toño on 21/08/25.
//

import Foundation

struct Photo : Identifiable, Codable, Hashable {
    var id = UUID()
    var title : String
    var explanation : String
    var url : String?
    
    enum CodingKeys : String, CodingKey {
        case title
        case explanation
        case url
    }
}
