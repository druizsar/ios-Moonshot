//
//  Bundle+Decodable.swift
//  Moonshot
//
//  Created by David Ruiz on 23/05/23.
//

import Foundation

extension Bundle {
    
    // Function to decode json files included in bundle.
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        return decodedData
    }
}
