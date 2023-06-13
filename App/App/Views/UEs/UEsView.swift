//
//  UEsView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Stub

struct UEsView: View {
    
    @ObservedObject
    public var uesVM : UEsVM
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                
                Image(systemName:"doc.on.doc.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                
                Text("UEs")
                    .font(.system(size: 40))
                
                Spacer()
                
            }
            
            Text("Détail des UE")
                .padding(.top,1)
            
            Divider()
                .padding(.bottom, 5)
            
            ForEach(uesVM.ues){ue in
                UEView(ueVM: ue, canNavigate: true)
            }
            
        }
        .padding(.horizontal,25)
        .padding(.vertical,20)
        .frame(maxWidth: .infinity)
        .background(Rectangle().fill(Color.gray.opacity(0.1)).cornerRadius(20))
    }
}

struct UEsView_Previews: PreviewProvider {
    static var previews: some View {
        UEsView(uesVM: UEsVM(withUes: Stub().getAllUes()))
    }
}
