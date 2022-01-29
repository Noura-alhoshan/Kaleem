//
//  ContentView.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//
///*
import SwiftUI

struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()

    var body: some View {
        NavigationView {

        VStack(spacing: 40) {
            
            NavigationLink {
                TriviaView()
                  .environmentObject(triviaManager)
            } label: {
                PrimaryButton(text: "Let's go!")
            }.background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))

        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//*/
