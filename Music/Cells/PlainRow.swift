//
//  PlainRow.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/08.
//

import SwiftUI

struct PlainRow: View {
    let title: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.pink)
                    .font(.title3)
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.small)
                    .foregroundColor(.gray)
            }
            Divider()
        }
        .padding(.top, 4)
        .padding(.horizontal, 20)
    }
}

struct PlainRow_Previews: PreviewProvider {
    static var previews: some View {
        PlainRow(title: "プレイリスト")
    }
}
