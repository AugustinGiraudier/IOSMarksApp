//
//  HomeView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Stub

struct HomePage: View {
    
    @ObservedObject
    public var uesVM : UEsVM
    
    @ObservedObject
    public var groupsVM : GroupsVM
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack{
                    
                    BlocksView(blocksVM: groupsVM)
                        .padding(.horizontal, 10)
                        .padding(.top, 20)
                    
                    UEsView(uesVM: uesVM)
                        .padding(.horizontal, 10)
                        .padding(.top, 20)
                        
                }
                .navigationTitle("Calculette")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomePage(
            uesVM: UEsVM(withUes: Stub.getAllUes()),
            groupsVM: GroupsVM(withGroups: Stub.getAllGroups())
        )
    }
}
