//
//  Astronaut.swift
//  Moonshot
//
//  Created by David Ruiz on 23/05/23.
//

import Foundation

// Struct used to decode astrounaut data from json file.
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
