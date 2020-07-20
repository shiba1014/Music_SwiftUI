//
//  NowPlayingView.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/10.
//

import SwiftUI

struct NowPlayingView: View {

    var nowPlaying: Music
    @State private var isPlaying = false
    @State private var isExpanded = false

    var body: some View {
        HStack(spacing: 16) {
            nowPlaying.thumbnail
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(2)
                .shadow(radius: 5)
            Text(nowPlaying.title)
            Spacer()
            Button(action: {
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 22))
            }
            .padding(.trailing, 8)
            Button(action: {}, label: {
                Image(systemName: "forward.fill")
                    .font(.system(size: 22))
            })
        }
        .accentColor(.black)
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .onTapGesture {
            isExpanded = true
        }
        .sheet(isPresented: $isExpanded) {
            PlayerView(nowPlaying: nowPlaying, isPlaying: $isPlaying)
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView(nowPlaying: Music(id: 0, title: "ハッカ", artist: "きのこ帝国", thumbnail: Image("neko_1"), duration: 301))
    }
}
