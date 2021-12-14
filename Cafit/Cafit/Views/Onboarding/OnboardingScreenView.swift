//
//  OnboardingScreenView.swift
//  Cafit
//
//  Created by Josh Sparks on 12/13/21.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    let manager: OnboardingContentManager
    let handler: OnboardingStartAction
    
    @State private var selected = 0
    
    init(manager: OnboardingContentManager, handler: @escaping OnboardingStartAction) {
        self.manager = manager
        self.handler = handler
    }
    
    var body: some View {
        
        TabView(selection: $selected) {
            ForEach(manager.items.indices) {index in
                OnboardingView(item: manager.items[index],
                               limit: manager.limit,
                               index: $selected,
                handler: handler)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView(manager: OnboardingContentManagerImpl(manager: PListManagerImpl())) {}
    }
}
