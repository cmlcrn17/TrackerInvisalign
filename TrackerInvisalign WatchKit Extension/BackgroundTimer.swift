//
//  SwiftUIView.swift
//  TrackerInvisalign WatchKit Extension
//
//  Created by Ceren TAŞSIN on 22.08.2022.
//

import SwiftUI

struct BackgroundTimer: View {
    @State var start = false
    @State var count = 0
        
    var body: some View {
        VStack {
            Text(count.description)
            Text("Timer isRunning == \(start.description)")
            Button(action: {
                start = true
                count = 0
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    count += 1
                    
                    if count == 15 {
                        timer.invalidate()
                        start = false
                    }
                }
            }, label: {
                Text("Start Timer")
            })
        }
        
    }
}

struct BackgroundTimer_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundTimer()
    }
}


