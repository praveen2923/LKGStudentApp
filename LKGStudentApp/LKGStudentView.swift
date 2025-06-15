//
//  ContentView.swift
//  iOSSample
//
//  Created by praveen hiremath on 29/05/25.
//

import SwiftUI

struct LKGStudentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                GeometryReader { geometry in
                    Image("elephant")
                        .resizable()
                        .scaledToFill()
                        .clipped() // ensures no overflow
                        .ignoresSafeArea()
                }
                VStack(spacing: 0) {
                    // Title
                    Text("Shourya LKG ")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    Text("Student")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.top, 40)
                    
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            MenuButton(title: "Alphabets", iconName: "Alphabet", color: .orange, action: {
                                path.append("Alphabets")
                            })
                            MenuButton(title: "Numbers", iconName: "number", color: .blue, action: {
                                path.append("Numbers")
                            })
                        }
                        HStack(spacing: 20) {
                            MenuButton(title: "Colors ", iconName: "color", color: .indigo, action: {
                                path.append("Color")
                            })
                            MenuButton(title: "Animals", iconName: "monkeyIcon", color: .green, action: {
                                path.append("next")
                            })
                        }
                        HStack(spacing: 20) {
                            MenuButton(title: "Shapes", iconName: "vegetablesIcon", color: .indigo, action: {
                                path.append("next")
                            })
                            
                            MenuButton(title: "Vegetables", iconName: "vegetablesIcon", color: .teal, action: {
                                path.append("next")
                            })
                        }
                    }
                    
                }
            }
            .navigationDestination(for: String.self) { value in
              if value == "Alphabets" {
                 ViewForDetail()
              }else if value == "Numbers" {
                  NumberDetails()
              }else if value == "Color" {
                  ColorDetailView()
              }
            }
        }
    }
}


struct MenuButton: View {
    let title: String
    let iconName: String
    let color: Color
    let action: () -> Void
    @State private var isAnimating = false
    @State private var currentColor: Color = .white
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(color)
                .opacity(0.5)
                .overlay(
                    Circle()
                        .stroke(.white, lineWidth: 8)
                )
                .frame(width: 150, height: 150)
            
            VStack {
                Button(action: {
                    action()
                    
                }) {
                    Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .background(.clear)
                }
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

struct LKGStudentView_Previews: PreviewProvider {
    static var previews: some View {
        LKGStudentView()
    }
}



