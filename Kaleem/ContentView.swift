import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {

        Text("Hello, Kaleem!")
            .padding()
        NavigationLink {
            
            QuizContentView()

            
        } label: {
            PrimaryButton(text:"The Accept")
        }.background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))

    }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
