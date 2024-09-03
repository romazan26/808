//
//  ContentView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var progress: Float = 0
    @State private var isPresent = false
    @AppStorage("isFirstStart") var isFirstStart: Bool?
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            
            //MARK: - Logo
            Image(.challange)
                .resizable()
                .frame(width: 235, height: 230)
                .shadow(color: .blue, radius: 70)
                .padding(.top, 133)
            
            //MARK: - ProgressBar
            VStack{
                CustomProgressBar(progress: progress)
                Text("Loading \(String(format: "%.0f", progress))%")
                    .foregroundStyle(.white)
                    .padding()
            }.padding(.top, 590)
            
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            if isFirstStart ?? true{
                IntroView()
            }else {
                MainView()
            }
            
        })
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if progress < 100{
                    progress += 1
                }else {
                    timer.invalidate()
                    isPresent = true
                }
            }
        })

    }
}

#Preview {
    LoadingView()
}
