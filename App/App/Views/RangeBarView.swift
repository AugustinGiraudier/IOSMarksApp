//
//  RangeBarView.swift
//  App
//
//  Created by etudiant on 26/05/2023.
//

import SwiftUI
import Model

struct RangeBarView: View {
    
    @Binding var value : Float
    @Binding var canModify : Bool
    
    @State private var pixelLen : CGFloat = 5.0
    @State private var barColor : Color = .red
    @State private var rangeWidth : CGFloat = 1
    
    private var BarColor : Color {
        get{
            return (CGFloat(value) >= CGFloat(Subject.MAX_MARK/2)) ? .green : .red
        }
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(.gray.opacity(0.4))
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
            .onChange(of: value){_ in
                updateRatio(width:geometry.size.width)
            }
            .onAppear(perform:{
                updateRatio(width:geometry.size.width)
            })
        }
        .frame(height: 25)
    }
    
    private func updateRange(value: DragGesture.Value){
        guard canModify else {return}
        let dragLocation : CGFloat = value.location.x
        let ratio = dragLocation / rangeWidth
        let max = CGFloat(Subject.MAX_MARK)
        let valPixel : CGFloat = dragLocation > 0 ? dragLocation : 0.0
        let val : CGFloat = max * ratio
        
        self.pixelLen = min(valPixel,rangeWidth)
        self.value = Float(min(max, val > 0 ? val : 0.0))
        self.barColor = BarColor
    }
    
    private func updateRatio(width : CGFloat? = nil){
        if let width=width{
            rangeWidth = width
        }
        self.pixelLen = min(CGFloat(value)*rangeWidth/CGFloat(Subject.MAX_MARK),rangeWidth)
        self.barColor = BarColor
    }
    
}

struct RangeBarView_Previews: PreviewProvider {
    static var previews: some View {
        RangeBarView(value: .constant(15), canModify: .constant(true))
    }
}
