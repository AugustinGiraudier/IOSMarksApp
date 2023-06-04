//
//  UEView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import ViewModel
import Stub

struct UEView: View {
    
    @ObservedObject
    public var ueVM : UEVM
    
    private let canNavigate : Bool
    
    public init(ueVM : UEVM, canNavigate : Bool = false){
        self.ueVM = ueVM
        self.canNavigate = canNavigate
    }
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text(ueVM.name)
                        Spacer()
                        Text(String(format: "%.1f", ueVM.coef))
                    }
                    HStack{
                        RangeBarView(value: $ueVM.average, canModify: .constant(false))
                    }
                }
                if canNavigate{
                    NavigationLink(destination: UEPage(ueVM: ueVM))
                    {
                        Image(systemName:"square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.leading, 20)
                    }
                }
                
            }
            Divider()
        }
        .padding(.top, 8)
    }
}

struct UEView_Previews: PreviewProvider {
    static var previews: some View {
        UEView(ueVM: UEVM(withUe: Stub.getOneUe()), canNavigate: true)
    }
}
