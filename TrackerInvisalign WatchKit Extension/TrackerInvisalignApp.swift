//
//  TrackerInvisalignApp.swift
//  TrackerInvisalign WatchKit Extension
//
//  Created by Ceren TAŞSIN on 22.08.2022.
//

import SwiftUI

@main
struct TrackerInvisalignApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                //TimerView()
                //ContentView()
                StopWatchView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
