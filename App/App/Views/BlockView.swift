//
//  BlockView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Stub

struct BlockView: View {
    
    @ObservedObject
    public var blockVM : GroupVM
    
    var body: some View {
        HStack{
            Image(systemName: "doc.on.doc.fill")
            Text(blockVM.name)
                .bold()
            Spacer()
            Text(String(format: "%.2f", blockVM.average))
            Image(systemName: "graduationcap.circle.fill")
        }
        .padding(.vertical,1)
    }
}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(blockVM: GroupVM(withGrp: Stub.getOneGroup()))
    }
}
