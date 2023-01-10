//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Majka on 09/01/2023.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - PROPERTIES
    let animal: AnimalModel
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    if let url = URL(string: animal.link) {
                        Link(animal.name, destination: url)
                    }
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            } // hstack
        } // box
    }
}

//MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
