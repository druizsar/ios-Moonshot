//
//  AstronautView.swift
//  Moonshot
//
//  Created by David Ruiz on 24/05/23.
//

import SwiftUI

// View to display astronaut details:

struct AstronautView: View {
    
    // Properties:
    let astronaut: Astronaut
    
    // Body:
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .strokeBorder(.ligthBackground, lineWidth: 5)
                    )
                    .padding([.horizontal, .top])
                
                Text(astronaut.description)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["grissom"]!)
    }
}
