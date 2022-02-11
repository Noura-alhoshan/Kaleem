//
//  ContentView.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        if currentPage > totalPages{
            
            SignUpInScreen()
        }
        
        else {
            WalkthroughScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Home Page....

// WalkThrough SCreen....
struct WalkthroughScreen: View {
      @AppStorage("currentPage") var currentPage = 1
    var body: some View{
    // For Slide Animation...
     ZStack{
         //Changing b/w views
         if currentPage == 1{
             ScreenView(image: "TT", title: "الترجمة المُباشرة", detail: "يُتيح كليم خاصية الترجمة المباشرة لايماءات لغة الإشارة إلى نص مقروء أو مسموع")
                 .transition(.scale)
         }
         
         if currentPage == 2{
             ScreenView(image: "Location-1", title: "الموقع", detail:"يوّفر كليم ميزة استخراج الجمل أو الكلمات المناسبة لموقع المستخدم الحالي")
                 .transition(.scale)
         }
         if currentPage == 3{
             ScreenView(image: "VideoCall", title: "الاستعانة بمتطوع", detail: "يمكنك كمستخدم لكليم بالاستعانة بمتطوعي تطبيق كليم لمساعدتك في الترجمة للطرف الآخر من خلال الاتصال المرئي")
                 .transition(.scale)
         }
         
      // .background()
     }
     .overlay(
        //Button..
        Button(action: {
            
            withAnimation(.easeInOut){
                
                //Checking
                if currentPage <= totalPages {
                    currentPage += 1
                }
                
                else {
                    currentPage = 1
                    
                }
                    
            }
        }, label:{
            
            Image(systemName:"chevron.left")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
                .frame(width: 60, height: 100)
                .background(Color.white)
                .clipShape(Circle())
            //Circular Slider..
                .overlay(ZStack{
                    Circle()
                        .stroke(Color.black.opacity(0.05),lineWidth: 20)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                        .stroke(Color("Color"), lineWidth: 20)
                        .rotationEffect(.init(degrees: -90))
                }
                            .padding(-15)
                )
        }
     
     )
            .padding(.bottom,20)
          
        ,alignment: .bottom
     )
        
    }}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        Image("Test").resizable().aspectRatio( contentMode: .fit)

        VStack(spacing: 20){
            HStack{
                
                
                Spacer()
                Button(action: {
                    
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("تخطي")
                        .font(Font.custom("Almarai-Light", size: 18))
                        .fontWeight(.semibold)
                        .kerning (1.4)
                 
                })
                
                Spacer(minLength: 200)
                
             
                
                if currentPage == 1{
                    Text ("أهلاً بك")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        //.font(Font.custom("Almarai-Regular", size: 20))
                        . font(.title)
                    // Letter Spacing...
                        .kerning (1.2)
                    
                    
                }
                
                else {
               
                    Spacer(minLength: 50)
                    //Back btn
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                        }
                        
                    }, label: {
                       Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                     
                    })
                }
               
                
                
                Spacer()
                
              
            }
            
            .foregroundColor(.black)
            .padding()
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .font(Font.custom("Almarai-Light", size: 25))
                .foregroundColor(.black)
                .padding(.top,70)
           // Spacer(minLength: 0)
            Image(image).resizable().aspectRatio( contentMode: .fit)
            
          
            
            Text(detail)
                .fontWeight(.semibold)
                .font(Font.custom("Almarai-Light", size: 20))
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .padding(.bottom,20)
            //Minimum spacing when Phone is reducing
            Spacer(minLength: 120)
            
        }
    }
}
var totalPages = 3
