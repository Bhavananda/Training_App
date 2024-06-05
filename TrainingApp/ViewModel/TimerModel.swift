////
////  TimerModel.swift
////  TrainingApp
////
////  Created by Bhavananda Das on 04.06.2024.
////
//
//import Foundation
//import SwiftUI
//import Combine
//
//
//class TimerModel: ObservableObject {
//    
//    @Published var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
//    
//    private var cancellable: Cancellable?
//    
////    func startTimer() {
////        if cancellable == nil {
////            cancellable = timer.connect()
////        }
////    }
////    
////    func stopTimer() {
////        cancellable?.cancel()
////        cancellable = nil
////    }
//}
//
