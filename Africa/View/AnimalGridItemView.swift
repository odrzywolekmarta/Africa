//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Majka on 12/01/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPERTIES
    let animal: AnimalModel
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Image(animal.image)
                .resizable()
                .scaledToFit()
            .cornerRadius(12)
            
            Text(animal.name.uppercased())
                .font(.title2)
                .foregroundColor(Color.white)
                .bold()
        } // zstack
    }
}

//MARK: - PREVIEW
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
