//
//  ContentView.swift
//  DietDice-v2
//
//  Created by Darol on 3/5/25.
//

import Amplify
import Authenticator
import SwiftUICore
import SwiftUI

struct ContentView: View {
    var body: some View {
        Authenticator { state in
            VStack {
                Button("Sign out") {
                    Task {
                        await state.signOut()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
