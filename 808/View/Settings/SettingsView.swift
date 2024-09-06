//
//  SettingsView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    
    @StateObject var vmChallenge: ChallengesViewModel
    @StateObject var vmNote = NotesViewModel()
    @StateObject var vmBadge = BadgeViewModel()
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack{
                //MARK: - Toolbar
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(.closeButton)
                            .resizable()
                            .frame(width: 32, height: 32)

                    }
                    Spacer()
                    Text("Settings")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .padding(.trailing, 27)
                    Spacer()
                    
                }
                

                //MARK: - Share App Button
                Button(action: {isPresentShare.toggle()}, label: {
                    SettingButton(text: "Share our app", 
                                  text2: "Share",
                                  imageName: "square.and.arrow.up.fill")
                })
                
                
                //MARK: - Rate App Button
                Button {
                    SKStoreReviewController.requestReview()
                } label: {
                    SettingButton(text: "Rate us",
                                  text2: "Rate",
                                  imageName: "star.square.fill")
                }
                
                //MARK: - Privacy button
                Button(action: {isPresentPolicy.toggle()}, label: {
                    SettingButton(text: "Usage Policy",
                                  text2: "Read",
                                  imageName: "person.badge.shield.checkmark.fill")
                })
                
                //MARK: - Reset button
                Button(action: {
                    vmNote.deleteAll()
                    vmBadge.deleteAll()
                    vmChallenge.delleteAll()
                    dismiss()
                }, label: {
                    SettingButton(text: "Reset progress",
                                  text2: "Reset",
                                  imageName: "trash.square.fill",
                                  color: .red)
                })
                Spacer()
            }.padding()
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresentShare, content: {
            ShareSheet(items: urlShare )
        })
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string:"https://www.termsfeed.com/live/d9cee471-0f2c-419a-ba2d-b5923c4ac56e")!)
        })
    }
}

#Preview {
    SettingsView( vmChallenge: ChallengesViewModel())
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}



