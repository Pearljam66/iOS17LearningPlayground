import PlaygroundSupport
import SwiftUI

struct ExampleView: View {

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
            Button(action: {
            }) {
                Text("Rotate")
            }
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ExampleView().padding(100))
