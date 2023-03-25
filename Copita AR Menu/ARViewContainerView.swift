////
////  ARViewContainerView.swift
////  Copita AR Menu
////
////  Created by wilman garcia on 22/03/23.
////
//
//import SwiftUI
//import RealityKit
//import ARKit
//
//struct ARViewContainerView: View {
//    @StateObject private var vm = FoodViewModel()
//    let  vmItem:String
//    
//    
//    var body: some View {
//        VStack {
//           
//            
//            ARViewContainer(vm: vm, vmItem: vmItem).edgesIgnoringSafeArea(.all)
//            
//        }
//    }
//}
//
//
//struct ARViewContainer: UIViewRepresentable {
//    var vm:FoodViewModel
//    let  vmItem:String
//    
//    func makeUIView(context: Context) -> ARView {
//        vm.selectedcopitafood = vmItem
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
//
//
//#if DEBUG
//struct ARViewContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ARViewContainerView(vmItem: "Guacamole")
//    }
//}
//#endif
//
//
