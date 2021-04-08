//
//  ContentView.swift
//  drawUI
//
//  Created by 蔡佳穎 on 2021/4/6.
//

import SwiftUI
struct DrawView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        
        //以色列國旗練習
        let view = UIView()
        
        //白色背景
        var rect = CGRect(x: 0, y: 17, width: 233, height: 139)
        let backgroundView = UIView(frame: rect)
        backgroundView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        //[上下藍色長方形]
        rect = CGRect(x: 0, y: 17, width: 233, height: 27)
        let rectUpView = UIView(frame: rect)
        rectUpView.backgroundColor = UIColor(red: 0, green: 53/255 , blue: 185/255, alpha: 1)
        view.addSubview(rectUpView)
        
        rect = CGRect(x: 0, y: 128, width: 233, height: 27)
        let rectDownView = UIView(frame: rect)
        rectDownView.backgroundColor = UIColor(red: 0, green: 53/255 , blue: 185/255, alpha: 1)
        view.addSubview(rectDownView)
   
        
        //[倒三角形]，用UIBezierPath()畫路徑
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 89.5, y: 70))
        path.addLine(to: CGPoint(x: 143.5, y: 70))
        path.addLine(to: CGPoint(x: 116.5, y: 116))
        path.close()
        
        //用CAShapeLayer()產生形狀
        let invertedTriangleLayer = CAShapeLayer()
        invertedTriangleLayer.fillColor = UIColor.clear.cgColor
        invertedTriangleLayer.strokeColor = UIColor(red: 0, green: 53/255 , blue: 185/255, alpha: 1).cgColor
        invertedTriangleLayer.lineWidth = 5
        invertedTriangleLayer.path = path.cgPath //用CAShapeLayer的path設定形狀，但invertedTriangleLayer的型別是cgPath，所以要用path.cgPath讀取
        
        //將CAShapeLayer加到view.layer上
        view.layer.addSublayer(invertedTriangleLayer)
        
        
        //[三角形]用CGAffineTransform上下翻轉
        let triangleLayer = CAShapeLayer()
        triangleLayer.path = path.cgPath
        let moveDistance = path.bounds.maxY + 73 - path.bounds.height/3 //設定y軸的移動距離
        triangleLayer.setAffineTransform(CGAffineTransform(scaleX: 1, y: -1).concatenating(CGAffineTransform(translationX: 0, y: moveDistance))) //設定倒三角形垂直鏡像翻轉，以及設定移動距離
        triangleLayer.fillColor = UIColor.clear.cgColor
        triangleLayer.strokeColor = UIColor(red: 0, green: 53/255 , blue: 185/255, alpha: 1).cgColor
        triangleLayer.lineWidth = 5.5
        
        triangleLayer.path = path.cgPath
        view.layer.addSublayer(triangleLayer)
        
    
    
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}
struct ContentView: View {
    var body: some View {
        DrawView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
