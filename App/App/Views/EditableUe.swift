//
//  EditableUI.swift
//  App
//
//  Created by etudiant on 05/06/2023.
//

import SwiftUI
import ViewModel
import Stub

struct EditableUe: View {
    
    @Binding
    public var ueVM : UEVM?
    
    var body: some View {
        if ueVM == nil{
            Text("Error...")
        }
        else{
            VStack{
                TextField("Nom de l'UE",text: Binding(
                    get: { self.ueVM?.name ?? "No data..." },
                    set: { self.ueVM?.name = $0 }
                ))
                .font(.title)
                
                
                HStack{
                    Text("Coef : ")
                    TextField("Nom de l'UE",text: Binding(
                        get: { "\(ueVM?.coef ?? 1)" },
                        set: { self.ueVM?.coef = Int($0) ?? 1 }
                    ))
                }
                
                Spacer()
            }
        }
    }
}

struct EditableUI_Previews: PreviewProvider {
    
    static var previews: some View {
        EditableUe(ueVM: .constant(UEVM(withUe: Stub.getOneUe())))
    }
}
