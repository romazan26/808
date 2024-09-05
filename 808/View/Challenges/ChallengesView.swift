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
                
                //MARK: - Challenges list
                if vm.challenges.isEmpty {
                    EmptyChallengeView()
                        .padding(.top)
                }else{
                    ScrollView {
                        ForEach(vm.challenges) { challenge in
                            Button(action: {
                                vm.simpleChellenge = challenge
                                vm.isPresentChallenge.toggle()
                            }, label: {
                                ChallengeCellView(challenge: challenge)
                            })
                        }
                    }
                }
                Spacer()
                
                //MARK: - Add challenge buttton
                Button {
                    vm.isPresentAddChallenge = true
                } label: {
                    BlueButtonView(text: "Add new challenge", image: "plus.circle")
                }

            }.padding()
        }
        //MARK: - sheets
        .fullScreenCover(isPresented: $vm.isPresentChallenge, content: {
            ChallengeView(vm: vm)
        })
    }
}

#Preview {
    ChallengesView(vm: ChallengesViewModel(), isPresentChalleges: .constant(true))
}


