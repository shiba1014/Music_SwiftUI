//
//  PlaylistCell.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import SwiftUI

struct PlaylistCell: View {
    let playlist: Playlist
    var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                playlist.thumbnail
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5)
                Text(playlist.title)
                    .font(.system(size: 15))
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(playlist.artist)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(8)
    }
}

struct PlaylistCell_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistCell(playlist: Playlist(id: 0, title: "犬にしてくれ", artist: "忘れらんねえよ", thumbnail: Image("inu_1")))
    }
}
