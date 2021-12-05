//
//  App06_ToDo_FirebaseApp.swift
//  App06-ToDo-Firebase
//
//  Created by user205865 on 10/7/21.
//

import SwiftUI
import Firebase

@main
struct App06_ToDo_FirebaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
