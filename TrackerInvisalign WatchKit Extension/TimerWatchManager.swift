//
//  TimerWatchManager.swift
//  TrackerInvisalign WatchKit Extension
//
//  Created by Ceren TAŞSIN on 22.08.2022.
//

import Foundation

class TimerWatchManager: ObservableObject {
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var mode: stopWatchMode = .stopped
    @Published var secondsElapsed = 0
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.secondsElapsed = self.secondsElapsed + 1
        }
    }
    
    func stop() {
        timer.invalidate()
        //secondsElapsed = 0
        mode = .stopped
    }
    
    func stopAndReset() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
   
    
}
