//
//  ContentView.swift
//  Cafit
//
//  Created by Josh Sparks on 12/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    let items = Array(0...11).map({ "image\($0)" })
    
    let layout = [
        GridItem(.adaptive(minimum: 100))
        //        GridItem(.flexible(minimum: 100)),
        //        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, content: {
                    ForEach(items, id: \.self) { item in
                        VStack {
                            Image(item)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .border(Color.secondary)
                                .cornerRadius(12)
                                .padding()
                        }
                    }
                })
            }
            .navigationTitle("CFA Menu")
            
        }
//        .fullScreenCover(isPresented: .constant(!hasSeenOnboarding),
//                         content: {
//            let plistManager = PListManagerImpl()
//            let onboardingContentManager = OnboardingContentManagerImpl(manager: plistManager)
//            OnboardingScreenView(manager: onboardingContentManager) {
//                hasSeenOnboarding = true
//            }
//        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
