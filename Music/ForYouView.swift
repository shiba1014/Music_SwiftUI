//
//  ForYouView.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import SwiftUI

struct ForYouView: View {
    var body: some View {
        NavigationView {
            Text("For You")
                .navigationTitle(Text("For You"))
        }
    }
}

struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouView()
    }
}
