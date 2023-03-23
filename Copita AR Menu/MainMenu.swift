//
//  MainMenu.swift
//  Copita AR Menu
//
//  Created by wilman garcia on 22/03/23.
//

import SwiftUI

struct MainMenu:  View {
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Restaurants")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
                VStack(spacing: 30) {
                    
                    NavigationLink {
                        MenuView()
                    } label: {
                        Image("copita")
                            .resizable()
                            .frame(width: 200, height: 150)
                            .background(Color.white)
                        
                    }
                    
                    NavigationLink {
                        MenuView()
                    } label: {
                        Image("tacoco")
                            .resizable()
                            .frame(width: 200, height: 150)
                            .background(Color.white)
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                
                Spacer()
            }
            
        }
        
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
