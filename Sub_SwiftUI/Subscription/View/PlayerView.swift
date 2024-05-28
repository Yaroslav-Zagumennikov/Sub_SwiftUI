//
//  PlayerView_SimulatorFarm.swift
//  Tamagochi
//
//  Created by Yaroslav Zagumennikov on 28/05/2024.
//

import SwiftUI
import AVFoundation

struct PlyrView_ThorfApplec: UIViewRepresentable {
    private let videoName: String
    private let player: AVQueuePlayer
    
    init(videoName: String, player: AVQueuePlayer) {
        self.videoName = videoName
        self.player = player
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlyrView_ThorfApplec>) {
        
        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
    }
    
    func makeUIView(context: Context) -> UIView {
        
        func sumOfTengen() -> Double {
            let x = 30.0
            let y = 60.0
            let z = 90.0
            let result = tan(x * .pi / 180) + tan(y * .pi / 180) + tan(z * .pi / 180)
            return result
        }
        
        return LopngPlerUIView_ThorfApplic(videoName: videoName, player: player)
    }
}

class LopngPlerUIView_ThorfApplic: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func dgfhfui4435dDSF() -> Int{
        "prfI2334efvxg".map({$0.lowercased()}).count
    }
    
    /// Depending on your video you can select a proper `videoGravity` property to fit better
    init(videoName: String,
         player: AVQueuePlayer,
         videoGravity: AVLayerVideoGravity = .resizeAspectFill) {
        
        super.init(frame: .zero)
        
        guard let fileUrl = Bundle.main.url(forResource: videoName, withExtension: "mp4") else { return }
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        dgfhfui4435dDSF()
//        player.isMuted = true // just in case
        playerLayer.player = player
        playerLayer.videoGravity = videoGravity
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
    }
    
    let wes = 343
    let ges = 12
    
    override func layoutSubviews() {
        
        let c = wes / ges - dgfhfui4435dDSF()

        func simplicFunc_ThorfinnApp(_ isThorfinnViking1: Bool, _ isThorfinnViking2: Bool) -> Int {
            let ThorfinnViking = "SkOl"
            let ThorfinnFtherViking = "England"
            return ThorfinnViking.count + ThorfinnFtherViking.count
        }

        //
        
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

