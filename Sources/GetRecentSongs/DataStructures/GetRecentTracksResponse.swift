//
//  GetRecentTracksResponse.swift
//  GetRecentSongs
//
//  Created by Ryan Krol on 27/12/2018.
//
//  Song: I Love You Like An Alcoholic - The Taxpayers

import Foundation
import SwiftyJSON

public struct GetRecentTracksResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case tracksResponse = "recenttracks"
    }

    private let tracksResponse: JSON

    public func getMostRecentTrack() throws -> Track {
        let trackContainer = self.tracksResponse["track"]
        let tracks = try JSONDecoder().decode([Track].self, from: try trackContainer.rawData())

        guard tracks.count > 0 else {
            throw CommonErrors.NoSongs
        }

        return tracks[0]
    }

}

public struct TrackResponse: Decodable {
    public let track: [Track]

    public func getTracks() throws -> [Track] {
        guard self.track.count > 0 else {
            throw CommonErrors.NoSongs
        }

        return self.track
    }
}

public struct Track: Decodable {
    private let artist: Artist
    private let name: String

    public func toString() -> String {
        return "//  Song: \(self.name) - \(self.artist.name)"
    }
}

public struct Artist: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "#text"
    }

    public let name: String
}
