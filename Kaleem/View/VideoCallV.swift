
/* This is the file where we will display list*/
import Foundation
import SwiftUI

struct VideoCallV: View {
    @ObservedObject private var viewModel = VideoCallVM()
    @State var backToHome: Bool = false
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack{
        HStack{
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
            NavigationLink(destination: HomeAll(), isActive: $backToHome , label: {EmptyView()} )

        }
        
        List (viewModel.list) { v in
            let gender : String = v.name
            let number1 : String = "facetime://"
            let number2 : String = v.phoneNo
            let number3 : String = number1+number2
            
            VStack(alignment: .trailing) {
                HStack(alignment: .center){
                    Text(v.name).padding(.trailing, 4).font(.title3)

                   Image(systemName: "person.fill")
                       .foregroundColor(Color("Kcolor")).padding(.trailing, 2).font(.system(size: 20))

                } .padding(.top , 5)
                
                HStack {
              //  Spacer()
//                    Text(v.phoneNo)
//                        .foregroundColor( .black.opacity(0.5))
//                        .padding(.trailing, 6)
//                        .multilineTextAlignment(TextAlignment.trailing)
                 
                    
                    Button( action: {
                        
                        if let yourURL = URL(string: number3) {
                            UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                        }
                        
                    } , label: {
                        Image(systemName: "phone.circle")
                            .foregroundColor(Color("Kcolor")).padding(.trailing, 290).font(.system(size: 25))
                        
                    })
                } .padding(.top, -40)
               
          
            }
            
            
            
        }
            
    }.navigationBarTitle("المتطوعين")
        .navigationBarHidden(true)
          
        }
    init(){
        viewModel.getData()
    }
}
