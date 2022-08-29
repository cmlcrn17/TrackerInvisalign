//
//  StopWatchButton.swift
//  TrackerInvisalign WatchKit Extension
//
//  Created by Ceren TAŞSIN on 23.08.2022.
//

import SwiftUI

struct StopWatchButton : View {
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool
    
    var body: some View {
       
        return Button(action: {
            if self.isPaused {
                self.actions[0]()
            } else {
                self.actions[1]()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    
            } else {
                Text(self.labels[1])
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    
            }
        }.cornerRadius(10)
            .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(self.color, lineWidth: 4)
                )
        
    }
}
