//
//  DetalleMusicaViewModel.swift
//  EjerciciosWebService
//
//  Created by Ronaldo on 1/03/23.
//

import AVFoundation
import Foundation

class DetalleMusicaViewModel: ObservableObject {
    var avPlayer: AVPlayer!

    var isPlaying: Bool {
        return avPlayer.rate != 0
    }

    func loadMusic(urlDeMusica: URL?) {
        let avPlayerItem = AVPlayerItem(url: urlDeMusica!)
        avPlayer = AVPlayer(playerItem: avPlayerItem)
    }

    func playMusic() {
        avPlayer.play()
    }

    func pauseMusic() {
        guard isPlaying else {
            return print("Se Pauso la musica mientras se reproducia!!!")
        }
        avPlayer.pause()
    }
}
