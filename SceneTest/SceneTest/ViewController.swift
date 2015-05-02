//
//  ViewController.swift
//  SceneTest
//
//  Created by Simas Abramovas on 4/25/15.
//  Copyright (c) 2015 Simas Abramovas. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController, SCNPhysicsContactDelegate {

    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        // Geometry
        let firstNode = SCNNode()
        let secondNode = SCNNode()
        firstNode.position = SCNVector3(x: -20, y: 0, z: 0)
        secondNode.position = SCNVector3(x: 20, y: 0, z: 0)
        
        let m1 = SCNMaterial()
        m1.diffuse.contents = UIColor.redColor()
        let m2 = SCNMaterial()
        m2.diffuse.contents = UIColor.blackColor()
        let m3 = SCNMaterial()
        m3.diffuse.contents = UIColor.greenColor()
        let m4 = SCNMaterial()
        m4.diffuse.contents = UIColor.blueColor()
        
        
        let box1 = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0)
        box1.firstMaterial = m1
        let box1Node = SCNNode(geometry: box1)
        firstNode.addChildNode(box1Node)
        
        let sphere1 = SCNSphere(radius: 5)
        sphere1.firstMaterial = m2
        let sphere1Node = SCNNode(geometry: sphere1)
        sphere1Node.position = SCNVector3(x: 0, y: 5, z: 0)
        firstNode.addChildNode(sphere1Node)
        
        let box2 = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0)
        box2.firstMaterial = m3
        let box2Node = SCNNode(geometry: box2)
        secondNode.addChildNode(box2Node)
        
        let sphere2 = SCNSphere(radius: 5)
        sphere2.firstMaterial = m4
        let sphere2Node = SCNNode(geometry: sphere2)
        sphere2Node.position = SCNVector3(x: 0, y: 5, z: 0)
        secondNode.addChildNode(sphere2Node)
        
        scene.rootNode.addChildNode(firstNode)
        scene.rootNode.addChildNode(secondNode)
        
        
        // Animation
        firstNode.runAction(SCNAction.moveBy(SCNVector3Make(1000, 0, 0), duration: 100))
        secondNode.runAction(SCNAction.moveBy(SCNVector3Make(-1000, 0, 0), duration: 100))
        
        // Physics
        let physicsWorld = scene.physicsWorld
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = SCNVector3(x: 0, y: 0, z: 0)
        
        var firstNodeBody = SCNPhysicsBody(type: .Dynamic, shape: nil)
        var secondNodeBody = SCNPhysicsBody(type: .Dynamic, shape: nil)
        
        firstNode.physicsBody = firstNodeBody
        secondNode.physicsBody = secondNodeBody
        
        firstNode.physicsBody?.collisionBitMask = 2
        firstNode.physicsBody?.categoryBitMask = 1
        
        secondNode.physicsBody?.collisionBitMask = 1
        secondNode.physicsBody?.categoryBitMask = 2
        
        
        // Camera
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 30)
        scene.rootNode.addChildNode(cameraNode)
        
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
    }
    
    func physicsWorld(world: SCNPhysicsWorld, didBeginContact contact: SCNPhysicsContact) {
        contact.nodeA.removeFromParentNode()
        contact.nodeB.removeFromParentNode()
    }

}

