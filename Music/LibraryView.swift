//
//  LibraryView.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import SwiftUI

struct LibraryView: View {

    @Binding var tabBarHeight: CGFloat

    private let filters = [
        "プレイリスト",
        "アーティスト",
        "アルバム",
        "曲",
    ]

    private let playlists = [
        Playlist(id: 0, title: "犬にしてくれ", artist: "忘れらんねえよ", thumbnail: Image("inu_1")),
        Playlist(id: 1, title: "猫とアレルギー", artist: "きのこ帝国", thumbnail: Image("neko_1")),
        Playlist(id: 2, title: "燦々", artist: "カネコアヤノ", thumbnail: Image("neko_2")),
        Playlist(id: 3, title: "僕にできることはないかな", artist: "忘れらんねえよ", thumbnail: Image("inu_2")),
        Playlist(id: 4, title: "RADWIMPS 3 ~無人島に持って行き忘れた一枚~", artist: "RADWIMPS", thumbnail: Image("inu_3")),
        Playlist(id: 5, title: "猫じゃらし - Single", artist: "RADWIMPS", thumbnail: Image("neko_3")),
        Playlist(id: 6, title: "犬にしてくれ", artist: "忘れらんねえよ", thumbnail: Image("inu_1")),
        Playlist(id: 7, title: "猫とアレルギー", artist: "きのこ帝国", thumbnail: Image("neko_1")),
        Playlist(id: 8, title: "燦々", artist: "カネコアヤノ", thumbnail: Image("neko_2")),
        Playlist(id: 9, title: "僕にできることはないかな", artist: "忘れらんねえよ", thumbnail: Image("inu_2")),
        Playlist(id: 10, title: "RADWIMPS 3 ~無人島に持って行き忘れた一枚~", artist: "RADWIMPS", thumbnail: Image("inu_3")),
        Playlist(id: 11, title: "猫じゃらし - Single", artist: "RADWIMPS", thumbnail: Image("neko_3")),
    ]


    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        Divider()
                        ForEach(filters, id: \.self) { filter in
                            NavigationLink(
                                destination: Text(filter),
                                label: {
                                    PlainRow(title: filter)
                                }
                            )
                        }

                        Text("最近追加した項目")
                            .font(.headline)
                            .padding(.top, 8)
                            .padding(.leading, 16)

                        LazyVGrid(columns: [GridItem(spacing: 0), GridItem(spacing: 0)],
                                  spacing: 0) {
                            ForEach(playlists, id: \.id) { playlist in
                                PlaylistCell(playlist: playlist)
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                    // Insetの調整
                    Color.clear.padding(.bottom, tabBarHeight)
                }
            }
            .navigationTitle(Text("ライブラリ"))
            .navigationBarItems(trailing: Button("編集") {})
        }

    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(tabBarHeight: .constant(0))
    }
}
