//
//  PlayerView.swift
//  Music
//
//  Created by Satsuki Hashiba on 2020/07/13.
//

import SwiftUI

struct PlayerView: View {

    var nowPlaying: Music
    @Binding var isPlaying: Bool

    @State private var seekPosition: Double = 0.3
    @State private var currentVolume: Double = 0.5

    private let secondaryGray: Color = .init(white: 0.75)

    var body: some View {
        VStack {
            modalIndicator

            nowPlaying.thumbnail
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
                .shadow(radius: 5)
                .padding(.top, 32)
                .padding(.bottom, 60)
                .padding(.horizontal, 28)

            musicDescription
            seekBar

            Spacer()
            audioControl
            Spacer()

            volumeSlider
            Spacer()
            optionControl

        }
        .padding(.top, 8)
        .padding(.horizontal, 32)
        .padding(.bottom, 16)
    }

    private var modalIndicator: some View {
        HStack {
            Spacer()
            Image(systemName: "minus")
                .imageScale(.large)
                .font(Font.title.weight(.heavy))
                .foregroundColor(secondaryGray)
            Spacer()
        }
        .padding(4)
    }

    private var musicDescription: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(nowPlaying.title)
                    .font(.system(size: 21))
                    .fontWeight(.bold)
                Text(nowPlaying.artist)
                    .font(.system(size: 21))
                    .foregroundColor(.pink)
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "ellipsis")
                    .imageScale(.large)
            })
            .frame(width: 25, height: 25)
            .background(Color.pink.opacity(0.1))
            .clipShape(Circle())
            .accentColor(.pink)
        }
    }

    private var seekBar: some View {
        VStack(spacing: 0) {
            Slider(value: $seekPosition, in: 0...1)
                .accentColor(secondaryGray)
            HStack {
                Text(formatTime(sec: Int(nowPlaying.duration * seekPosition)))
                    .font(.system(size: 14))
                    .foregroundColor(secondaryGray)
                Spacer()
                Text("-" + formatTime(sec: Int(nowPlaying.duration * (1 - seekPosition))))
                    .font(.system(size: 14))
                    .foregroundColor(secondaryGray)
            }
        }
    }

    private var audioControl: some View {

        HStack {
            Button(action: {}, label: {
                Image(systemName: "backward.fill")
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)
            })
            Button(action: {
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 50))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PlayButtonStyle())

            Button(action: {}, label: {
                Image(systemName: "forward.fill")
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)
            })
        }
        .accentColor(.black)
    }

    private var volumeSlider: some View {
        Slider(
            value: $currentVolume,
            in: 0...1,
            minimumValueLabel:
                Image(systemName: "speaker.fill")
                .font(.system(size: 10))
                .foregroundColor(secondaryGray),
            maximumValueLabel:
                Image(systemName: "speaker.3.fill")
                .font(.system(size: 10))
                .foregroundColor(secondaryGray)
        ) {}
        .accentColor(secondaryGray)
    }

    private var optionControl: some View {
        HStack {
            Image(systemName: "quote.bubble")
                .imageScale(.large)
                .frame(maxWidth: .infinity)
            Image(systemName: "airplayaudio")
                .imageScale(.large)
                .frame(maxWidth: .infinity)
            Image(systemName: "list.bullet")
                .imageScale(.large)
                .frame(maxWidth: .infinity)
        }
        .foregroundColor(.pink)
    }

    private func formatTime(sec: Int) -> String {
        let h = sec / 3600 % 24
        let m = sec / 60 % 60
        let s = sec % 60

        if h == 0 {
            return String(format: "%d:%02d", m, s)
        }
        else {
            return String(format: "%d:%d:%02d", h, m, s)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(nowPlaying: Music(id: 0, title: "ハッカ", artist: "きのこ帝国", thumbnail: Image("neko_1"), duration: 301), isPlaying: .constant(false))
    }
}

struct PlayButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 67, height: 67)
            .background(configuration.isPressed ? Color(white: 0.9) : Color.clear)
            .clipShape(Circle())
    }
}
