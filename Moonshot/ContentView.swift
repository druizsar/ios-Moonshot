//
//  ContentView.swift
//  Moonshot
//
//  Created by David Ruiz on 23/05/23.
//

import SwiftUI


// Initial view, displays all the missions:

struct ContentView: View {
    
    // Data:
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Misssion] = Bundle.main.decode("missions.json")
    
    // Layout:
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    // Body
    var body: some View {
        NavigationView {
            ScrollView {
                // Missions:
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.displayDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.ligthBackground)
                            }
                            
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.ligthBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
