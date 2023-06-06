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
        VStack(alignment: .leading){
            
            VStack{
                TextField("Nom de l'UE",text: $ueVM.name)
                .font(.title)
                .foregroundColor(.blue.opacity(0.6))
                .padding(.horizontal, 7)
            }
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            
            HStack{
                Text("Coef : ")
                VStack{
                    TextField("Nom de l'UE", value: $ueVM.coef, format: .number)
                    .font(.body)
                    .foregroundColor(.blue.opacity(0.6))
                    .padding(.horizontal, 7)
                }
                .background(.gray.opacity(0.1))
                .cornerRadius(8)
            }
            
            Text("Liste des Matières")
                .padding(.vertical)
                .bold()
                .font(.title)
            
            ForEach(ueVM.subjects){sub in
                EditableSubject(subjectVM: sub)
            }
            
            Divider()

            Spacer()
        }
    }
}

struct EditableUI_Previews: PreviewProvider {
    
    static var previews: some View {
        EditableUe(ueVM: UEVM(withUe: Stub.getOneUe()))
            .padding()
    }
}
