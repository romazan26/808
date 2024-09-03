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
                Text("New challenge")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                
                //MARK: - Name challenge
                VStack(alignment: .leading){
                    Text("Challenge name:")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    TextField("Enter the name of the challenge", text: $vm.simpleName)
                        .focused($keyboardIsFocused)
                        .padding()
                        .background {
                            Color.second.cornerRadius(16)
                        }
                    
                }.padding(.top, 20)
                
                //MARK: - Day challenge
                VStack{
                    Button(action: {}, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                    Button(action: {}, label: {
                        Text("Button")
                    })
                    Button(action: {}, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                }.padding(.top, 20)
                Spacer()
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
