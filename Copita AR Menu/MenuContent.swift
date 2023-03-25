//
//  MenuContent.swift
//  Copita AR Menu
//
//  Created by wilman garcia on 24/03/23.
//

import SwiftUI
import RealityKit
import ARKit

struct MenuContent: View {
    
    @StateObject private var vm = FoodViewModel()
    let copitafood = ["Chips&TwoSalsas", "Guacamole","PapasBravas", "HabaneroWings","TortillaSoupCup", "TortillaSoupBowl","EnsaladaMixta", "GoldenBeetSalad", "QuesoFundido", "Bruselas", "MexicanTruffleEmpanadas" ]
    
    var body: some View {
        List {
           
                             ForEach(copitafood, id:\.self) {name in
                                 Image(name)
                                     .resizable()
                                     .frame(width:350, height: 150)
                                     .border(.red, width: vm.selectedcopitafood == name ? 1.0: 0.0)
                                     .onTapGesture{
                                         vm.selectedcopitafood = name
                                     }
         
                             }
         
        }
    }
}

//struct ARViewContainer: UIViewRepresentable {
//    
//    let vm:FoodViewModel
//    
//    func makeUIView(context: Context) -> ARView {
//        
//        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
//        
//        
//        let session = arView.session
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = .horizontal
//        config.environmentTexturing = .automatic
//        session.run(config)
//        
//        
//        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tapped)))
//        
//        context.coordinator.arView = arView
//        arView.addCoachingOverlay()
//        return arView
//        
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {}
//    
//    func makeCoordinator() -> Coordinator{
//        Coordinator(vm: vm)
//        
//    }
//}


struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent()
    }
}
