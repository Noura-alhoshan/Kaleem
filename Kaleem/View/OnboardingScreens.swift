//
//  OnboardingScreens.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 11/07/1443 AH.
//

import SwiftUI

struct Onboarding: View {
    
    @State var intros: [Intro] = [
        Intro(title: "Plan", subTitle: "your routes",
            description: "View your collection route Follow", pic:
            "Pic1",color: Color("Green")),
        Intro(title: "Quick Waste", subTitle: "Transfer Note",description: "Record oil collections easily", pic: "Pic2",color:
            Color("DarkGrey")),
        Intro(title: "Invite", subTitle:"restaurants", description: "Know some restaurant who want to", pic: "Pic3",color: Color("Yellow")),
   
        ]
    
    // Gesture Properties
    @GestureState var isDragging: Bool = false
    @State var fakeIndex: Int = 0
    @State var currentIndex: Int = 0

    var body: some View {
        ZStack {
            
            ForEach(intros.indices.reversed(),id: \.self){
                index in
                IntroView(intro: intros[index])
                //Custom Liquid Shape ..
                    .clipShape(LiquidShape(offset: intros[index].offset))
                    .padding(.trailing)
                    .ignoresSafeArea()
                
            }
            
        }
        //arrow with Drag Gesture ...
        .overlay(Button(
        
            action: {}, label: {
                
                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                    .contentShape (Rectangle())
                    .gesture(
                        
                    //Drag gesture ...
                        DragGesture()
                            .updating($isDragging, body: { value, out, _ in
                                out = true
                            })
                            .onChanged({
                                
                                value in
                                // updating offset
                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                    
                                    
                                    intros[currentIndex].offset = value.translation
                                }
                            })
                        
                            .onEnded({value in}) // HERE ==========================
                    
                    )
            })
                    .offset(y: 53)
                 ,alignment: .topTrailing)
    }//End Body
    
    @ViewBuilder
    func IntroView(intro: Intro)->some View
    {
      
        VStack{
            Image(intro.pic)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .padding(40)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(intro.title)
                    .font(.system(size:45))
                
                Text(intro.subTitle)
                    .font(.system(size:50, weight: .bold))
                
                
                Text(intro.description)
                    .font(.system(size:20))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .frame(width: getRect().width - 100)
                    .lineSpacing(8)
                
                
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            intro.color
             
    )
        

//            .foregroundColor(.blue)
//
//            .padding(.leading, 20)
//            .padding([.trailing, .top])
        
     //   .ignoresSafeArea()
        
    }
}



extension View{
    func getRect()-> CGRect{
        
        return UIScreen.main.bounds
    }
    
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct LiquidShape: Shape{
    var offset: CGSize
    
    func path(in rect: CGRect) -> Path {
        
        
        return Path {
            
            path in
            // when user moves left...
            // increasing size both in top and bottom....
            // so it will create a liquid swipe effect...
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            // First Constructing Rectangle Shape...
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine (to: CGPoint (x: rect.width, y: 0))
            path.addLine (to: CGPoint (x: rect.width, y: rect.height))
            path.addLine (to: CGPoint(x: 0, y: rect.height))
            // Now Constructing Curve Shape....
            
            //from
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x:rect.width,y: from > 80 ? 80 : from))
        }
    }
}
