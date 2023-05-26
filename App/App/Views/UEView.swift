//
//  UEView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI

struct UEView: View {
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("UE1, Génie Logiciel")
                        Spacer()
                        Text("6")
                    }
                    
                    ZStack(alignment: .leading){
                        Rectangle()
                            .fill(.gray)
                            .frame(height: 25)
                            .cornerRadius(20)
                        Rectangle()
                            .fill(.green)
                            .frame(height: 25)
                            .frame(width: 50)
                            .cornerRadius(20)
                        
                        HStack{
                            Spacer()
                            Text("5")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                            
                    }
                }
                
                Image(systemName:"square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .padding(.leading, 20)
                
            }
            
            Divider()
        }
        .padding(.top, 8)
    }
}

struct UEView_Previews: PreviewProvider {
    static var previews: some View {
        UEView()
    }
}
