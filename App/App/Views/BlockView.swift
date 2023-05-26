//
//  BlockView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI

struct BlockView: View {
    var body: some View {
        HStack{
            Image(systemName: "doc.on.doc.fill")
            Text("Bloc name")
                .bold()
            Spacer()
            Text("12.2")
            Image(systemName: "graduationcap.circle.fill")
        }
        .padding(.vertical,1)
    }
}

struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView()
    }
}
