//
//  Missions.swift
//  Moonshot
//
//  Created by David Ruiz on 23/05/23.
//

import Foundation

// Struct used to decode mission data from json file.
struct Misssion: Codable, Identifiable {
    
    // Struct used to decode crew meember data from json file.
    struct CrewMember: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewMember]
    let description: String
    
    
    // Auxilliar properties
    var imageName : String {
        "apollo\(id)"
    }
    
    var displayName : String {
        "Apollo \(id)"
    }
    
    var displayDate: String {
        launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
    
}
