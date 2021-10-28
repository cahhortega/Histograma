
import CoreGraphics
import SwiftUI


public struct Histograma: View {
    
    public private(set) var text = "Hello, World!"
    let margin: CGFloat = 30
    private let defaultColors: [Color] = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    
    let qtdRect: Int = 30
    var maxRectHeight: CGFloat = 0
    let widthGraph: CGFloat = 400
    let heightGraph: CGFloat = 500
    @State var data: [CGPoint] = []
    
    public init(data: [CGPoint]) {
        self.data = data
    }
    
    public var body: some View {
        ZStack{
            GeometryReader { geometry in
                let width: CGFloat = geometry.size.width
                let height: CGFloat = geometry.size.height
                
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(Array(self.data.enumerated()), id: \.offset) { index, point in
                        self.createRect(w: 10, h: 20)
                    }
                    
                }.frame(width: width, height: height)
                    .position(x: CGFloat(self.qtdRect*10/2), y: height-155)
                
            }.frame(width: self.widthGraph, height: self.heightGraph)
                .background(Color.black)
            
            
            
        }.frame(width: 400, height: 500)
    }
    @ViewBuilder private func createRect(w: CGFloat, h: CGFloat, color: Color = Color.blue) -> some View {
        Rectangle()
            .fill(color)
            .frame(width: w, height: h)
        
        
    }
}

struct Histograma_Previews: PreviewProvider {
    static var previews: some View {
        //        Histograma(data: [CGPoint(x: 3, y: 1)])
        Histograma(data: [CGPoint(x: 10, y: 150), CGPoint(x: 15, y: 150)])
    }
}







//        VStack {
//            let margin: CGFloat = length/2
//
//            GeometryReader { geometry in
//                ZStack {
//                    let width = geometry.size.width - margin
//                    let centerY = geometry.size.height/2.0
//                    let heightY: CGFloat = centerY + height
//
//                    let valueConverted = convert(value: value, width: width, margin: margin)
//
//                    let startX: CGFloat = valueConverted - length/2
//                    let endX: CGFloat = valueConverted + length/2
//                    let midPoint: CGFloat = (startX + length/2 )
//                    let apex1: CGFloat = (startX + midPoint) / 2
//                    let apex2: CGFloat = midPoint + (endX - midPoint) / 2
//
//                    Path { path in
//                        path.addLines([
//                            CGPoint(x: 0, y: centerY + height),
//                            CGPoint(x: startX, y: centerY + height),
//                        ])
//
//                        path.move(to: CGPoint(x: startX, y: heightY))
//
//                        path.addCurve(
//                            to:         CGPoint(x: midPoint,    y: centerY),
//                            control1:   CGPoint(x: apex1,       y: heightY),
//                            control2:   CGPoint(x: apex1,       y: centerY)
//                        )
//
//                        path.addCurve(
//                            to: CGPoint(x: endX, y: heightY),
//                            control1: CGPoint(x: apex2, y: centerY),
//                            control2: CGPoint(x: apex2, y: heightY)
//                        )
//
//                        path.addLines([
//                            CGPoint(x: endX, y: centerY + height),
//                            CGPoint(x: geometry.size.width, y: centerY + height),
//                        ])
//                    }.stroke(LinearGradient(gradient: Gradient(colors: [.blue, .green, .red]), startPoint: .leading, endPoint: .trailing),
//                             lineWidth: lineWidth)
//
//                    let format = "%.\(self.valuePrecision.rawValue)f %@"
//                    let textYPosition = { () -> CGFloat? in
//                        switch self.valuePosition {
//                        case .top:
//                            return centerY - (height >= 10 ? height*0.1 : 0) - (lineWidth >= 10 ? lineWidth*0.4 : 0)
//                        case .botton:
//                            return centerY + height + 10 + (lineWidth >= 10 ? lineWidth*0.8 : 10)
//                        case .middle:
//                            return centerY + height
//                        case .none:
//                            return nil
//                        }
//                    }
//
//                    if let yPosition = textYPosition() {
//                        Text(String.localizedStringWithFormat(format, value, ""))
//                            .font(.system(size: 12))
//                            .frame(height: 1, alignment: .bottom)
//                            .position(
//                                x: valueConverted,
//                                y: yPosition)
//                    }
//                }
//            }
//        }
