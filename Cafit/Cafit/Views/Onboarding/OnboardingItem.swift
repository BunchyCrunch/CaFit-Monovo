//
//  OnboardingItem.swift
//  Cafit
//
//  Created by Josh Sparks on 12/13/21.
//

import Foundation

struct OnboardingItem: Codable, Identifiable {
    var id = UUID()
    var title: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case title, content
    }
    
    init(title: String? = nil,
         content: String? = nil) {
        self.title = title
        self.content = content
    }
    
    init(from decoder: Decoder) throws {
        
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.title = try container.decode(String?.self, forKey: .title)
            self.content = try container.decode(String?.self, forKey: .content)
        } catch {
            print(error)
        }
    }
}
