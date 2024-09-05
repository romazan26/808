//
//  AddChallengeView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct AddChallengeView: View {
    @StateObject var vm: ChallengesViewModel
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack {
                //MARK: Title view
                HStack {
                    Button(action: {vm.isPresentAddChallenge = false}, label: {
                        Image(.closeButton)
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                    
                        
                    Spacer()
                    Text("New challenge")
                        .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                    .padding(.trailing, 27)
                    Spacer()
                }
                
                //MARK: - Name challenge
                VStack(alignment: .leading){
                    Text("Challenge name:")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                    TextField("Enter the name of the challenge", text: $vm.simpleName)
                        .foregroundStyle(.white)
                        .focused($keyboardIsFocused)
                        .padding()
                        .background {
                            Color.second.cornerRadius(16)
                        }
                    
                }.padding(.top, 30)
                
                //MARK: - Choose day challenge
                VStack{
                    Button(action: {vm.simpleDay = "10"}, label: {
                        ChooseDayButtonView(vm: vm, level: "Easy", countDay: "10")
                    })
                    Button(action: {vm.simpleDay = "20"}, label: {
                        ChooseDayButtonView(vm: vm, level: "Medium", countDay: "20")
                    })
                    Button(action: {vm.simpleDay = "30"}, label: {
                        ChooseDayButtonView(vm: vm, level: "Hard", countDay: "30")
                    })
                }.padding(.top, 30)
                
                //MARK: - Choose emotion
                VStack(alignment: .leading) {
                    Text("Emotion:")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                    HStack(spacing: 15){
                        Button(action: {vm.simpleEmotion = .challenge}, label: {
                            EmotionChooseButton(emotion: .challenge, vm: vm)
                        })
                        Button(action: {vm.simpleEmotion = .badges}, label: {
                            EmotionChooseButton(emotion: .badges, vm: vm)
                        })
                        Button(action: {vm.simpleEmotion = .diary}, label: {
                            EmotionChooseButton(emotion: .diary, vm: vm)
                        })
                        Button(action: {vm.simpleEmotion = .star}, label: {
                            EmotionChooseButton(emotion: .star, vm: vm)
                        })
                        Button(action: {vm.simpleEmotion = .setting}, label: {
                            EmotionChooseButton(emotion: .setting, vm: vm)
                        })
                        Spacer()
                    }
                   
                } .padding(.top, 30)
                Spacer()
                
                Button(action: {vm.addChalleng()}, label: {
                    BlueButtonView(text: "Save",image: "checkmark")
                })
            }.padding()
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
    }
}

#Preview {
    AddChallengeView(vm: ChallengesViewModel())
}
