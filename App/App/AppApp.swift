//
//  AppApp.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Stub

@main
struct AppApp: App {
    
    @StateObject
    public var uesVM : UEsVM = UEsVM(withUes: Stub.getAllUes())
    
    @StateObject
    public var groupsVM : GroupsVM = GroupsVM(withGroups: Stub.getAllGroups())
    
    var body: some Scene {
        WindowGroup {
            HomeView(uesVM: uesVM, groupsVM: groupsVM)
            .onAppear(){
                groupsVM.updateWithUesVM(uesVM: uesVM)
            }
        }
    }
}
