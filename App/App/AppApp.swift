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
import JsonPersisting

@main
struct AppApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    private let dataManager : IDataManager = JsonDataProvider()
    
    @StateObject
    public var uesVM : UEsVM = UEsVM(withUes: [])
    
    @StateObject
    public var groupsVM : GroupsVM = GroupsVM(withGroups: [])
    
    var body: some Scene {
        WindowGroup {
            HomePage(uesVM: uesVM, groupsVM: groupsVM)
            .onAppear(){
                
                var groups = dataManager.getGroups()
                
                if groups.count == 0{
                    groups = Stub().getGroups()
                }
                
                uesVM.reload(withUes: groups[0].UEs)
                groupsVM.reload(withGroups: groups)
                groupsVM.updateWithUesVM(uesVM: uesVM)
                
            }
            .onChange(of: scenePhase){phase in
                if phase == .inactive {
                    dataManager.saveGroups(groups: groupsVM.model)
                }
            }
        }
    }
}
