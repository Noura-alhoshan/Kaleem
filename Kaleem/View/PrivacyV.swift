

import SwiftUI

struct Privacy: View {
   
    var body: some View {
        

        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6702727675, green: 0.7386049628, blue: 0.7854616046, alpha: 1)), Color(#colorLiteral(red: 0.9962391257, green: 0.8958832622, blue: 0.8005118966, alpha: 1))]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2299459577, green: 0.6377876401, blue: 0.7500101328, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.99701792, green: 0.8917155862, blue: 0.8008757234, alpha: 1)).opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            ZStack {

                
                PrivacyPopupView()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Privacy_Previews: PreviewProvider {
    static var previews: some View {
        Privacy()
    }
}

struct PrivacyPopupView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        
        HStack {
            Spacer()
            Button(action: {
                self.mode.wrappedValue.dismiss()
                                withAnimation(.easeInOut){
                                  
                                }
                            }, label: {
                                Image(systemName: "chevron.right")
                                     .foregroundColor(.white)
                                     .padding(.vertical,10)
                                     .padding(.horizontal)
                                    // .background(Color.black.opacity(0.4))
                                     .background(Color("Kcolor"))
                                     .cornerRadius(10)
                        }).padding(.horizontal,25)
        }  .padding(.top,-380)
        ZStack(alignment: .topLeading) {
            Color.white.opacity(0.5)
                .frame(width: 300, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
                .blur(radius: 1)
            
            VStack(alignment: .trailing, spacing: 16) {
                Text("Glassmorphism")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                
                Text("Wow, what a beautiful screen".uppercased())
                    .font(.caption)
                
                Text("This could be your body text. If you are enjoying this video, like and subscribe.")
                    .font(.footnote)
            }
            .padding()
            .frame(width: 300, height: 400)
            .foregroundColor(Color.black.opacity(0.8))
            
        }
    }
}
