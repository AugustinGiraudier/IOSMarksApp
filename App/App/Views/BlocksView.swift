//
//  BlocksView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI

struct BlocksView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                
                Image(systemName:"doc.on.doc.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                
                Text("Blocs")
                    .font(.system(size: 40))
                
                Spacer()
                
            }
            
            Divider()
            
            HStack{
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .padding(.trailing, 5)
                Text("Vous devez avoir la moyenne à chacun des blocs pour avoir votre diplôme.")
            }
            
            Divider()
                .padding(.bottom, 15)
            
            BlockView()
            BlockView()
            
           
            
        }
        .padding(.horizontal,25)
        .padding(.vertical,20)
        .frame(maxWidth: .infinity)
        .background(Rectangle().fill(Color.gray.opacity(0.1)).cornerRadius(20))
    }
}

struct BlocksView_Previews: PreviewProvider {
    static var previews: some View {
        BlocksView()
    }
}
