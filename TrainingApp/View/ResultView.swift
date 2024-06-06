//
//  ResultView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 05.06.2024.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var popToMain: Bool
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var vm: ViewModel
    
    var setModel: SetModel
    
    var totalDuration: Int {
        vm.exerciseResults.reduce(0) { $0 + $1.duration}
    }
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Image("result_back")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 293)
                
                VStack(spacing: 0) {
                    VStack(spacing: 24) {
                        VStack(spacing: 11) {
                            Text("Workout complete!")
                                .foregroundStyle(Color.app_Pink)
                                .font(.system(size: 17, weight: .heavy))
                            Text("\(setModel.name)")
                                .font(.custom("BebasNeue-Bold", size: 44))
                        }
                        HStack(spacing: 66) {
                            VStack(spacing: 8) {
                                Text("Time")
                                    .foregroundStyle(.white.opacity(0.5))
                                    .font(.system(size: 12, weight: .regular))
                                Text("\(totalDuration.formattedTime)")
                                    .font(.custom("BebasNeue-Bold", size: 32))
                            }
                            
                            VStack(spacing: 8) {
                                Text("Exer")
                                    .foregroundStyle(.white.opacity(0.5))
                                    .font(.system(size: 12, weight: .regular))
                                Text("\(vm.exerciseResults.count)/\(setModel.exercisesCount)")
                                    .font(.custom("BebasNeue-Bold", size: 32))
                            }
                        }
//                        .padding(.top, 24)
                    }
                }
                .foregroundStyle(.white)
                .padding(.top, 105)
            }
            
            
            
            
            VStack(alignment: .leading) {
                Text("Deatil of training".uppercased())
                    .font(.custom("BebasNeue-Bold", size: 24))
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(vm.exerciseResults) { exer in
                            HStack {
                                Text("\(exer.exerciseName)")
                                    .font(.custom("BebasNeue-Regular", size: 20))
                                Spacer()
                                Text("\(exer.duration.formattedTime)")
                                    .font(.custom("BebasNeue-Regular", size: 20))
                                + Text("  min.")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(.white.opacity(0.5))
                                
                            }
                        }
                    }
                }
                .padding(.top, 24)
                .padding(.bottom, 8)
                
                
                App_Button(name: "COMPLETE", iconName: "icon_ok", iconFrame: false) {
                    self.popToMain = false
                    vm.exerciseResults.removeAll()
                    vm.isTabBarisHidden = false
                }
                
                
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.top, 34)
        }
        .navigationBarHidden(true)
        .background(Color.app_Back_Gray)
        .ignoresSafeArea(edges: .top)
        .onAppear {
            vm.isTabBarisHidden = true
        }
    }
}


#Preview {
    ResultView(popToMain: .constant(false), setModel: SetModel.example)
        .environmentObject(ViewModel())
}
