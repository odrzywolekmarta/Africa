//
//  ContentView.swift
//  Africa
//
//  Created by Majka on 06/01/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    @State private var isGridViewActive: Bool = false
    
    func gridSwitch() {
        withAnimation(.easeIn) {
            gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
            gridColumn = gridLayout.count
        }
        
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY

    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        } // loop
                    } // list
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } // nav link
                            } // loop
                        } // grid
                        .padding(10)
                    } // scrollview
                } // condition
            } // group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    } // hstack
                }
            } // toolbar
        } // navigation view
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
