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
                "TT",color: Color.white),
        Intro(title: "Quick Waste", subTitle: "Transfer Note",description: "Record oil collections easily", pic: "Location-1",color:
            Color("Grey")),
        Intro(title: "Invite", subTitle:"restaurants", description: "Know some restaurant who want to", pic: "VideoCall",color: Color("Color")),
   
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
                    .clipShape(LiquidShape(offset: intros[index].offset, curvePoint: fakeIndex == index ? 50 : 0))
                    .padding(.trailing, fakeIndex == index ? 15 : 0)
                    .ignoresSafeArea()
                
            }
            
            HStack(spacing: 8){
                
                // Indicator ...
                ForEach( 0..<intros.count - 2, id: \.self){
                    index in
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                        .scaleEffect(currentIndex == index ? 1.15 : 0.85)
                        .opacity(currentIndex == index ? 1 : 0.25)
                    
                }
                Spacer()
                
                NavigationLink(
                    destination: SignUpTaps().navigationBarHidden(true),
                    label: {
                        Text("تخطي")
                            .font(Font.custom("Almarai-Bold", size: 20))
                            .font(.title3)
                            .fontWeight(.bold)
//                            .foregroundColor(Color.white)
//                            .padding()
//                            .frame(width: 300)
//                            .background(Color("Color"))
//                            .cornerRadius(50.0)
//                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
//                            .padding(.vertical)
                    }
                )
                
            }
            .padding()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
        }
        //arrow with Drag Gesture ...
        .overlay(Button(
        
            action: {}, label: {
                
                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
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
                                    intros[fakeIndex].offset = value.translation
                                    
                                
                                }
                            })
                        
                            .onEnded({value in
                                
                                withAnimation(.spring()) {
                                    
                                    //checking
                                    if -intros[fakeIndex].offset.width > getRect().width / 2{
                                        
                                        
                                        // setting width to height...
                                        intros[fakeIndex].offset.width = -getRect().height * 1.5
                                        
                                        //Updating Index ...
                                        fakeIndex+=1
                                        
                                        //Updating Orignal index
                                        if currentIndex == intros.count - 3 {
                                            
                                            currentIndex = 0
                                        }
                                        
                                        else {
                                            
                                            currentIndex += 1
                                        }
                                        
                                         // when fake index reaches the element that is before last one
                                        // shifting again to first last so that it will
                                       // create a feel like infinite carousel...
                                        
                                        // some delay to finish the swipe animation ...
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                                            
                                            if fakeIndex == (intros.count - 2){
                                                 for index in 0..<intros.count - 2{
                                                       intros[index].offset = .zero
                                                // updating current index...
                                                 fakeIndex = 0
                                            }
                                            
                                            }}
                                        
                                    }
                                    
                                    else {
                                        
                                        intros[fakeIndex].offset = .zero
                                    }
                                            
                                          
                                }
                                
                            }) // Raneem stopped here ==========================
                    
                    )
            })
                    .offset(y: 53)
                    .opacity(isDragging ? 0 : 1)
                    .animation(.linear, value: isDragging)
                 ,alignment: .topTrailing)
        
        .onAppear{
            
            //Inserting last element to first
            //and first to last to create a feel like infinite carousel...
            
            guard let first = intros.first else{
                return
            }
            
            guard var last = intros.last else {
                return
            }
            
            last.offset.width = -getRect().height * 1.5
            intros.append(first)
            intros.insert(last, at: 0)
            
            //updating fake index...
            fakeIndex = 1
            
        }
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
    var curvePoint: CGFloat
    
    //Multiple Animatable Data ...
    // Animating Shapes...
    var animatableData: AnimatablePair<CGSize.AnimatableData, CGFloat>{
        
        get{
            
            return AnimatablePair(offset.animatableData, curvePoint)
        }
        
        set{
            
            offset.animatableData = newValue.first
            curvePoint = newValue.second
        }
        
    }
    
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
            
            //Also Adding Height..
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            // Mid b/w 80-180...
            let mid : CGFloat = 80 + ((to - 80) / 2)
            
        //   path.addCurve(to: <#T##CGPoint#>(x: rect.width, y: to), control1: <#T##CGPoint#>(x: width - curvePoint, y: mid), control2: CGPoint(x: width - curvePoint, y: mid))
            
        }
    }
}
