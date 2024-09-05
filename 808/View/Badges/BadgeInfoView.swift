//
//  BadgeInfoView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct BadgeInfoView: View {
    @StateObject var vm: BadgeViewModel
    var body: some View {
        ZStack {
            //MARK: - Back ground
            Color.main.ignoresSafeArea()
            
            VStack {
                //MARK: - Title view
                HStack {
                    Button(action: {vm.isPresentInfo.toggle()}, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 12, height: 18)
                            Text("Back")
                        }.foregroundStyle(.gray)
                    })
                    Spacer()
                    Text("Badge")
                        .foregroundStyle(.white)
                    .font(.system(size: 17,weight: .bold))
                    .padding(.trailing, 50)
                    Spacer()
                }
                Spacer()
                //MARK: - Image
                Image(vm.badges.first?.countCompleted ?? 0 >= vm.simpleBadge.countComleted ? vm.simpleBadge.compImage : vm.simpleBadge.noCompImage)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .shadow(color: .blue, radius: 70)
                
                //MARK: - Name
                Text(vm.simpleBadge.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 28,weight: .bold))
                //MARK: - Discription
                Text("Exercise: complete \(vm.simpleBadge.countComleted) challenge!")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .padding(.top, 1)
                Spacer()
                if vm.badges.first?.countCompleted ?? 0 >= vm.simpleBadge.countComleted{
                    BlueButtonView(text: "Executed by", image: "checkmark")
                }else{
                    BlueButtonView(text: "Done").opacity(0.5)
                }
               
            }.padding()
        }
    }
}

#Preview {
    BadgeInfoView(vm: BadgeViewModel())
}
