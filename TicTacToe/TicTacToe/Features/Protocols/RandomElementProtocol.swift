//
//  RandomProtocol.swift
//  TicTacToe
//
//  Created by Jessica Serqueira on 27/10/23.
//



protocol RandomElementProtocol {
    static func randomElement<T>(from collection: [T]) -> T?
}

extension Array: RandomElementProtocol {
    static func randomElement<T>(from collection: [T]) -> T? {
        guard !collection.isEmpty else {
            return nil
        }
        
        let randomIndex = Int.random(in: 0..<collection.count)
        return collection[randomIndex]
    }
}
