//
//  AudioPlayer.swift
//  LGAudioPlayerLockScreen
//
//  AudioPlayer

import Foundation
import AVFoundation
import MediaPlayer

//TODO: Remove this
let SWAudioPlayerTrackChangedNotification = "SWAudioPlayerTrackChangedNotification"
let SWAudioPlayerPlaybackStateChangedNotification = "SWAudioPlayerPlaybackStateChangedNotification"

open class SWAudioPlayer: NSObject, AVAudioPlayerDelegate
{
    var audioPlayer: AVAudioPlayer?
    var isMusicPlayer: Bool = true  //FIXME: Use a Concrete Subclass not a boolean this will make a mess
    var loopMode: IdeaMode = .repeatAll
    
    var speed: Float = 1 {
        willSet{
            audioPlayer?.rate = newValue
        }
    }
    open var playbackItems: [MPMediaItem]?
    open var currentPlaybackItem: MPMediaItem?
    open var nextPlaybackItem: MPMediaItem? {
        guard let playbackItems = self.playbackItems, let currentPlaybackItem = self.currentPlaybackItem else { return nil }
        
        let nextItemIndex = playbackItems.firstIndex(of: currentPlaybackItem)! + 1
        if nextItemIndex >= playbackItems.count { return nil }
        
        return playbackItems[nextItemIndex]
    }
    open var previousPlaybackItem: MPMediaItem? {
        guard let playbackItems = self.playbackItems, let currentPlaybackItem = self.currentPlaybackItem else { return nil }
        
        let previousItemIndex = playbackItems.firstIndex(of: currentPlaybackItem)! - 1
        if previousItemIndex < 0 { return nil }
        
        return playbackItems[previousItemIndex]
    }
    var nowPlayingInfo: [String : AnyObject]?
    
    var lastTime: TimeInterval?

    var currentTime: TimeInterval? {
        get {
            guard let baseTime = self.audioPlayer?.currentTime else {
                return nil
            }
            return baseTime / Double(speed)
            //return self.audioPlayer?.currentTime
        }
    }
    
    open var duration: TimeInterval? {
        get {
            guard let baseTime = self.audioPlayer?.duration else {
                return nil
            }
            return baseTime / Double(speed)
        }
//return self.audioPlayer?.duration /// Double (speed)
   // }
    }
    
    open var isPlaying: Bool {
        return self.audioPlayer?.isPlaying ?? false
    }
    
    open var volume: Float = 0.707 {    //
        willSet {
            audioPlayer?.volume = newValue
        }
    }
    
    //MARK: - Dependencies
    let audioSession: AVAudioSession!
    let commandCenter: MPRemoteCommandCenter!
    let nowPlayingInfoCenter: MPNowPlayingInfoCenter!
    let notificationCenter: NotificationCenter!
    
    //MARK: - Init
    
    typealias SWAudioPlayerDependencies = (audioSession: AVAudioSession, commandCenter: MPRemoteCommandCenter, nowPlayingInfoCenter: MPNowPlayingInfoCenter, notificationCenter: NotificationCenter, isMusicPlayer: Bool)
    
    #warning("fix me")
    init(audioSession: AVAudioSession, commandCenter: MPRemoteCommandCenter, nowPlayingInfoCenter: MPNowPlayingInfoCenter, notificationCenter: NotificationCenter, isMusicPlayer: Bool) {
        self.audioSession = audioSession
        self.commandCenter = commandCenter
        self.nowPlayingInfoCenter = nowPlayingInfoCenter
        self.notificationCenter = notificationCenter
        self.isMusicPlayer = isMusicPlayer
//
//        super.init()
//
//        try! self.audioSession.setCategory(convertFromAVAudioSessionCategory(AVAudioSession.Category.playback))
//        try! self.audioSession.setActive(true)
//
//        if isMusicPlayer {
//            self.configureCommandCenter()
//        }
//
//        self.notificationCenter.addObserver(self, selector:#selector(save),
//                                            name: UIApplication.willTerminateNotification, object:nil)
//        //restore()
//        //Check for Persistent Data
    }
    
    //TODO: Scrap this
//    init(dependencies: SWAudioPlayerDependencies) {
//        self.audioSession = dependencies.audioSession
//        self.commandCenter = dependencies.commandCenter
//        self.nowPlayingInfoCenter = dependencies.nowPlayingInfoCenter
//        self.notificationCenter = dependencies.notificationCenter
//        self.isMusicPlayer = dependencies.isMusicPlayer
//
//        super.init()
//
//        try! self.audioSession.setCategory(convertFromAVAudioSessionCategory(AVAudioSession.Category.playback))
//        try! self.audioSession.setActive(true)
//
//        if isMusicPlayer {
//            self.configureCommandCenter()
//        }
//
//        self.notificationCenter.addObserver(self, selector:#selector(save),
//                                            name: UIApplication.willTerminateNotification, object:nil)
//        //restore()
//        //Check for Persistent Data
//    }
    
    //MARK: - Playback Commands
    
    open func playItems(_ playbackItems: [MPMediaItem], firstItem: MPMediaItem? = nil) {
        self.playbackItems = playbackItems
        
        if playbackItems.count == 0 {
            self.endPlayback()
            return
        }
        
        let playbackItem = firstItem ?? self.playbackItems!.first!
        
        self.playItem(playbackItem)
    }
    
    func playItem(_ playbackItem: MPMediaItem) {
        guard let audioPlayer = try? AVAudioPlayer(contentsOf: playbackItem.assetURL!) else {
            self.endPlayback()
            return
        }
        
        audioPlayer.delegate = self
        audioPlayer.enableRate = true
        audioPlayer.rate = speed
        audioPlayer.prepareToPlay()
        audioPlayer.volume = volume
        if lastTime != nil {
            audioPlayer.currentTime = lastTime!
        }
        audioPlayer.play()
        
        self.audioPlayer = audioPlayer
        
        self.currentPlaybackItem = playbackItem
        
        self.updateNowPlayingInfoForCurrentPlaybackItem()
        self.updateCommandCenter()
        
        self.notifyOnTrackChanged()
    }
    
    func loadItem(_ playbackItem: MPMediaItem) {
        guard let audioPlayer = try? AVAudioPlayer(contentsOf: playbackItem.assetURL!) else {
            self.endPlayback()
            return
        }
        
        audioPlayer.delegate = self
        audioPlayer.enableRate = true
        audioPlayer.rate = speed
        audioPlayer.prepareToPlay()
        audioPlayer.volume = volume
        if lastTime != nil {
            audioPlayer.currentTime = lastTime!
        }
        //audioPlayer.play()
        
        self.audioPlayer = audioPlayer
        
        self.currentPlaybackItem = playbackItem
        
        self.updateCommandCenter()
        self.updateNowPlayingInfoElapsedTime()
        self.updateNowPlayingInfoForCurrentPlaybackItem()
        
        self.notifyOnTrackChanged()
        self.notifyOnPlaybackStateChanged()
    }
    
    open func togglePlayPause() {
        if self.isPlaying {
            self.pause()
        }
        else {
            self.play()
        }
    }
    
    open func play() {
        if lastTime != nil {
            audioPlayer?.currentTime = lastTime!
        }
        self.audioPlayer?.play()
        self.updateNowPlayingInfoElapsedTime()
        self.notifyOnPlaybackStateChanged()
    }
    
    open func pause() {
        self.audioPlayer?.pause()
        self.lastTime = audioPlayer?.currentTime
        self.updateNowPlayingInfoElapsedTime()
        self.notifyOnPlaybackStateChanged()
    }
    
    open func nextTrack() {
        
        self.lastTime = 0

        switch loopMode {
        case .repeatAll:
            if self.nextPlaybackItem == nil {
                if let firstItem = self.playbackItems?[0] {
                    playItem(firstItem)
                }
            }
            else {
                //self.nextTrack()
                guard let nextPlaybackItem = self.nextPlaybackItem else { return }
                self.playItem(nextPlaybackItem)
            }
        case .random:
            if let numbersOfItems = playbackItems?.count {
                let diceRoll = Int(arc4random_uniform(UInt32(numbersOfItems)))
                if let firstItem = self.playbackItems?[diceRoll] {
                    playItem(firstItem)
                }
            }
        case .repeatOne:
            playItem(currentPlaybackItem!)
        }
        
        //guard let nextPlaybackItem = self.nextPlaybackItem else { return }
        //self.playItem(nextPlaybackItem)
        self.updateCommandCenter()
    }
    
    open func previousTrack() {
        guard let previousPlaybackItem = self.previousPlaybackItem else { return }
        self.lastTime = 0
        self.playItem(previousPlaybackItem)
        self.updateCommandCenter()
    }
    
    open func seekTo(_ timeInterval: TimeInterval) {
        self.audioPlayer?.currentTime = timeInterval
        self.updateNowPlayingInfoElapsedTime()
    }
    
    
    
    //MARK: - Command Center
    
    func updateCommandCenter() {
        guard let playbackItems = self.playbackItems, let currentPlaybackItem = self.currentPlaybackItem else { return }
        if isMusicPlayer {
            self.commandCenter.previousTrackCommand.isEnabled = currentPlaybackItem != playbackItems.first!
            self.commandCenter.nextTrackCommand.isEnabled = currentPlaybackItem != playbackItems.last!
        }
    }
    
    func configureCommandCenter() {
//        self.commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
//            guard let sself = self else { return .commandFailed }
//            sself.play()
//            return .success
//        })
//        
//        self.commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
//            guard let sself = self else { return .commandFailed }
//            sself.pause()
//            return .success
//        })
        if isMusicPlayer {
            self.commandCenter.nextTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
                guard let sself = self else { return .commandFailed }
                sself.nextTrack()
                return .success
            })
            self.commandCenter.previousTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
                guard let sself = self else { return .commandFailed }
                sself.previousTrack()
                return .success
            })
        }
    }
    
    //MARK: - Now Playing Info
    
    func updateNowPlayingInfoForCurrentPlaybackItem() {
        guard let audioPlayer = self.audioPlayer, let currentPlaybackItem = self.currentPlaybackItem else {
            self.configureNowPlayingInfo(nil)
            return
        }
        
        //Extract Names Saved in Dictionary
        var bookTitle = "AudioWave"
        var musicTitle = "Mind Heist"
//        var albumImage: MPMediaItemArtwork!
        if let infoDictionary = self.nowPlayingInfoCenter.nowPlayingInfo {
            if let bkTitle = infoDictionary[MPMediaItemPropertyTitle] as? String{
                bookTitle = bkTitle
            }
            if let bkTitle = infoDictionary[MPMediaItemPropertyAlbumTitle] as? String {
                musicTitle = bkTitle
            }
//            if let art = infoDictionary[MPMediaItemPropertyArtwork] as? MPMediaItemArtwork {
//                //nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtwork] = art
//
//            }
//            else {
//                let artwork = MPMediaItemArtwork.init(boundsSize: #imageLiteral(resourceName: "cymatics-6").size, requestHandler: { (size) -> UIImage in
//                    return #imageLiteral(resourceName: "cymatics-6")
//                })
//                nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtwork] =  artwork
//            }
        }

        if self.currentPlaybackItem != nil, isMusicPlayer == true {
            if let title = currentPlaybackItem.title {
                musicTitle = title
            }
            else {
                musicTitle = "Mind Heist"
            }
            //nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtwork] = albumImage
        }

        if self.currentPlaybackItem != nil, isMusicPlayer == false {
            if let title = currentPlaybackItem.title {
                bookTitle = title
                if let image = currentPlaybackItem.artwork {
                    nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtwork] = image
                }
                else {
                    //let image = #imageLiteral(resourceName: "cymatics-6")
                    let artwork = MPMediaItemArtwork.init(boundsSize: #imageLiteral(resourceName: "cymatics-6").size, requestHandler: { (size) -> UIImage in
                        return #imageLiteral(resourceName: "cymatics-6")
                    })
                    nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtwork] =  artwork
                }
            }
            else {
                bookTitle = "AudioWave"
                let artwork = MPMediaItemArtwork.init(boundsSize: #imageLiteral(resourceName: "cymatics-6").size, requestHandler: { (size) -> UIImage in
                    return #imageLiteral(resourceName: "cymatics-6")
                })
                nowPlayingInfoCenter.nowPlayingInfo?[MPMediaItemPropertyArtwork] =  artwork
            }
        }

        
        let nowPlayingInfo = [MPMediaItemPropertyTitle: bookTitle,
            MPMediaItemPropertyAlbumTitle: musicTitle,
            //MPMediaItemPropertyArtist: currentPlaybackItem.artist ?? "",
            MPMediaItemPropertyPlaybackDuration: audioPlayer.duration,
            MPNowPlayingInfoPropertyPlaybackRate: NSNumber(value: 1.0 as Float)] as [String : Any]

        self.configureNowPlayingInfo(nowPlayingInfo as [String : AnyObject]?)
        
        self.updateNowPlayingInfoElapsedTime()
    }
    
    
    func updateNowPlayingInfoElapsedTime() {
        guard var nowPlayingInfo = self.nowPlayingInfo, let audioPlayer = self.audioPlayer else { return }
        
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = NSNumber(value: audioPlayer.currentTime as Double);
        
        self.configureNowPlayingInfo(nowPlayingInfo)
    }
    
    func configureNowPlayingInfo(_ nowPlayingInfo: [String: AnyObject]?) {
        self.nowPlayingInfoCenter.nowPlayingInfo = nowPlayingInfo
        self.nowPlayingInfo = nowPlayingInfo        
    }
    
    //MARK: - AVAudioPlayerDelegate
    
    open func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        if self.nextPlaybackItem == nil {
//            self.endPlayback()
//        }
//        else {
//            self.nextTrack()
//        }

        
        self.nextTrack()
    }
    
    func endPlayback() {
        self.currentPlaybackItem = nil
        self.audioPlayer = nil
        
        self.updateNowPlayingInfoForCurrentPlaybackItem()
        self.notifyOnTrackChanged()
    }
    
    open func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        self.notifyOnPlaybackStateChanged()
    }
    
    open func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        if AVAudioSession.InterruptionOptions(rawValue: UInt(flags)) == .shouldResume {
            self.play()
        }
    }
    
    //MARK: - Convenience
    
    func notifyOnPlaybackStateChanged() {
        self.notificationCenter.post(name: Notification.Name(rawValue: SWAudioPlayerPlaybackStateChangedNotification), object: self)
    }
    
    func notifyOnTrackChanged() {
        self.notificationCenter.post(name: Notification.Name(rawValue: SWAudioPlayerTrackChangedNotification), object: self)
    }
    
    //MARK: - Persistence
    
    @objc func save() {
        if isMusicPlayer {
            print("Save MusicPlayer State")
            var itemIDs = [MPMediaEntityPersistentID]()
            guard playbackItems != nil, currentPlaybackItem != nil, currentTime != nil else {
                print("Didn't meet criteria for save")
                return
            }
            for item in playbackItems! {
                itemIDs.append(item.persistentID)
                print(item.persistentID)
            }
            let playerState = SWPlayerState(playbackTime: currentTime!, currentItemID: currentPlaybackItem!.persistentID, playbackItemIDs: itemIDs, speed: speed)
            let fileManager = FileManager.default
            let documentsDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let musicPlayerURL = URL(fileURLWithPath: "music", relativeTo: documentsDirectory)
            let saveSucceeded = NSKeyedArchiver.archiveRootObject(playerState, toFile: musicPlayerURL.path)
            if !saveSucceeded {
                print("Failed to save musicPlayer state...")
            }
        }
        if isMusicPlayer == false {
            print("Save AudioPlayer State")
            var itemIDs = [MPMediaEntityPersistentID]()
            guard playbackItems != nil, currentPlaybackItem != nil, currentTime != nil else {
                print("Didn't meet criteria for save")
                return
            }
            for item in playbackItems! {
                itemIDs.append(item.persistentID)
                print(item.persistentID)
            }
            let playerState = SWPlayerState(playbackTime: currentTime!, currentItemID: currentPlaybackItem!.persistentID, playbackItemIDs: itemIDs, speed: speed)
            let fileManager = FileManager.default
            let documentsDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let bookPlayerURL = URL(fileURLWithPath: "books", relativeTo: documentsDirectory)
            let saveSucceeded = NSKeyedArchiver.archiveRootObject(playerState, toFile: bookPlayerURL.path)
            if !saveSucceeded {
                print("Failed to save musicPlayer state...")
            }
        }
    }
    
    func restore() {
        
//        let fileManager = FileManager.default
//        let documentsDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
//        
//        if isMusicPlayer {
//            print("Restore MusicPlayer State")
//            let musicPlayerURL = URL(fileURLWithPath: "music", relativeTo: documentsDirectory)
//            guard let playerState = NSKeyedUnarchiver.unarchiveObject(withFile: musicPlayerURL.path) as? SWPlayerState else {
//                print("No Persistent MusicPlayer State Available")
//                return
//            }
//            self.lastTime = playerState.playbackTime
//            self.currentPlaybackItem = findSongWithPersistentID(id: playerState.currentItemID)
//            var playbackItems = [MPMediaItem]()
//            for itemID in playerState.playbackItemIDs {
//                if let mediaItem = findSongWithPersistentID(id: itemID) {
//                    playbackItems.append(mediaItem)
//                }
//            }
//            self.speed = playerState.speed
//            self.playbackItems = playbackItems
//            //self.playItems(playbackItems, firstItem: currentPlaybackItem)
//
//            self.loadItem(self.currentPlaybackItem!)
//
//        }
//        if isMusicPlayer == false {
//            print("Restore AudioPlayer State")
//            let audioPlayerURL = URL(fileURLWithPath: "books", relativeTo: documentsDirectory)
//            guard let playerState = NSKeyedUnarchiver.unarchiveObject(withFile: audioPlayerURL.path) as? SWPlayerState else {
//                print("No Persistent MusicPlayer State Available")
//                return
//            }
//            self.lastTime = playerState.playbackTime
//            self.currentPlaybackItem = findSongWithPersistentID(id: playerState.currentItemID)
//            var playbackItems = [MPMediaItem]()
//            for itemID in playerState.playbackItemIDs {
//                if let mediaItem = findSongWithPersistentID(id: itemID) {
//                    playbackItems.append(mediaItem)
//                }
//            }
//            self.speed = playerState.speed
//            self.playbackItems = playbackItems
//
//
//            self.loadItem(self.currentPlaybackItem!)
//
//            //self.playItems(playbackItems, firstItem: currentPlaybackItem)
//        }
    }
    
}


//
//// Helper function inserted by Swift 4.2 migrator.
//fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
//	return input.rawValue
//}
