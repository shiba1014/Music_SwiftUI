//
//  MusicApp.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import SwiftUI

@main
struct MusicApp: App {
    @State private var selectedTab = 0
    @State private var tabBarHeight: CGFloat = 0.0
    
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .bottom) {
                if selectedTab == 0 {
                    LibraryView(tabBarHeight: $tabBarHeight)
                }
                else if selectedTab == 1 {
                    ForYouView()
                }
                else if selectedTab == 2 {
                    BrowseView()
                }
                else if selectedTab == 3 {
                    RadioView()
                }
                else if selectedTab == 4 {
                    SearchView()
                }
                PlayerTabView(selectedHandler: { selectedTab in
                    self.selectedTab = selectedTab
                })
            }
            .accentColor(.pink)
            .onPreferenceChange(TabSizePreferenceKey.self) { value in
                tabBarHeight = value.height
            }
        }

    }
}


struct TabSizePreferenceKey: PreferenceKey {

    typealias Value = CGSize
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
