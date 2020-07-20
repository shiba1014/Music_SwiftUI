//
//  SearchView.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("Search")
                .navigationTitle(Text("検索"))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
