//
//  OnboardingContentManager.swift
//  Cafit
//
//  Created by Josh Sparks on 12/13/21.
//

import Foundation

protocol OnboardingContentManager {
    var limit: Int { get }
    var items: [OnboardingItem] { get} 
    init(manager: PListManager)
}

final class OnboardingContentManagerImpl: OnboardingContentManager {
    var limit: Int {
        items.count - 1
    }
    
    var items: [OnboardingItem]
    
    init(manager: PListManager) {
        self.items = manager.convert(plist: "Onboarding Content")
    }
}
