//
//  SetDetail.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct SetDetail: View {
    
    @Binding var popToMain: Bool
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) var dismiss
    var setModel: SetModel
    
    var colorBack = Color(UIColor( #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)))
    var colorBack2 = Color(UIColor( #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 0)))
    
    var body: some View {
        
        ZStack(alignment: .top) {
            colorBack
                .ignoresSafeArea()
            
            VStack {
                ZStack(alignment: .top) {
                    Image("detail_pic")
                        .resizable()
                    
                    HeaderBack(title: "Set Detail") {
                        dismiss()
                        vm.isTabBarisHidden = false
                    }
                    .padding(.top, 60)
                    .padding(.horizontal, 16)
                }
                .zIndex(1)
                .mask {
                    LinearGradient(colors: [colorBack, colorBack, colorBack2], startPoint: .top, endPoint: .bottom)
                }
                .frame(height: 220)
                
                VStack(alignment: .leading) {
                    Text("LIST OF EXERCISES")
                        .font(.custom("BebasNeue-Bold", size: 24))
                        .padding(.bottom, 24)
                        .foregroundColor(.white)
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 14) {
                            ForEach(setModel.exercises) { exercise in
                                ListExercises(name: exercise.name, repeats: exercise.repeats)
                                
                            }
                        }
                        
                    }
                    .mask {
                        LinearGradient(colors: [colorBack, colorBack, colorBack2], startPoint: .top, endPoint: .bottom)
                    }
                    
                    NavigationLink {
                        TimerView(popToMain: $popToMain, setModel: setModel)
                    } label: {
                        App_Button(name: "START TRAINING", iconName: "icon_fire", iconFrame: false, isImage: true) {
                            
                        }
                       
                    }
                    .isDetailLink(false)
                    
                }
                .padding(.horizontal, 16)
                .padding(.top, 98)
                
            }
            .ignoresSafeArea(edges: .top)
            
            ZStack {
                VStack(alignment: .leading) {
                    Text(setModel.name.uppercased())
                        
                        .font(.custom("BebasNeue-Bold", size: 44))
                        .foregroundStyle(.white)
                        .lineLimit(2)
                        .frame(maxWidth: 200, alignment: .leading)
                        
                        
                        
                    HStack {
                        HStack {
                            Image("icon_clock")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("\(setModel.duration) min.")
                        }
                        .padding(8)
                        .background(.white.opacity(0.1))
                        .cornerRadius(8)
                        
                        
                        
                        HStack {
                            Image("icon_ball_white")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("\(setModel.exercisesCount) exer.")
                        }
                        .padding(8)
                        .background(.white.opacity(0.1))
                        .cornerRadius(8)
                    }
                    .font(.system(size: 15, weight: .regular))
                }
                
                .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 19)
            .padding(.top, 104)
            .zIndex(2)
        }
        .navigationBarHidden(true)
        .zIndex(0)
        .onAppear {
            vm.isTabBarisHidden = true

        }
        
    }
}

#Preview {
    SetDetail(popToMain: .constant(false), setModel: SetModel.example)
        .environmentObject(ViewModel())
}
