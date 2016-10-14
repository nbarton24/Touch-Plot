//
//  TappableView.swift
//  TouchLocations
//
//  Created by Nick Barton on 10/5/16.
//  Copyright © 2016 Nick Barton. All rights reserved.
//

import UIKit

class TappableView: UIView {

    var viewHeight: CGFloat = 0.0
    var viewWidth: CGFloat = 0.0
    
    var lastPoint = CGPoint()
    
    var count = 0
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        viewHeight = self.bounds.height
        viewWidth = self.bounds.width
        
        let twentyPCTHeight = viewHeight * 0.2
        let twentyPCTWidth = viewWidth * 0.2
        
        // Drawing code
        let point1 = CGPoint(x: twentyPCTWidth, y: twentyPCTHeight)
        let point2 = CGPoint(x: viewWidth-twentyPCTWidth, y: twentyPCTHeight)
        let point3 = CGPoint(x: viewWidth-twentyPCTWidth, y: viewHeight-twentyPCTHeight)
        let point4 = CGPoint(x: twentyPCTWidth, y: viewHeight-twentyPCTHeight)
        
        let aPath = UIBezierPath()
        
        aPath.lineWidth = 3
        
        aPath.moveToPoint(point1)
        aPath.addLineToPoint(point2)
        
        aPath.moveToPoint(point2)
        aPath.addLineToPoint(point3)
        
        aPath.moveToPoint(point3)
        aPath.addLineToPoint(point4)
        
        aPath.moveToPoint(point4)
        aPath.addLineToPoint(point1)
        
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.closePath()
        
        //If you want to stroke it with a red color
        UIColor.redColor().set()
        aPath.stroke()
        
        //If you want to fill it as well
        UIColor.redColor().setFill()
        aPath.fill()
        
        
    }
    
    var tf:Bool = false
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        count = 0
        print("Done")
        drawLineFrom(CGPoint(x:0,y: 0), toPoint: CGPoint(x:100,y: 100))
//        if let touch = touches.first {
//
//            if lastPoint == CGPoint(){
//                lastPoint = CGPoint(x: touch.locationInView(self).x, y: touch.locationInView(self).y)
//            }else{
//                let touchPoint = CGPoint(x: touch.locationInView(self).x, y: touch.locationInView(self).y)
//                lastPoint = touchPoint
//                
//                
//            let context = UIGraphicsGetCurrentContext()
//            CGContextSetLineWidth(context, 2)
//                
//            let color = UIColor.blueColor().CGColor
//            CGContextSetRGBStrokeColor(context, 1, 1, 0.6432, 1)
//                
//            CGContextMoveToPoint(context, 0, 0)
//            CGContextAddLineToPoint(context, touchPoint.x, touchPoint.y)
//                
//            CGContextStrokePath(context)
            
//                
//                let aPath = UIBezierPath()
//                
//                aPath.lineWidth = 4
//                
//                aPath.moveToPoint(self.lastPoint)
//                aPath.addLineToPoint(CGPoint(x: 0, y: 0))
//                
//                aPath.closePath()
//                
//                //If you want to stroke it with a red color
//                UIColor.blueColor().set()
//                aPath.stroke()
//                
//                //If you want to fill it as well
//                UIColor.blueColor().setFill()
//                aPath.fill()
//                
//                lastPoint = touchPoint
//
//
//
//            }
//        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        count+=1
        print("Moving - \(count)")
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        let context = UIGraphicsGetCurrentContext()
        
        // 2
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        // 3
        CGContextSetLineWidth(context, 3)
        CGContextSetRGBStrokeColor(context, 231/255, 33/255, 100/255, 1.0)
        
        // 4
        CGContextStrokePath(context)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            //let currentPoint = touch.locationInView(self)
            // do something with your currentPoint
            print("touched")
            print("\(touch.locationInView(self).x)")
            print("\(touch.locationInView(self).y)")
            
            let ptX = touch.locationInView(self).x
            let ptY = touch.locationInView(self).y
            let otherX = Float(ptX / viewWidth)
            let otherY = Float(ptY / viewHeight)
            
            print("\(otherX)")
            print("\(otherY)")

            //let pt = CGPoint(x: touch.locationInView(self.view).x,y: touch.locationInView(self.view).y)
            let rect = CGRect(x: touch.locationInView(self).x-5, y: touch.locationInView(self).y-5, width: 10, height: 10)

            let v = Point(frame: rect)

            if tf == true{
                v.layer.borderColor = UIColor.redColor().CGColor
                v.layer.borderWidth = 2
                v.layer.cornerRadius = 5
                v.backgroundColor = UIColor.clearColor()
                tf=false
            }else{
                v.layer.borderColor = UIColor.greenColor().CGColor
                v.layer.borderWidth = 2
                v.backgroundColor = UIColor.clearColor()
                tf=true
            }
            
            self.addSubview(v)
        
        }
        
        
    }
    
    func clearPoints(){
        for view in self.subviews {
            if view.isKindOfClass(Point){
                view.removeFromSuperview()
            }
        }
    }
    

}
