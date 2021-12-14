//
//  PListManager.swift
//  Cafit
//
//  Created by Josh Sparks on 12/13/21.
//

import Foundation

protocol PListManager {
    func convert(plist filename: String) -> [OnboardingItem]
}

struct PListManagerImpl: PListManager {
    
    func convert(plist filename: String) -> [OnboardingItem] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let items = try? PropertyListDecoder().decode([OnboardingItem].self, from: data) else {
                  return []
              }
        
        return items
    }
}
