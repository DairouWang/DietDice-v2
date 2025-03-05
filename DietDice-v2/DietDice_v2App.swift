//
//  DietDice_v2App.swift
//  DietDice-v2
//
//  Created by Darol on 3/5/25.
//

import Amplify
import Authenticator
import AWSCognitoAuthPlugin
import SwiftUI

@main
struct MyApp: App {
    init() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure(with: .amplifyOutputs)
        } catch {
            print("Unable to configure Amplify \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
