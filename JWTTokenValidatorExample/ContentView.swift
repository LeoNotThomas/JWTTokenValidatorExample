//
//  ContentView.swift
//  JWTTokenValidatorExample
//
//  Created by Thomas (privat) Leonhardt on 10.05.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = JWTTokenValidatorViewModel(key: "My - key")
    var body: some View {
        VStack {
//            TextField("Token", text: <#T##Binding<String>#>)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
