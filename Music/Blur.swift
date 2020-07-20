//
//  Blur.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/10.
//

import SwiftUI

struct Blur: UIViewRepresentable {

    var style: UIBlurEffect.Style = .systemChromeMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

