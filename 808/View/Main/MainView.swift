//
//  MainView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var challengesVM = ChallengesViewModel()
    @StateObject var badgeVM = BadgeViewModel()
    
    @State var isPresentChalleng = false
    @State var isPresentBadges = false
    @State var isPresentDiary = false
    var body: some View {
        ZStack {
            //MARK: - BackGround
            Color.main.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack {
                //MARK: - Logo
                VStack(spacing: 10) {
                    Image(.challange)
                        .resizable()
                        .frame(width: 143, height: 141)
                    .shadow(color: .blue, radius: 50)
                    
                    Text("Create a challenge")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .heavy))
                        .padding(.top)
                    
                    Text("Add goals, complete them and achieve success")
                        .font(.system(size: 21))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                    
                    Button(action: {challengesVM.isPresentAddChallenge.toggle()}, label: {
                        BlueButtonView(text: "Start")
                            .frame(width: 244)
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background {Color.second.cornerRadius(20)}
                
                //MARK: - Challenges and badges
                HStack{
                    
                    //MARK: Challenges
                    VStack{
                        Image(.challenges)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("My challenges")
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                        Button(action: {isPresentChalleng = true}, label: {
                            OpenButtonView()
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {Color.second.cornerRadius(20)}
                    
                    //MARK: Badges
                    VStack{
                        Image(.badges)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("Badges")
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                        Button(action: {isPresentBadges.toggle()}, label: {
                            OpenButtonView()
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {Color.second.cornerRadius(20)}
                }
                
                //MARK: - Diary
                HStack{
                    Image(.diary)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Diary")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    
                    Spacer()
                    Button(action: {isPresentDiary.toggle()}, label: {
                        OpenButtonView()
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background {Color.second.cornerRadius(20)}
                
                //MARK: - Settings
                HStack{
                    Image(.settings)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Settings")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    
                    Spacer()
                    Button(action: {}, label: {
                        OpenButtonView()
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background {Color.second.cornerRadius(20)}
            }.padding()
        }
        //MARK: - Sheets
        .fullScreenCover(isPresented: $isPresentDiary, content: {
            DiaryView()
        })
        .sheet(isPresented: $challengesVM.isPresentAddChallenge, content: {
            AddChallengeView(vm: challengesVM)
        })
        .fullScreenCover(isPresented: $isPresentChalleng, content: {
            ChallengesView(vm: challengesVM, isPresentChalleges: $isPresentChalleng)
        })
        .fullScreenCover(isPresented: $isPresentBadges, content: {
            BadgesView(vm: badgeVM, isPresentBadges: $isPresentBadges)
        })
    }
}

#Preview {
    MainView()
}
