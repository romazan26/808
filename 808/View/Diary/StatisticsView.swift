//
//  StatisticsView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct StatisticsView: View {
    @StateObject var vmChallenge = ChallengesViewModel()
    @StateObject var vmBadges = BadgeViewModel()
    @StateObject var vm: NotesViewModel
    var body: some View {
        ZStack {
            Image(.backDiary)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack {
                //MARK: - Day challenge
                VStack {
                    Text("\(vmBadges.getDayAfterStrart())")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .bold))
                    Text("days in the challenge")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {Color.second.cornerRadius(20)}
                
                HStack{
                    
                    //MARK: - Challenges completed
                    VStack{
                        ProgressCircleView(progress: 1.0 / Float(vmChallenge.challenges.count) * Float(vmChallenge.completedChallenges.count))
                            .frame(width: 112, height: 112)
                        Text("\(vmChallenge.completedChallenges.count)/\(vmChallenge.challenges.count)")
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold))
                        Text("challenges completed")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                .background {Color.second.cornerRadius(20)}
                    
                    //MARK: - Entries added
                    VStack {
                        VStack{
                            Text("\(vm.notes.count)")
                                .foregroundStyle(.white)
                                .font(.system(size: 28, weight: .bold))
                            Text("entries added")
                                .foregroundStyle(.gray)
                                .font(.system(size: 13))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 102)
                    .background {Color.second.cornerRadius(20)}
                        
                        //MARK: - Achievements received
                        VStack{
                            Text("\(vmBadges.countBadge())")
                                .foregroundStyle(.white)
                                .font(.system(size: 28, weight: .bold))
                            Text("achievements received")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.gray)
                                .font(.system(size: 13))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 102)
                    .background {Color.second.cornerRadius(20)}
                    }
                }
                Spacer()
            }
            
        }
        
    }
}

//#Preview {
//    StatisticsView()
//}
