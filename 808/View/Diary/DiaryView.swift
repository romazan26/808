//
//  DiaryView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI


struct DiaryView: View {
    
    @StateObject var vm = NotesViewModel()
    
    @Environment(\.dismiss) var dismiss
    init(){
        let  attributes:[NSAttributedString.Key:Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .normal)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.gray
        UISegmentedControl.appearance().backgroundColor = UIColor.second
    }
    
    var body: some View {
        VStack(spacing: 20) {
            //MARK: - Top toolbar
            HStack {
                Button(action: {dismiss()}, label: {
                    Image(.closeButton)
                        .resizable()
                        .frame(width: 32, height: 32)
                })
                
                Spacer()
                Text("Diary")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                    .padding(.leading, -27)
                Spacer()
                
            }
            
            Text("Record observations to improve your score. Clear planning is the key to achieving your goals!")
                .padding(5)
                .foregroundStyle(.gray)
                .background {Color.second.cornerRadius(20)}
            
            //MARK: - Swich
            Picker("", selection: $vm.selectedView) {
                Text("Notes").tag(1)
                Text("Statistics").tag(2)
            }
            .background(content: {
                Color.gray.cornerRadius(8)
            })
            .pickerStyle(.segmented)
            
            if vm.selectedView == 1{
                NotesView(vm: vm)
            }
            if vm.selectedView == 2{
                StatisticsView( vm: vm)
            }
            Spacer()
        }
        .padding()
        .background {
            Color.main.ignoresSafeArea()
        }
        .sheet(isPresented: $vm.isPresentAddNote, content: {
            AddNoteView(vm: vm)
        })
        
    }
}

#Preview {
    DiaryView()
}
