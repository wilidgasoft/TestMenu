////
////  SideMenu.swift
////  Copita AR Menu
////
////  Created by wilman garcia on 24/03/23.
////
//
//import SwiftUI
//
//struct SideMenulocal: View {
//    let width: CGFloat
//    let isOpen: Bool = false
//    let menuClose: () -> Void
//    
//    var body: some View {
//        ZStack {
//            GeometryReader { _ in
//                EmptyView()
//            }
//            .background(Color.gray.opacity(0.3))
//            .opacity(self.isOpen ? 1.0 : 0.0)
//            .animation(Animation.easeIn.delay(0.25))
//            .onTapGesture {
//                self.menuClose()
//            }
//            
//            HStack {
//                MenuContent()
//                    .frame(width: self.width)
//                    .background(Color.white)
//                    .offset(x: self.isOpen ? 0 : -self.width)
//                    .animation(.default)
//                
//                Spacer()
//            }
//        }
//    }
//}
//
//struct ContentMenuView: View {
//    @State var menuOpen: Bool = false
//    
//    var body: some View {
//        ZStack {
//            if !self.menuOpen {
//                Button(action: {
//                    self.openMenu()
//                }, label: {
//                    Text("Open")
//                })
//            }
//            
//            SideMenulocal(width: 270,
//                     isOpen: self.menuOpen,
//                     menuClose: self.openMenu)
//        }
//    }
//    
//    func openMenu() {
//        self.menuOpen.toggle()
//    }
//}
//
//
//struct ContentMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentMenuView()
//    }
//}
