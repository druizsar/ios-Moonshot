//
//  MissionView.swift
//  Moonshot
//
//  Created by David Ruiz on 24/05/23.
//

import SwiftUI

// View to display mission details:

struct MissionView: View {
    
    // Aux struct to describe a crew member:
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    // Properties:
    let mission: Misssion
    let crew: [CrewMember]
    
    // Initializer:
    init(mission: Misssion, astronauts: [String: Astronaut]){
        self.mission = mission
        
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }.sorted { $0.role.count < $1.role.count }
    }
    
    // Body:
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    // Mission logo:
                    VStack {
                        Image(mission.imageName)
                            .resizable().scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.6)
                            .padding(.top)
                        
                        Text(mission.displayDate)
                    }
                    
                    // Divider
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.ligthBackground)
                        .padding(.vertical)
                    
                    // Members:
                    VStack(alignment: .leading) {
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.leading)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach(crew, id: \.role) { crewMember in
                                    NavigationLink {
                                        AstronautView(astronaut: crewMember.astronaut)
                                    } label: {
                                        HStack {
                                            Image(crewMember.astronaut.id)
                                                .resizable()
                                                .frame(width: 104, height: 85, alignment: .center)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .strokeBorder(.white, lineWidth: 1)
                                                )
                                            
                                            VStack(alignment: .leading){
                                                Text(crewMember.astronaut.name)
                                                    .foregroundColor(.white)
                                                    .font(.headline)
                                                    .padding(.bottom)
                                                HStack{
                                                    Text(crewMember.role)
                                                        .foregroundColor(.secondary)
                                                    if (crewMember.role == "Commander"){
                                                        Image(systemName: "star.fill")
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Divider
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.ligthBackground)
                        .padding(.vertical)
                    
                    // Mission Description:
                    VStack(alignment: .leading) {
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Misssion] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
