//
//  SignToTextV.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 30/09/1443 AH.
//

//
//  ContentView.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//

import SwiftUI

struct SignToTextV: View {
    @AppStorage("currentPage1") var currentPage1 = 1

    var body: some View {

        if currentPage1 > totalPagess{
            root()
        }
        else {
            Instrouctions()
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// Home Page....

// WalkThrough SCreen....
struct Instrouctions: View {
      @AppStorage("currentPage1") var currentPage1 = 1
    var body: some View{
    // For Slide Animation...
     ZStack{

         //Changing b/w views
         if currentPage1 == 1{
             ScreenView2(image: "slow", title: "تمهـل", detail: "الرجـاء التمهـل عنـد القيـام بالاشـارة")
                 .transition(.scale)
         }
         
         if currentPage1 == 2{
             ScreenView2(image: "border", title: "ضـمن الاطـار", detail:  "يجب أن يكون الرأس واليدين كاملتين بالمرفق ضمن إطـار الالتقاط")
                 .transition(.scale)
         }
         if currentPage1 == 3{
             ScreenView2(image: "position", title: " لا تتـحـرك", detail: "يجب أخـذ وضعيـة ثابتة")
                 .transition(.scale)
         }
         
         if currentPage1 == 4{
             ScreenView2(image: "frontC", title: "الكامـيرا الأمـاميـة", detail : "عنـد النقـر على ابدأ الالتـقاط ستُـفتح الكامـيرا الامـامية")
                 .transition(.scale)
         }


      // .background()
     }
     .overlay(
        //Button..
        Button(action: {
            
            withAnimation(.easeInOut){
                
                //Checking
                if currentPage1 <= totalPagess {
                    currentPage1 += 1
                }
                
                else {
                    currentPage1 = 1

                    
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
                        .trim(from: 0, to: CGFloat(currentPage1) / CGFloat(totalPagess))
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
     .navigationBarTitle("")
            .navigationBarHidden(true)
        
    }}

struct ScreenView2: View {
    
    var image: String
    var title: String
    var detail: String

    
    @AppStorage("currentPage1") var currentPage1 = 1
    var body: some View {

    

        VStack(spacing: 20){
            HStack{

                
                Spacer()
                Button(action: {
                    
                    withAnimation(.easeInOut){
                        currentPage1 = 5
                    }
                }, label: {
                    Text("تخطي")
                        .font(Font.custom("PNU-Light", size: 20))
                        .fontWeight(.semibold)
                        .kerning (1.4)
                 
                })
                .foregroundColor(.black.opacity(0.7))
                
                Spacer(minLength: 180)
                
             
                
                if currentPage1 == 1{
                    Text ( "تعليـمات الترجمـة")
                        .font(Font.custom("Almarai-Regular", size: 25))
                        .foregroundColor(.black.opacity(0.7))
//
//
//                        . font(.title)
//                        .fontWeight(.semibold)
//                    // Letter Spacing...
//                        .kerning (1.2)
                    
                    
                }
                
                else {
               
                    Spacer(minLength: 50)
                    //Back btn
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentPage1 -= 1
                        }
                        
                    }, label: {
                       Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color("Color"))
                            .cornerRadius(10)
                     
                    })
                }
               
                
                
                Spacer()
                
              
            }
            
            .foregroundColor(.black)
            .padding()
            Text(title)
                .fontWeight(.bold)
                .font(Font.custom("Almarai-Regular", size: 40))
                .foregroundColor(.black.opacity(0.7))
               
                .foregroundColor(.black)
                .padding(.top,50)
           // Spacer(minLength: 0)
            Image(image).resizable().aspectRatio( contentMode: .fit)
            
          
            
            Text(detail)
                .font(Font.custom("Jazeera-Bold", size: 20))
            
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .padding(.bottom,20)
                .padding(.leading,30)
                .padding(.trailing,30)
            //Minimum spacing when Phone is reducing
            Spacer(minLength: 120)
            
        }
        .foregroundColor(.black.opacity(0.7))
        .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
var totalPagess = 4
