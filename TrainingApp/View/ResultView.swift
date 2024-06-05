//
//  ResultView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 05.06.2024.
//

import SwiftUI

struct ResultView: View {
    
    var colorBack = Color(UIColor( #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)))
    
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
                    .frame(height: 293)
                
                VStack {
                    VStack {
                        VStack(spacing: 11) {
                            Text("Workout complete!")
                            Text("\(setModel.name)")
                        }
                        HStack {
                            VStack(spacing: 8) {
                                Text("Time")
                                Text("\(totalDuration.formattedTime)")
                            }
                            
                            VStack(spacing: 8) {
                                Text("Exer")
                                Text("\(vm.exerciseResults.count)/\(setModel.exercisesCount)")
                            }
                        }
                        .padding(.top, 24)
                    }
                }
                .foregroundStyle(.white)
                .padding(.top, 105)
            }
            
            
            
            
            VStack(alignment: .leading) {
                Text("Deatil of training".uppercased())
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(vm.exerciseResults) { exer in
                            HStack {
                                Text("\(exer.exerciseName)")
                                Spacer()
                                Text("\(exer.duration.formattedTime) min.")
                                
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
        .background(colorBack)
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
