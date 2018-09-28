//
//  ViewController.swift
//  ARDices
//
//  Created by Tianna Henry-Lewis on 2018-09-22.
//  Copyright © 2018 Tianna Henry-Lewis. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self

//
//        //Create a cube object
//        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//
//        //Create a Sphere Object
//        let sphere = SCNSphere(radius: 0.2)
//
//        //Create a material for the cube object
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "art.scnassets/erisTexture.jpg")
//
//        //Set the cube objects material to the created material
//        sphere.materials = [material]
//
//        let node =  SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
//        node.geometry = sphere
//
//        sceneView.scene.rootNode.addChildNode(node)
        
        //Add Light
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
        
        diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
        
        sceneView.scene.rootNode.addChildNode(diceNode)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
}
