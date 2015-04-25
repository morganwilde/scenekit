//
//  ViewController.swift
//  SceneKitDemo
//
//  Created by Morgan Wilde on 25/04/2015.
//  Copyright (c) 2015 Morgan Wilde. All rights reserved.
//

import UIKit
import SceneKit

func degressToRadians(degrees: Float) -> Float {
    return (degrees / 180) * Float(M_PI)
}

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        // Geometry
        let box = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0)
        
        let geometry = box
        
        // Material
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.redColor()
        geometry.firstMaterial = material
        
        let geometryNode = SCNNode(geometry: geometry)
        
        // Rotation
        let xRotation = SCNMatrix4MakeRotation(degressToRadians(45), 1, 0, 0)
        let yRotation = SCNMatrix4MakeRotation(degressToRadians(45), 0, 1, 0)
        let zRotation = SCNMatrix4MakeRotation(degressToRadians(45), 0, 0, 1)
        
        let rotation = SCNMatrix4Mult(SCNMatrix4Mult(xRotation, yRotation), zRotation)
        
        geometryNode.transform = SCNMatrix4Mult(rotation, geometryNode.transform)
        
        // Hierarchy
        scene.rootNode.addChildNode(geometryNode)
        
        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 30)
        scene.rootNode.addChildNode(cameraNode)
        
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
    }
}

