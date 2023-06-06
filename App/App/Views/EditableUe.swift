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
    
    @ObservedObject
    public var ueVM : UEVM
    
    var body: some View {
        VStack{
            TextField("Nom de l'UE",text: $ueVM.name)
            .font(.title)

            HStack{
                Text("Coef : ")
                TextField("Nom de l'UE", value: $ueVM.coef, format: .number)
            }
            
            ForEach(ueVM.subjects){sub in
                EditableSubject(subjectVM: sub)
            }

            Spacer()
        }
    }
}

struct EditableUI_Previews: PreviewProvider {
    
    static var previews: some View {
        EditableUe(ueVM: UEVM(withUe: Stub.getOneUe()))
    }
}
