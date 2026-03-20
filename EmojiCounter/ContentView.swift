//
//  ContentView.swift
//  EmojiCounter
//
//  Created by Nick.Gerber.2 on 2026-03-20.
//

import SwiftUI

var emojis : [String] = ["\u{1F923}", "\u{1F61C}", "\u{1F600}", "\u{1F929}", "\u{1F602}"]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(emojis, id:\.self) { emoji in
                    CounterView(emoji: emoji)
                        .listRowInsets(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                        .frame(height: 80)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(Text("Emoji Counter"))
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct CounterView: View {
    @State private var count: Int = 0
    var emoji : String
    var body: some View {
        HStack {
            Text("\(emoji)  Counter:  \(count)")
            Spacer()
            Button("+") {
                count += 1
            }
            Button("\u{2014}") {
                count -= 1
            }
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle(radius: 10))
        .foregroundColor(.red)
    }
}
#Preview {
    ContentView()
}
