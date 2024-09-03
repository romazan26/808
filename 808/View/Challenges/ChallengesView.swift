//
//  ChallengesView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct ChallengesView: View {
    @StateObject var vm: ChallengesViewModel
    @Binding var isPresentChalleges: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            //MARK: - Main stack
            VStack {
                //MARK: - top toolbar
                HStack {
                    Button(action: {isPresentChalleges = false}, label: {
                        Image(.closeButton)
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                    
                        
                    Spacer()
                    Text("My challenges")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                        .padding(.trailing, 20)
                    
                    Spacer()
                }
                if vm.challenges.isEmpty {
                    EmptyChallengeView()
                        .padding(.top)
                }else{
                    ForEach(vm.challenges) { challenge in
                        ChallengeCellView(challenge: challenge)
                    }
                }
                Spacer()
                
                Button {
                    vm.isPresentAddChallenge.toggle()
                } label: {
                    BlueButtonView(text: "Add new challenge")
                }

            }.padding()
        }
        .sheet(isPresented: $vm.isPresentAddChallenge, content: {
            AddChallengeView(vm: vm)
        })
    }
}

#Preview {
    ChallengesView(vm: ChallengesViewModel(), isPresentChalleges: .constant(true))
}


