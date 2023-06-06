//
//  UEPage.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Stub


struct UEPage: View {
    
    @ObservedObject
    public var ueVM : UEVM
    
    var body: some View {
        NavigationStack{
//            ScrollView{
                VStack(alignment: .leading){
                    
                    VStack{
                        UEView(ueVM: ueVM, canNavigate: false)
                        HStack{
                            Image(systemName:"xmark.circle.fill")
                            Text("Coefficient :")
                            Text(String(format: "%.1f", ueVM.coef))
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                    }
                    .padding(.horizontal,25)
                    .padding(.vertical,20)
                    .frame(maxWidth: .infinity)
                    .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(20))
                    
                    HStack{
                        Image(systemName:"note.text")
                            .font(.system(size: 30))
                        Text("Détails des notes")
                            .font(.system(size: 25))
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    ForEach(ueVM.subjects){subject in
                        SubjectView(subVM: subject)
                    }
                    
                    Spacer()
                }
                .navigationTitle(ueVM.name)
                .toolbar {
                    Button(action: {
                        ueVM.onEditing()
                    }) {
                        Text("Edit")
                    }
                }
                .sheet(isPresented: $ueVM.isEditing) {
                    NavigationStack {

                        EditableUe(ueVM: ueVM.copy!)
                            .padding()
                            .toolbar {
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        ueVM.onEdited()
                                    }
                                }
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        ueVM.onEdited(isCancelled: true)
                                    }
                                }
                            }
                    }
                }
                .padding(.horizontal,10)
            }
//        }
    }
}

struct UEPage_Previews: PreviewProvider {
    static var previews: some View {
        UEPage(ueVM: UEVM(withUe: Stub.getOneUe()))
    }
}
