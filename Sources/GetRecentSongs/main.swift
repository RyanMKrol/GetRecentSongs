//
//  main.swift
//  GetRecentSongs
//
//  Created by Ryan Krol on 27/12/2018.
//
//  Song: Love in This Club - Usher, Jeezy

import Foundation

import class SwiftToolbox.APIDataHandler
import class SwiftToolbox.InteractionHandler

do {
    let url = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=somethingmeaty&api_key=deaf44dd2b81aa5bae31374e60ebd91c&format=json"

    let recentArtists = try InteractionHandler.fetch(
        dataHandler: APIDataHandler<GetRecentTracksResponse>(url: URL(string: url)!)
    )

    print(try recentArtists.getMostRecentTrack().toString())


} catch {
    print(error)
}
