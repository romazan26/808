//
//  CompletedView.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import SwiftUI

struct CompletedView: View {
    @StateObject var vm: ChallengesViewModel
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(spacing: 20) {
                
                //MARK: - Top toolbar
                HStack {
                    Button(action: {vm.isPresentChallenge.toggle()}, label: {
                        Image(.closeButton)
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
    
                    Spacer()
                    Text("Challenges")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    
                    Spacer()
                }.padding()
                
                Image(.winner)
                    .resizable()
                    .frame(width: 391, height: 391)
                
                VStack{
                    Text("\(vm.simpleChellenge.dayEnd)/\(vm.simpleChellenge.day)")
                        .foregroundStyle(.white)
                        .font(.system(size: 52, weight: .bold))
                        .padding(.top, -80)
                    
                    Text("The challenge: \(vm.simpleChellenge.day) days of running")
                        .foregroundStyle(.white)
                    
                    CustomProgressBar(progress: 100, width: 340, color: .blueApp, secondColor: .grayApp)
                    
                    Text("Congratulations! Your challenge has been successfully completed!")
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Button(action: {vm.restartChallenge()}, label: {
                        BlueButtonView(text: "Restart", image: "memories", backGrouund: .pink)
                            .padding()
                    })
                }.padding()
                
            }
        }
    }
}

#Preview {
    CompletedView(vm: ChallengesViewModel())
}
