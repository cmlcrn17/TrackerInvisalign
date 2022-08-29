//
//  TimerButton.swift
//  TrackerInvisalign WatchKit Extension
//
//  Created by Ceren TAŞSIN on 22.08.2022.
//

import SwiftUI

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    
    var body: some View {
        Text(label)
            //.foregroundColor(.white)
            //.padding(.vertical, 10)
            //.padding(.horizontal, 30)
            //.background(buttonColor)
            //.cornerRadius(10)
        
    }
}

struct TimerButton_Previews: PreviewProvider {
    static var previews: some View {
        TimerButton(label: "Başlat/Bitir", buttonColor: .blue)
    }
}
