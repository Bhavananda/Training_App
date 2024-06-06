//
//  MainView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct MainView: View {
    
    
    @State var selectedSet: SetModel = SetModel.example
    @State var popToMain: Bool = false
    @State var popToMain2: Bool = false
    @State private var text = ""
    @EnvironmentObject var vm: ViewModel
    
    var colorMain = Color(UIColor( #colorLiteral(red: 0.9019607843, green: 0, blue: 0.2862745098, alpha: 1)))
    var colorMainBack = Color(UIColor( #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)))
    
    var searchSet: [SetModel] {
        if text.isEmpty {
            return vm.setsArray
        } else {
            return vm.setsArray.filter { set in set.name.lowercased().contains(text.lowercased())}
        }
    }
    
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 0) {
                
                VStack(alignment: .leading, spacing: 24) {
                    Spacer()
                    Text("HELLO, CHAMPION! 👋")
                        .font(.custom("BebasNeue-Bold", size: 28))
                        .foregroundStyle(.white)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                        HStack {
                            TextField("Search...", text: $text, prompt: Text("Search...")
                                .foregroundStyle(.gray.opacity(0.6)))
                                .padding(.leading, 12)
                                .foregroundColor(.gray.opacity(0.8))
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(colorMain)
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.white)
                                    .frame(width: 22 ,height: 22)
                                    .padding(10)
                            }
                            .fixedSize()
                            .padding(.vertical, 4)
                            .padding(.trailing, 4)
                        }
                    }
                    .padding(.bottom, 24)
                }
                .padding(.horizontal, 16)
                .frame(height: 196)
                .background {
                    Image("search_back")
                        .resizable()
                }
                
                
                VStack {
                    HStack {
                        Text("GENERATED SETS")
                            .font(.custom("BebasNeue-Bold", size: 24))
                            .foregroundStyle(.white)
                        Spacer()
                        NavigationLink(isActive: self.$popToMain2) {
                            GeneratedSets(popToMain: $popToMain2)
                        } label: {
                            HStack {
                                Text("View all")
                                    .font(.system(size: 12, weight: .bold))
                                Image(systemName: "arrow.forward")
                                    .frame(width: 18 ,height: 18)
                            }
                            .foregroundStyle(colorMain)
                        }
                        .isDetailLink(false)
                    }
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(searchSet) { set in
                                Button{
                                    selectedSet = set
                                    popToMain = true
                                } label: {
                                    SetCell(name: set.name, duration: set.duration, count: set.exercisesCount)
                                }
                            }
                            .background {
                                NavigationLink(isActive: self.$popToMain) {
                                    SetDetail(popToMain: $popToMain, setModel: selectedSet)
                                } label: {
                                    EmptyView()
                                }
                                .isDetailLink(false)
                            }
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.top, 24)
                }
                .padding(.top, 32)
                .padding(.horizontal, 16)
            }
            
            .background(colorMainBack)
            .ignoresSafeArea(edges: .top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
