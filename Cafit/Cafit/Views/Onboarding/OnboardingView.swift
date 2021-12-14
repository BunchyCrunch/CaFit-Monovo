//
//  OnboardingView.swift
//  Cafit
//
//  Created by Josh Sparks on 12/13/21.
//

import SwiftUI

typealias OnboardingStartAction = () -> Void


struct OnboardingView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    let item: OnboardingItem
    
    let limit: Int
    let handler: OnboardingStartAction
    @Binding var index: Int
    
    internal init(item: OnboardingItem,
                  limit: Int,
                  index: Binding<Int>,
                  handler: @escaping OnboardingStartAction){
        self.item = item
        self.limit = limit
        self._index = index
        self.handler = handler
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(item.title ?? "")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack {
                    Image("Group 1514")
                        .padding(.bottom, 50)
                    //                        .font(.system(size: 120, weight: .bold))
                }
                
                Text(item.content ?? "")
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    handler()
                }, label: {
                    Text("Start")
                })
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.orange)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding(.top, 50)
                
            }
            //            .padding(.bottom, 15)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(item: OnboardingItem(title: "Test", content: "Test"),
                       limit: 0,
                       index: .constant(0)) {}
    }
}
