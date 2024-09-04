//
//  ChooseDayButtonView.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import SwiftUI

struct ChooseDayButtonView: View {
    @StateObject var vm: ChallengesViewModel
    var level = ""
    var countDay = ""
    var body: some View {
                ZStack {
                    Color(.second)
                        .cornerRadius(12)
                        .overlay {
                            if vm.simpleDay == countDay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.blue, lineWidth: 3.0)
                            }
                        }
                    HStack {
                        Text(level)
                        Spacer()
                        Text("\(countDay) days")
                            .padding(10)
                            .background {
                                Color(vm.simpleDay == countDay ? .blueApp : .grayApp)
                                    .cornerRadius(6)
                            }
                    }
                    .padding(.horizontal, 35)
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .heavy))
                }
                .frame(width: .infinity, height: 60)
            }
}

#Preview {
    ChooseDayButtonView(vm: ChallengesViewModel(), level: "Easy", countDay: "10")
}
