//
//  SubjectView.swift
//  App
//
//  Created by etudiant on 04/06/2023.
//

import SwiftUI
import ViewModel
import Stub

struct SubjectView: View {
    @ObservedObject
    public var subjectVM : SubjectVM

    @State private var canModify : Bool = false
    
    public init(subVM : SubjectVM){
        self.subjectVM = subVM
    }
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text(subjectVM.name)
                        Spacer()
                        Text(String(format: "%.1f", subjectVM.coef))
                    }
                    HStack{
                        Image(systemName: canModify ? "lock.open" : "lock")
                            .font(.system(size: 25))
                            .padding(.trailing, canModify ? 0 : 5)
                            .foregroundColor(canModify ? .blue : .gray)
                            .onTapGesture {
                                canModify.toggle()
                            }
                        RangeBarView(value: $subjectVM.mark, canModify: $canModify)
                    }
                    
                }
            }
            
            Divider()
        }
        .padding(.top, 8)
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(subVM: SubjectVM(withSubject: Stub.getOneSubject()))
    }
}
