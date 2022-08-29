//
//  ContentView.swift
//  TrackerInvisalign WatchKit Extension
//
//  Created by Ceren TAŞSIN on 22.08.2022.
//

import SwiftUI

/*
 TODO List
 1 - Bugünü al, eğer bugün, dünse sayacı sıfırla
 2 + Sayaç başladıysa tekrar başlata tıklattığında önlem al.
 3 + Sayaç duruyorsa tekrar durdurma için önlem al
 4 - Sayacı dakika bazında tut.
 5 - Dakikayı 24 saatten düşürerek kalan saati ekrana yazdır.
 6 - Eğer 120 dk olduysa turuncu, 240 dk oldu ve aştıysa kırmızı olucak
 7 - Kullanım süresi x saat
 8 - Takılmayan süre y dakika
 
 
 - Watch App Geliştirmesi
 - Watch App Debug
 - Watch App Market Yayını
 - Saat işlemleri
 - Timer işlemleri
 
 */

struct ContentView: View {
    
    @State var toggle = false
    @State var start = false
    @State var countMinutes : Int = 0
    @ObservedObject var timerWatchManager = TimerWatchManager()

    var body: some View {
        VStack {
            Text("\(countMinutes) - \(String(timerWatchManager.secondsElapsed))")
            
            HStack{
                Button(action: {
                    if(!toggle){
                        self.timerWatchManager.start()
                        self.toggle = true //Sayaç Başlatıldı
                    }
                }){
                    TimerButton(label: "Başlat", buttonColor: .blue)
                        .padding()
                }
                
                Button(action: {
                    if(toggle){
                        self.timerWatchManager.stop()
                        self.toggle = false //Sayaç Durduruldu
                    }
                }){
                    TimerButton(label: "Durdur", buttonColor: .red)
                        .padding()
                }
            }.onReceive(timerWatchManager.$secondsElapsed, perform: { value in
                print("Saniye: \(String(format: "%.1f", timerWatchManager.secondsElapsed))")
                
                self.countMinutes = Int(timerWatchManager.secondsElapsed / 60) //-> Dakikayı Hesaplar
                print("Dakika: \(String(countMinutes))")
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
