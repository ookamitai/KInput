//
//  ContentView.swift
//  KInput
//
//  Created by ookamitai on 10/4/24.
//

import SwiftUI
import SwiftAutoGUI
import HotKey

struct ContentView: View {
    
    func initialize_hotkeys() {
        right.keyDownHandler = {
            for i in AnimateCalc.generate(neighbor: 20, splits: 10) {
                SwiftAutoGUI.moveMouse(dx: -50*i, dy: 0)
            }
        }
        left.keyDownHandler = {
            for i in AnimateCalc.generate(neighbor: 20, splits: 10) {
                SwiftAutoGUI.moveMouse(dx: 50*i, dy: 0)
            }
        }
        up.keyDownHandler = {
            for i in AnimateCalc.generate(neighbor: 20, splits: 10) {
                SwiftAutoGUI.moveMouse(dx: 0, dy: -50*i)
            }
        }
        down.keyDownHandler = {
            for i in AnimateCalc.generate(neighbor: 20, splits: 10) {
                SwiftAutoGUI.moveMouse(dx: 0, dy: 50*i)
            }
        }
    }
    
    let left = HotKey(key: .leftArrow, modifiers: [.command, .shift])
    let right = HotKey(key: .rightArrow, modifiers: [.command, .shift])
    let up = HotKey(key: .upArrow, modifiers: [.command, .shift])
    let down = HotKey(key: .downArrow, modifiers: [.command, .shift])
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            initialize_hotkeys()
            print(AnimateCalc.generate(neighbor: 5, splits: 10))
        }
    }
}

#Preview {
    ContentView()
}
