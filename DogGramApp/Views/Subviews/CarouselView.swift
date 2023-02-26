//
//  CarouselView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct CarouselView: View {
    
    @State var selection: Int = 1
    @State var timerAdded: Bool = false
    
    let maxCount: Int = 8
    
    var body: some View {
        
        TabView(selection: $selection, content: {
            ForEach(1..<maxCount) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
            }
        })
        .tabViewStyle(PageTabViewStyle())
        .frame(height:300)
        .animation(.default)
        .onAppear(){
            if !timerAdded{
                addTimer()
            }
        }
    }
    
    // MARK: FUNCTIONS
    
    func addTimer() {
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            
            if selection == (maxCount-1)  {
                selection = 1
                timerAdded = false
            }else {
                selection += 1

            }
        }
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
