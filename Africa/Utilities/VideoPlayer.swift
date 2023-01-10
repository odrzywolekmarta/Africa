//
//  File.swift
//  Africa
//
//  Created by Majka on 10/01/2023.
//

import Foundation
import AVKit

//var videoPlayer: AVPlayer?

func playVideo(name: String, format: String) -> AVPlayer {
    guard let url: URL = Bundle.main.url(forResource: name, withExtension: format) else {
        return AVPlayer()
    }
    
    let videoPlayer = AVPlayer(url: url)
    videoPlayer.play()
    
    return videoPlayer
}
