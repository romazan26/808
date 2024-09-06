//
//  ChallengeView.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import SwiftUI

struct ChallengeView: View {
    @StateObject var vm: ChallengesViewModel
    @StateObject var vmBadge = BadgeViewModel()
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            
            if vm.cheackWin() {
                CompletedView(vm: vm)
            } else {
                //MARK: - Main stack
                VStack(spacing: 30) {
                    //MARK: - Top toolbar
                    HStack {
                        Button(action: {vm.isPresentChallenge.toggle()}, label: {
                            Image(vm.isEdit ? .backButton : .closeButton)
                                .resizable()
                                .frame(width: 32, height: 32)
                        })
        
                        Spacer()
                        Text(vm.isEdit ? "Edit challenge" : "Challenges")
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                        
                        Spacer()
                        if vm.isEdit {
                            Button(action: {vm.delleteChallenge()}, label: {
                                Image(.deleteButton)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            })
                        }
                    }
                    
                    Spacer()
                    
                    //MARK: - Count day off
                    if vm.isEdit {
                        Text("\(Int16(vm.simpleDayOff * Float(vm.simpleChellenge.day)) )/\(vm.simpleChellenge.day)")
                            .foregroundStyle(.white)
                            .font(.system(size: 52, weight: .bold))
                    }else{
                        Text("\(vm.simpleChellenge.dayEnd)/\(vm.simpleChellenge.day)")
                            .foregroundStyle(.white)
                            .font(.system(size: 52, weight: .bold))
                    }
                   
                    Text("The challenge: \(vm.simpleChellenge.day) days of running")
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                    
                    //MARK: Progress
                    if vm.isEdit {
                        Slider(value: $vm.simpleDayOff)
                    }else{
                        CustomProgressBar(progress: 100 / 30 * Float(vm.simpleChellenge.dayEnd), width: 350, color: .blueApp, secondColor: .grayApp)
                    }
                   
                    ScrollView{
                        //MARK: - Grid comleted day
                        if vm.isEdit {
                            ChallengesDayGridView(dayEnd: Int16(vm.simpleDayOff * Float(vm.simpleChellenge.day)))
                        }else{
                            ChallengesDayGridView(dayEnd: vm.simpleChellenge.dayEnd)
                        }
                    }
                    
                    //MARK: - Save button
                    Button(action: {
                        if vm.isEdit{
                            vm.saveEdit()
                            if vm.cheackWin(){
                                vmBadge.oneMoreComleted()
                            }
                            
                        }else{ vm.editMode()}
                    }, label: {
                        if vm.isEdit{
                            BlueButtonView(text: "Save", image: "checkmark", backGrouund: .green)
                        }else{
                            BlueButtonView(text: "Edit", image: "pencil")
                        }
                    })
                }.padding()
            }
            
        }
    }
}

#Preview {
    ChallengeView(vm: ChallengesViewModel())
}


