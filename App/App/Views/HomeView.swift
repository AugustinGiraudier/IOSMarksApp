//
//  HomeView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Stub

struct HomeView: View {
    
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
                    
                    UEsView()
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
        HomeView(
            uesVM: UEsVM(withUes: Stub.getAllUes()),
            groupsVM: GroupsVM(withGroups: Stub.getAllGroups())
        )
    }
}
