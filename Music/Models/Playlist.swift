//
//  Playlist.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import Foundation
import SwiftUI

struct Playlist {
    var id: Int
    var title: String
    var artist: String
    var thumbnail: Image
}

struct Music {
    var id: Int
    var title: String
    var artist: String
    var thumbnail: Image
    var duration: Double
}
