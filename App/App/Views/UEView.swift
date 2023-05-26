//
//  UEView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Model

struct UEView: View {
    
    @State private var value : CGFloat = 7
    @State private var canModify : Bool = false
    
    private let isMarkModifiable : Bool
    private let canNavigate : Bool
    
    init(isModifiable : Bool = false, mark : CGFloat = 10, canNavigate : Bool = true){
        _value = State(initialValue: mark)
        isMarkModifiable = isModifiable
        self.canNavigate = canNavigate
    }
    
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text("UE1, Génie Logiciel")
                        Spacer()
                        Text("6")
                    }
                    HStack{
                        if isMarkModifiable{
                            Image(systemName: canModify ? "lock.open" : "lock")
                                .font(.system(size: 25))
                                .padding(.trailing, canModify ? 0 : 5)
                                .foregroundColor(canModify ? .blue : .gray)
                                .onTapGesture {
                                    canModify.toggle()
                                }
                        }
                        RangeBarView(value: $value, canModify: $canModify)
                    }
                    
                }

                if canNavigate{
                    NavigationLink(destination: UEPage())
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
        UEView(isModifiable: true ,mark:8)
    }
}
