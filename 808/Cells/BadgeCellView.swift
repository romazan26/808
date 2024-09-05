//
//  BadgeCellView.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import SwiftUI

struct BadgeCellView: View {
    
    let badge: Badges
    @StateObject var vm: BadgeViewModel
    
    var body: some View {
        VStack {
            //MARK: - Image
            Image(vm.badges.first?.countCompleted ?? 0 >= badge.countComleted ? badge.compImage : badge.noCompImage)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            //MARK: - Name
            Text(badge.name)
                .foregroundStyle(.white)
                .font(.system(size: 13))
            
            //MARK: - Info button
            Button(action: {
                vm.isPresentInfo.toggle()
                vm.simpleBadge = badge
            }, label: {
                Text("Info")
                    .foregroundStyle(.white)
                    .font(.system(size: 15))
                    .padding(7)
                    .padding(.horizontal, 10)
                    .background {
                        Color.grayApp.cornerRadius(40)
                    }
            })
        }
        .sheet(isPresented: $vm.isPresentInfo) {
            BadgeInfoView(vm: vm)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            Color.second.cornerRadius(20)
        }
    }
}

#Preview {
    BadgeCellView(badge: Badges.first, vm: BadgeViewModel())
}
