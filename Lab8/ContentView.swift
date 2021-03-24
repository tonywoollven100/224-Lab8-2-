//
//  ContentView.swift
//  Lab8
//
//  Created by ICS 224 on 2021-03-24.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    // Load the "Box" scene from the "Experience" Reality File
    let boxAnchor = try! Experience.loadBox()
    
    var body: some View {
        VStack{
            ARViewContainer(boxAnchor: boxAnchor).edgesIgnoringSafeArea(.all)
            //ButtonView()
            Button("Play", action: {play(boxAnchor: boxAnchor) })
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    var boxAnchor: Experience.Box
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
}

func play(boxAnchor: Experience.Box){
    boxAnchor.notifications.startNotification.post()
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
