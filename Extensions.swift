//
//  Extensions.swift
//  PotralARkit
//
//  Created by sun on 7/5/2562 BE.
//  Copyright © 2562 sun. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width :CGFloat  = 0.04
var height :CGFloat = 2
var length :CGFloat = 2
var doorLength : CGFloat = 0.6

func createBox(isDoor : Bool) -> SCNNode {
    let node = SCNNode()
    
    //add first box
    let firstbox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    let firstboxNode = SCNNode(geometry: firstbox)
    firstboxNode.renderingOrder = 200
    
    node.addChildNode(firstboxNode)
    
    //add masked box
    
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.00001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0)
    
    node.addChildNode(maskedBoxNode)
    
    return node
}

extension FloatingPoint {
    
    var degreesToRadians : Self {
        return self * .pi / 180
    }
    
    var radiansToDegrees : Self {
        return self * 180 / .pi
    }
    
}
