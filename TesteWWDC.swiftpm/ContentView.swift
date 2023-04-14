import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State var currentScene: SKScene = KnapsackScene(size: CGSize(width: 1024, height: 768))
    
    var body: some View {
        SpriteView(scene: currentScene)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}