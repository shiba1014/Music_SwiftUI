//
//  BrowseView.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        NavigationView {
            Text("Browse")
                .navigationTitle(Text("見つける"))
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
