//
//  GetRecentTracksResponse.swift
//  GetRecentSongs
//
//  Created by Ryan Krol on 27/12/2018.
//
//  Song: I Love You Like An Alcoholic - The Taxpayers

import Foundation

public struct GetRecentTracksResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case tracks = "recenttracks"
    }

    private let tracks: [Track]

    public func getTracks() throws -> [Track] {
        guard self.tracks.count > 0 else {
            throw CommonErrors.NoSongs
        }

        return self.tracks
    }
}

public struct Track: Decodable {
    public let artist: Artist
    public let name: String
}

public struct Artist: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "#text"
    }

    public let name: String
}
