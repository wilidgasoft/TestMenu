//
//  ContentView.swift
//  Copita AR Menu
//
//  Created by Felix Barker on 3/12/23.
//

import SwiftUI
import RealityKit
import ARKit





struct ContentView : View {
    @State var menuOpen: Bool 
    let width: CGFloat
    
    //    let menuClose: () -> Void
    
    @StateObject private var vm = FoodViewModel()
    let copitafood = ["Chips&TwoSalsas", "Guacamole","PapasBravas", "HabaneroWings","TortillaSoupCup", "TortillaSoupBowl","EnsaladaMixta", "GoldenBeetSalad", "QuesoFundido", "Bruselas", "MexicanTruffleEmpanadas" ]
    
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.menuOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.openMenu()
            }
            
            ARViewContainer(vm: vm).edgesIgnoringSafeArea(.all)
            //            ScrollView(.horizontal){
            
            //            }
            
            HStack {
                
                HStack {
            
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
                        
                            .frame(width: self.width)
                            .background(Color.white)
                            .offset(x: self.menuOpen ? 0 : -self.width)
                            .animation(.default)
                        
                        Spacer()
                }
                VStack {
                    if !self.menuOpen {
                        Button(action: {
                            self.openMenu()
                        }, label: {
//                            Text("MENU")
                            Image(systemName: "filemenu.and.selection")
                                .resizable()
                                .frame(width: 50, height: 50)
                        })
                    } else {
                        Button(action: {
                            self.openMenu()
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                        })
                    }
                    Spacer()
                }
                
              
                
            }
            
            
        } // zstack
    }
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    let vm:FoodViewModel
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        config.environmentTexturing = .automatic
        session.run(config)
        
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tapped)))
//        removingView(arView: arView)
        
        context.coordinator.arView = arView
        arView.addCoachingOverlay()
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator{
        Coordinator(vm: vm)
        
    }
    
    func removingView(arView: ARView) {
            arView.session.pause()            // there's no session on macOS
            arView.session.delegate = nil     // there's no session on macOS
            arView.scene.anchors.removeAll()
            arView.removeFromSuperview()
            arView.window?.resignKey()
//            arView = nil
        }
}





#if DEBUG
//    struct ContentView_Previews : PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }
#endif

