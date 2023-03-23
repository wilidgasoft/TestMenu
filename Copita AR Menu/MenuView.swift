//
//  MenuView.swift
//  Copita AR Menu
//
//  Created by wilman garcia on 22/03/23.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject private var vm = FoodViewModel()
    
    let copitafood = ["Chips&TwoSalsas", "Guacamole","PapasBravas", "HabaneroWings","TortillaSoupCup", "TortillaSoupBowl","EnsaladaMixta", "GoldenBeetSalad", "QuesoFundido", "Bruselas", "MexicanTruffleEmpanadas" ]
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical){
                VStack{
                    
                    ForEach(copitafood, id:\.self) { name in
//                        Image(name)
//                            .resizable()
//                            .frame(width:300, height: 150)
//                            .border(.red, width:vm.selectedcopitafood == name ? 1.0: 0.0)
//                            .cornerRadius(15)
//                            .onTapGesture{
//
//                                //                                    self.selectedItem = name
//                                //                                ARViewContainerView(vmItem: name )
//                            }
                        
                        NavigationLink {
                            ARViewContainerView(vmItem: name)
                        } label: {
                            Image(name)
                                .resizable()
                                .frame(width:300, height: 150)
                                .border(.red, width:vm.selectedcopitafood == name ? 1.0: 0.0)
                                .cornerRadius(15)
                        }
                    }
                        
                    }
                    
                    
                }
                
            }
        }
    }
    
    
    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }
