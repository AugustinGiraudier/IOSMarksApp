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
    @State private var pixelLen : CGFloat = 5.0
    @State private var barColor : Color = .red
    @State private var rangeWidth : CGFloat = 1
    
    @State private var canModify : Bool = false
    
    private var BarColor : Color {
        get{
            return (value >= CGFloat(Subject.MAX_MARK/2)) ? .green : .red
        }
    }
    
    init(isModifiable : Bool = false, mark : CGFloat = 10){
        _value = State(initialValue: mark)
        _canModify = State(initialValue: isModifiable)
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
                    
                    GeometryReader{geometry in
                        ZStack(alignment: .leading){
                            Rectangle()
                                .fill(.gray)
                                .frame(height: 25)
                                .cornerRadius(20)
                                .gesture(DragGesture()
                                    .onChanged {
                                        value in self.updateRange(value: value)
                                    }
                                )
                            Rectangle()
                                .fill(barColor)
                                .frame(height: 25)
                                .frame(width: pixelLen)
                                .cornerRadius(20)
                                .gesture(DragGesture()
                                    .onChanged {
                                        value in self.updateRange(value: value)
                                    }
                                )
                                
                            
                            HStack{
                                Spacer()
                                Text(String(format: "%.2f", value))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        }
                        .onChange(of: geometry.size.width) { _ in
                            updateRatio(width:geometry.size.width)
                        }
                        .onAppear(perform:{
                            updateRatio(width:geometry.size.width)
                        })
                    }
                    .frame(height: 25)
                    
                    
                }
                
                Image(systemName:"square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .padding(.leading, 20)
                
            }
            
            Divider()
        }
        .padding(.top, 8)
    }

    
    private func updateRange(value: DragGesture.Value){
        guard canModify else {return}
        let dragLocation : CGFloat = value.location.x
        let ratio = dragLocation / rangeWidth
        let max = CGFloat(Subject.MAX_MARK)
        let valPixel : CGFloat = dragLocation > 0 ? dragLocation : 0.0
        let val : CGFloat = max * ratio
        
        self.pixelLen = min(valPixel,rangeWidth)
        self.value = min(max, val > 0 ? val : 0.0)
        self.barColor = BarColor
    }
    
    private func updateRatio(width : CGFloat? = nil){
        if let width=width{
            rangeWidth = width
        }
        self.pixelLen = min(value*rangeWidth/CGFloat(Subject.MAX_MARK),rangeWidth)
        self.barColor = BarColor
    }
    
}

struct UEView_Previews: PreviewProvider {
    static var previews: some View {
        UEView(isModifiable: false ,mark:10)
    }
}
