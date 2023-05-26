//
//  HomeView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack{
                    
                    BlocksView()
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
        HomeView()
    }
}
