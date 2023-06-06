//
//  EditableSubject.swift
//  App
//
//  Created by etudiant on 06/06/2023.
//

import SwiftUI
import ViewModel
import Stub

struct EditableSubject: View {
    
    @ObservedObject
    public var subjectVM : SubjectVM
    
    var body: some View {
        VStack{
            Divider()
            TextField("Nom de l'UE",text: $subjectVM.name)
            .font(.body)
            
            
            HStack{
                Text("Coef : ")
                TextField("Nom de l'UE", value: $subjectVM.coef, format: .number)
            }
        }
    }
}

struct EditableSubject_Previews: PreviewProvider {
    static var previews: some View {
        EditableSubject(subjectVM: SubjectVM(withSubject: Stub.getOneSubject()))
    }
}
