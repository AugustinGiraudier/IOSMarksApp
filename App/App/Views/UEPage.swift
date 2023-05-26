//
//  UEPage.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI

struct UEPage: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    
                    VStack{
                        UEView(canNavigate: false)
                        HStack{
                            Image(systemName:"xmark.circle.fill")
                            Text("Coefficient :")
                            Text("6")
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                    }
                    .padding(.horizontal,25)
                    .padding(.vertical,20)
                    .frame(maxWidth: .infinity)
                    .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(20))
                    
                    HStack{
                        Image(systemName:"note.text")
                            .font(.system(size: 30))
                        Text("Détails des notes")
                            .font(.system(size: 25))
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    UEView(isModifiable: true, canNavigate: false)
                    UEView(isModifiable: true, canNavigate: false)
                    UEView(isModifiable: true, canNavigate: false)
                    UEView(isModifiable: true, canNavigate: false)
                    UEView(isModifiable: true, canNavigate: false)
                    
                    Spacer()
                }
                .navigationTitle("UE 1 Génie Logiciel")
                .padding(.horizontal,10)
            }
        }
    }
}

struct UEPage_Previews: PreviewProvider {
    static var previews: some View {
        UEPage()
    }
}
