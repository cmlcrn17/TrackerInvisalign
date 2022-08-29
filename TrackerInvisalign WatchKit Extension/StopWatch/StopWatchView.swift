//
//  StopWatchView.swift
//  TrackerInvisalign WatchKit Extension
//
//  Created by Ceren TAŞSIN on 23.08.2022.
//

import SwiftUI

struct StopWatchView: View {
    
    @ObservedObject var stopWatch = StopWatch()
    @State var toggleAlert : Bool = false
    @State var start : Bool = false
    @State var btnStartPause : String = "Start"
    @State var btnAddReset : Bool = false
    @State var totalMinutes : String = ""
    @State var time = [String]()
    @State var timeList = [String]()
    func sumTime(val: String) -> Void{
        self.time.append(val)
        self.totalMinutes = sum(self.time) //Array içindeki tüm öğeleri sırasıyla toplar.
        control(totalMinutes: totalMinutes)
        
        print("LIST \(self.time)")
        print("LIST - TotalMinutes \(self.totalMinutes)")
    }
    
    func sum(_ timeArray: [String]) -> String {
        var sum = [0, 0, 0]
        for time in timeArray {
            let components = time.split(separator: ":")
            sum[0] += Int(components[0])!
            sum[1] += Int(components[1])!
            sum[2] += Int(components[2])!
        }

        for componentIndex in [2, 1] {
            while sum[componentIndex] > 59 {
                sum[componentIndex] -= 60
                sum[componentIndex - 1] += 1
            }
        }

        return String(format: "%02d:%02d:%02d", sum[0], sum[1], sum[2])
    }
    
    func control(totalMinutes: String) -> Void{
        
        let components = totalMinutes.split(separator: ":")
        if(Int(components[0]) ?? 0 > 30){
            toggleAlert = true
        }
    }
    
    var body: some View {
        TabView{
            VStack{
                if(toggleAlert){
                    Text(self.stopWatch.stopWatchTime)
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .foregroundColor(.red)
                }else{
                    Text(self.stopWatch.stopWatchTime)
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                }
                
                HStack{
                    
                    Button(action: {
                        if(!btnAddReset){
                            self.sumTime(val: self.stopWatch.stopWatchTime)
                            self.stopWatch.lap()
                            btnAddReset = true
                        }
                    }, label: {
                        Text("Add&Reset")
                            .foregroundColor(Color.white)
                            .font(.system(size: 10, weight: .medium, design: .rounded))
                    }).cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.red, lineWidth: 4)
                        )
                     
                    Button(action: {
                        if(start){
                            self.stopWatch.pause()
                            btnStartPause = "Start"
                            start = false
                            btnAddReset = false
                        }else{
                            self.stopWatch.start()
                            btnStartPause = "Pause"
                            start = true
                            btnAddReset = false
                        }
                    }, label: {
                        Text("\(self.btnStartPause)")
                            .foregroundColor(Color.white)
                            .font(.system(size: 10, weight: .medium, design: .rounded))
                    }).cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue, lineWidth: 4)
                        )
                }
            }
            .tabItem {
                Label("Timer", systemImage: "list.dash")
            }
            
            VStack(alignment: .leading) {
                if(toggleAlert){
                    Text("\(self.totalMinutes)")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.red)
                }else{
                    Text("\(self.totalMinutes)")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                }
                
                
                List {
                    ForEach(self.stopWatch.laps, id: \.uuid) { (lapItem) in
                        Text(lapItem.stringTime)
                    }
                }
            }
            .tabItem {
                Label("List", systemImage: "list.dash")
            }
        }
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
