//
//  AppApp.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Data
import Stub

@main
struct AppApp: App {
    
    private let dataManager : IDataManager = Stub()
    
    @StateObject
    public var uesVM : UEsVM = UEsVM(withUes: [])
    
    @StateObject
    public var groupsVM : GroupsVM = GroupsVM(withGroups: [])
    
    var body: some Scene {
        WindowGroup {
            HomePage(uesVM: uesVM, groupsVM: groupsVM)
            .onAppear(){
                
                let groups = dataManager.getGroups()
                
                uesVM.reload(withUes: groups[0].UEs)
                groupsVM.reload(withGroups: groups)
                groupsVM.updateWithUesVM(uesVM: uesVM)
                
            }
        }
    }
}
