
/* This is the file where we will display list*/
import Foundation
import SwiftUI

struct VideoCallV: View {
    @ObservedObject private var viewModel = VideoCallVM()
    @State var backToHome: Bool = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        HStack{
            Text(" المتطوعيـن")
            
                .font(Font.custom("Almarai-Regular", size: 30))
            
                .foregroundColor(.black.opacity(0.6))
                .padding(.leading,135)
                .padding(.top)
            Spacer(minLength: 30)
            
            Button(action: {
                                withAnimation(.easeInOut){
                                    self.mode.wrappedValue.dismiss()
                                }
                            }, label: {
                                Image(systemName: "chevron.right")
                                     .foregroundColor(.white)
                                     .padding(.vertical,10)
                                     .padding(.horizontal)
                                     .background(Color("Kcolor"))
                                     .cornerRadius(10)
                             
                            }).padding(.horizontal,25)
                .padding(.top)
            
        }
        

        List (viewModel.list) { v in
            
            VStack(alignment: .trailing) {
                HStack(alignment: .center){
                    Text(v.name).padding(.trailing, 4)
                        .font(Font.custom("Almarai-Regular", size: 20))
                    
                        .foregroundColor(.black.opacity(0.6))

                    Image(v.gender)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .clipped()
                    .padding(.trailing, 1)
                }
                  

            
                
                HStack {
  
                    Button( action: {
                        
                        if let yourURL = URL(string: "facetime://"+v.phoneNo) {
                            UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                        }
                        
                    } , label: {
                        Image(systemName: "phone.circle")
                            .foregroundColor(Color("Kcolor")).padding(.trailing, 290).font(.system(size: 25))
               
                    })
                } .padding(.top, -40)
     
        }.navigationBarTitle("")
                .navigationBarHidden(true)
      
            
        }.navigationBarTitle("")
        .navigationBarHidden(true)
      

    }

    init(){
        viewModel.getData()
    }
}

struct videocall: PreviewProvider{
    static var previews: some View{
        VideoCallV()
    }
}
