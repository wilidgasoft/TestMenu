//
//  Coordinator.swift
//  Copita AR Menu
//
//  Created by Felix Barker on 3/12/23.
//

import Foundation
import RealityKit
import ARKit

class Coordinator : NSObject, UIGestureRecognizerDelegate{
    var arView: ARView?
    var mainScene: Experience.MainScene
    var vm: FoodViewModel
    
//    var selectedObject: VirtualObject?
    
    init(vm: FoodViewModel) {
        self.vm = vm

        self.mainScene = try! Experience.loadMainScene()
    }
    
//    var trackedObject: VirtualObject? {
//        didSet {
//            guard trackedObject != nil else { return }
//            selectedObject = trackedObject
//        }
//    }
    
    @objc func tapped(_ recognizer: UITapGestureRecognizer){
        
        guard let arView = arView else {
            return
        }
        
        let location = recognizer.location(in: arView)
        let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
    
        if let result = results.first {
            

// comment this
            let anchor = AnchorEntity (raycastResult: result)
//            let anchor = AnchorEntity()
            guard let entity = mainScene.findEntity(named: vm.selectedcopitafood) else {
                return
            }
            
            entity.position = SIMD3(0,0,0)
            anchor.addChild(entity)
            arView.scene.addAnchor(anchor)
            
                
            
        }
    }
    
    
//    @objc
//    func didRotate(_ gesture: UIRotationGestureRecognizer) {
//        guard gesture.state == .changed else { return }
//        
//        trackedObject?.objectRotation -= Float(gesture.rotation)
//        
//        gesture.rotation = 0
//    }
}
