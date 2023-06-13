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
    private var ueVM : UEVM?
    
    init(subjectVM : SubjectVM, ueVM : UEVM? = nil){
        self.subjectVM = subjectVM
        self.ueVM = ueVM
    }
    
    var body: some View {
        VStack{
            Divider()
            HStack{
                VStack{
                    
                    VStack{
                        TextField("Nom de l'UE",text: $subjectVM.name)
                            .font(.body)
                            .foregroundColor(.blue.opacity(0.6))
                            .padding(.horizontal, 7)
                    }
                    .background(.gray.opacity(0.1))
                    .cornerRadius(8)
                    
                    HStack{
                        Text("Coef : ")
                        
                        VStack{
                            TextField("Nom de l'UE", value: $subjectVM.coef, format: .number)
                                .font(.body)
                                .foregroundColor(.blue.opacity(0.6))
                                .padding(.horizontal, 7)
                        }
                        .background(.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                Button(action: {
                    if let uevm = ueVM{
                        uevm.removeSubject(id: subjectVM.id)
                    }
                }) {
                    Image(systemName: "trash.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 22)
                        .foregroundColor(.red.opacity(0.8))
                }
                .padding(.leading, 10)
            }
        }
    }
}

struct EditableSubject_Previews: PreviewProvider {
    static var previews: some View {
        EditableSubject(subjectVM: SubjectVM(withSubject: Stub().getOneSubject()))
    }
}
