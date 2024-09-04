//
//  IntroView.swift
//  FastTrack
//
//  Created by Роман on 12.08.2024.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("isFirstStart") var isFirstStart: Bool?
    
    @State private var isPresented = false
    @State private var pageIndex = 0
    @Environment(\.dismiss) var dismiss
    
    private let pages: [PageIntro] = PageIntro.sampalePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                HStack{
                    
                    ForEach(0..<pages.count) { page in
                        if pageIndex == page{
                            RoundedRectangle(cornerRadius: 19)
                                .frame(width: 70, height: 5)
                                .foregroundStyle(.blueApp)
                        }else{
                            RoundedRectangle(cornerRadius: 19)
                                .frame(width: 70, height: 5)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding()
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                    
                        TabView(selection: $pageIndex,
                                content:  {
                            ForEach(pages) { page in
                                PageIntroView(page: page)
                                    .tag(page.tag)
                            }
                        })
                        .fullScreenCover(isPresented: $isPresented, content: {
                            MainView()
                        })
                        .ignoresSafeArea()
                        .animation(.easeInOut, value: pageIndex)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                        
                }.offset(y: 10.0)
                //MARK: - Navigation Button
                Button(action: {
                    pageIndex += 1
                    if pageIndex > pages.count - 1 {
                        isPresented = true
                        isFirstStart = false
                    }
                    
                }, label: {
                BlueButtonView()
                })
                .padding(.horizontal)
                   
                }

               
            
        }
    }
    func incrementPage() {
        pageIndex += 1
    }
    func countUniqueElements(_ array: [Int]) -> Int {
        var uniqueElements = Set<Int>()
        
        for element in array {
            uniqueElements.insert(element)
        }
        
        return uniqueElements.count
    }
}

#Preview {
    IntroView()
}
