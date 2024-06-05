//
//  TimerView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 04.06.2024.
//

import SwiftUI

struct TimerView: View {
    
    var colorBack = Color(UIColor( #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)))
    
    @Binding var popToMain: Bool
    
    @State private var isAlertShow = false
    
    @EnvironmentObject var vm: ViewModel
    
    @State var setModel: SetModel
    @State private var navigateToResult = false
    @State private var exerciseTime: Int = 0
    @State private var isTimerPaused = false
    @State private var indexExercise = 0
    
    var formattedTime: String {
        exerciseTime.formattedTime
    }
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            App_Background1()
            
            VStack {
                HStack {
                    Text("\(indexExercise + 1)/\(setModel.exercisesCount)")
                    Spacer()
                    Button {
                        isAlertShow = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white.opacity(0.1))
                            Image(systemName: "xmark")
                                .frame(width: 24, height: 24)
                                .padding(10)
                        }
                        .fixedSize()
                    }
                }
                .padding(.horizontal, 16)
                .foregroundStyle(.white)
                
                VStack {
                    HStack{
                        Text("X\(setModel.exercises[indexExercise].repeats)")
                            .foregroundStyle(.white.opacity(0.5))
                        Text("\(setModel.exercises[indexExercise].name)".uppercased())
                    }
                    Text("\(setModel.exercises[indexExercise].description)")
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                }
                .frame(height: 95)
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 44)
                
                VStack {
                    ZStack {
                        Image("elipse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 270, height: 270)
                        
                        Text("\(formattedTime)")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(colorBack)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.white.opacity(0.1), lineWidth: 1)
                            }
                        HStack(alignment: .center) {
                            HStack {
                                Text("Next:")
                                if indexExercise < setModel.exercisesCount - 1 {
                                    Text("\(setModel.exercises[indexExercise + 1].name)")
                                } else {
                                    Text("FINISH")
                                }
                            }
                            Spacer()
                            Image("icon_next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .padding(.horizontal, 20)
                    }
                    .foregroundStyle(.white)
                    .frame(height: 64)
                    .padding(.bottom, 79)
                    
                    HStack(spacing: 12) {
                        
                        Button {
                            pauseTimer()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.clear)
                                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(.pink, lineWidth: 1))
                                if !isTimerPaused {
                                    Image(systemName: "pause.fill")
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .padding(11)
                                } else {
                                    Image("icon_play")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                        .padding(11)
                                }
                                
                            }
                            .fixedSize()
                        }
                        
                        if indexExercise == setModel.exercisesCount - 1 {
                            NavigationLink {
                                ResultView(popToMain: $popToMain, setModel: setModel)
                            } label: {
                                App_Button(name: "NEXT", iconName: "", iconFrame: false, isImage: true) {
                                    
                                }
                            }
                            .isDetailLink(false)
                            
                        } else {
                            App_Button(name: "NEXT", iconName: "", iconFrame: false) {
                                nextExercise()
                            }
                        }
                        
                    }
                }
                .padding(.horizontal, 16)
            }
            .blur(radius: isAlertShow ? 3 : 0)
            
            if isAlertShow {
                App_Alert {
                    withAnimation {
                        saveExerciseResult()
                        navigateToResult = true
                        isAlertShow = false
                    }
                } funcCancel: {
                    isAlertShow = false
                }
                
                .padding(.top, 294)
            }
            ZStack {
                if navigateToResult {
                    ResultView(popToMain: $popToMain, setModel: setModel)
                        .transition(.move(edge: .leading))
                }
            }
            .zIndex(2.0)
        }
        
        //        .disabled(isAlertShow ? true : false)
        .onReceive(timer) { _ in
            if !isTimerPaused && !isAlertShow {
                if exerciseTime >= 0 {
                    exerciseTime += 1
                } else {
                    if indexExercise < setModel.exercisesCount - 1 {
                        indexExercise += 1
                    } else {
                        //                        saveExerciseResult()
                    }
                    startTimer()
                }
            }
        }
        .onAppear {
            startTimer()
            vm.isTabBarisHidden = true
        }
        .onDisappear {
            if indexExercise == setModel.exercisesCount - 1 {
                saveExerciseResult()
                
            }
        }
        
        .navigationBarHidden(true)
    }
    
    func startTimer() {
        exerciseTime = 0
    }
    
    func nextExercise() {
        saveExerciseResult()
        indexExercise += 1
        startTimer()
    }
    
    func pauseTimer() {
        isTimerPaused.toggle()
    }
    
    func saveExerciseResult() {
        let result = ExerciseResult(exerciseName: setModel.exercises[indexExercise].name, duration: exerciseTime)
        vm.exerciseResults.append(result)
        print(vm.exerciseResults)
    }
    
}

#Preview {
    TimerView(popToMain: .constant(false), setModel: SetModel.example)
        .environmentObject(ViewModel())
    
}
