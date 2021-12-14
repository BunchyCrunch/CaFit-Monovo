//
//  Comment.swift
//  Cafit
//
//  Created by Josh Sparks on 12/13/21.
//

import Foundation

struct CommentStringKeys {
    static let text = "text"
    static let rating = "rating"
    static let userID = "userID"
    static let id = "id"
}

class Comment {
    var text: String
    let rating: Double
    let userID: String
    let id: String
    
    init(text: String = "", rating: Double = 0, userID: String = "", id: String) {
        self.text = text
        self.rating = rating
        self.userID = userID
        self.id = id
    }
    
    var dictionary: [String: Any] {
        return [CommentStringKeys.text : text,
                CommentStringKeys.rating : rating,
                CommentStringKeys.userID : userID,
                CommentStringKeys.id : id
        ]
    }
}

extension Comment {
    convenience init?(dictionary: [String : Any] ) {
        guard let text = dictionary[CommentStringKeys.text] as? String,
            let rating = dictionary[CommentStringKeys.rating] as? Double,
            let userID = dictionary[CommentStringKeys.userID] as? String,
            let id = dictionary[CommentStringKeys.id] as? String
            else {return nil}
        
        self.init(text: text, rating: rating, userID: userID, id: id)
    }
}
