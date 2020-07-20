//
//  PlayerTabView.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/10.
//

import SwiftUI

struct PlayerTabItem: View {
    
    let index: Int
    let icon: Image
    let title: String
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack {
            icon.imageScale(.large)
            Text(title)
                .font(.system(size: 10))
                .fontWeight(.bold)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .foregroundColor(selectedIndex == index ? .pink : .gray)
        .clipShape(Rectangle())
        .onTapGesture {
            selectedIndex = index
        }
    }
}

struct PlayerTabView: View {
    @State private var selectedIndex = 0
    
    let selectedHandler: (Int) -> Void
    private let secondaryGray: Color = .init(white: 0.85)
    
    var nowPlaying =  Music(
        id: 0,
        title: "ハッカ",
        artist: "きのこ帝国",
        thumbnail: Image("neko_1"),
        duration: 301
    )
    
    var body: some View {
        VStack(spacing: 0) {
            NowPlayingView(nowPlaying: nowPlaying)
            Rectangle()
                .fill(secondaryGray)
                .frame(height: 1)
            tabView
                .onChange(of: selectedIndex) { value in
                    selectedHandler(value)
                }
        }
        .background(
            // PlayerTabViewのsizeを測るための.background
            // View自体をGeometryReaderで囲うと広がってしまうため
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: TabSizePreferenceKey.self,
                        value: proxy.size
                    )

            }
        )
        .background(Blur().edgesIgnoringSafeArea(.bottom))
    }
    
    var tabView: some View {
        HStack(spacing: 0) {
            PlayerTabItem(
                index: 0,
                icon: Image(systemName: "music.note.list"),
                title: "ライブラリ",
                selectedIndex: $selectedIndex
            )
            
            Spacer()
            
            PlayerTabItem(
                index: 1,
                icon: Image(systemName: "heart.fill"),
                title: "For You",
                selectedIndex: $selectedIndex
            )
            
            Spacer()
            
            PlayerTabItem(
                index: 2,
                icon: Image(systemName: "music.note"),
                title: "見つける",
                selectedIndex: $selectedIndex
            )
            
            Spacer()
            
            PlayerTabItem(
                index: 3,
                icon: Image(systemName: "dot.radiowaves.left.and.right"),
                title: "Radio",
                selectedIndex: $selectedIndex
            )
            
            Spacer()
            
            PlayerTabItem(
                index: 4,
                icon: Image(systemName: "magnifyingglass"),
                title: "検索",
                selectedIndex: $selectedIndex
            )
        }
        .padding(.top, 8)
        .padding(.horizontal, 8)
        .accentColor(.pink)
    }
}

struct PlayerTabView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTabView(selectedHandler: { _ in })
    }
}
