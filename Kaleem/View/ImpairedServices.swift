//
//  File.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 06/08/1443 AH.
//


//
//  ImpairedServices.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 06/08/1443 AH.
//

import SwiftUI

struct ImpairedServ: View {
    
    @State var index = 0
    @State var stories = [
        Story(id:0, image: "VC", offset: 0, title: "استعن بمتطوع ! "),
        Story(id:1, image: "Location-1", offset: 0, title:  "جمل مساعدة"),
        Story(id:2, image: "CL", offset: 0, title: "المفضلة "),
        Story(id:3, image: "statistics", offset: 0, title: "تفاعلك مع كليــم"),
        
        
    ]
    @State var scrolled = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack{
                
//
//                HStack{
                    //                    Button(action: {}){
                    //
                    //                        Image(systemName:"search")
                    //                            .renderingMode(.template)
                    //                            .foregroundColor(.white)
                    //                    }
                    //
                    //                    Spacer()
                    //
                    //                    Button(action: {}){
                    //
                    //                        Image("Test")
                    //                            .renderingMode(.template)
                    //                            .foregroundColor(.white)
                    //                    }
//
//
//                }
//                .padding()
                HStack{
                    //this is should be in home
                    Text(" أهلاً ، رنيم !").bold()
                        .font(Font.custom("Almarai-Regular", size: 30))
                        .font(.title3)
                        .fontWeight(.bold)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.gray)
                    
                    Spacer(minLength: 0)
                    
//                    Button(action:{}){
//                        Image("dots")
//                            .renderingMode(.template)
//                            .foregroundColor(.white)
//                            .rotationEffect(.init(degrees: 90))
//
//
//                    }
                    
                }
                .padding(.horizontal)
                
                
                HStack{
                    //change its direction
                    Text("الإشعارات")
                        .font(.system(size: 15))
                        .font(Font.custom("Almarai-Regular", size: 15))
                        .kerning (1.2)
                    
                        .foregroundColor(index == 0 ? .white : .gray)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(Color("Color").opacity(index == 0 ? 1:0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = 0
                        }
                    
                    
                    Text("الخدمات")
                    
                        .font(.system(size: 15))
                        .font(Font.custom("Almarai-Regular", size: 18))
                        .kerning (1.2)
                    
                        .foregroundColor(index == 1 ? .white : .gray)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background(Color("Color").opacity(index == 01 ? 1:0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = 1
                        }
                    
                }
                .padding(.horizontal)
                .padding(.top,10)
                .padding(.bottom,50)
                
                // Card view...
                
                ZStack{
                    
                    // ZStack will overlap views so last will become first...
                    ForEach(stories.reversed()){
                        story in
                        
                        HStack{
                            
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)){
                                
                                Image(story.image)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                //dynamic frame
                                // dynamic height
                                    .frame(width: calculateWidth(), height:(UIScreen.main.bounds.height / 1.8) - CGFloat(story.id - scrolled) * 50)
                                    .cornerRadius(2)
                                // based on scrolled changing view size...
                                
                                    .overlay(RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color("Gray"), lineWidth: 1.5))
                                
                                VStack(alignment: .leading, spacing: 18){
                                    
                                    HStack{
                                        
                                        Text(story.title)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.gray)
                                        
                                        Spacer()
                                    }
                                    
                                    
                                    Button(action: {}){
                                        Text("Read Later")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.vertical,16)
                                            .padding(.horizontal,25)
                                            .background(Color("Color"))
                                            .clipShape(Capsule())
                                        
                                    }
                                }
                                .frame(width: calculateWidth() - 40)
                                .padding(.leading,20)
                                .padding(.bottom,20)
                            }
                            
                            .offset(x: story.id - scrolled <= 2 ? CGFloat(story.id - scrolled * 30) : 60)
                            
                            Spacer(minLength: 0)
                        }
                        .contentShape(Rectangle())
                        
                        //adding gesture...
                        .offset(x:story.offset)
//                        .gesture(DragGesture().onChanged({
//                            (value) in
//                            withAnimation{
//
//                                //disabling drag for last card...
//
//                                if value.translation.width < 0 && story.id != stories.last!.id{
//                                    stories[story.id].offset = value.translation.width
//
//                                }
//
//                                else {
//
//                                    //restoring cards...
//                                    if story.id > 0{
//
//                                        stories[story.id - 1].offset = -(calculateWidth() + 60) + value.translation.width
//                                    }
//                                }
//
//                            }
//
//                        })
                                 
                                 
                                 
//                                    .onEnded({
//                            (value) in
//
////                            withAnimation{
////
////                                if value.translation.width < 0{
////
////                                    if -value.translation.width > 180 && story.id != stories.last!.id{
////                                        // moving view away...
////                                        stories[story.id].offset = -(calculateWidth() + 60)
////                                        scrolled += 1
////                                    }
////
////                                    else{
////
////                                        stories[story.id].offset = 0
////
////                                    }
////
////                                }
////
////
////                                else {
////
////                                    //restoring cards
////                                    if story.id > 0{
////
////                                        if value.translation.width > 180 {
////
////                                            stories[story.id - 1].offset = 0
////                                            scrolled -= 1
////                                        }
////
////                                        else{stories[story.id - 1].offset = -(calculateWidth() + 60)}
////
////                                    }
////
////                                }
////
////                            }
//
//                        }
//
//
//                                             )
                                             // end of onended
                                         

                //        )
//
                        
                        
                        
                        
                    }
                    
                }
                
                //max height...
                
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .padding(.horizontal, 25)
                .padding(.top,25)
                
                Spacer()
            }
        }
        //        .background(
        //
        //            LinearGradient(gradient: .init(colors: [Color.white, Color("Color")]), startPoint: .top, endPoint: .bottom)
        //                .edgesIgnoringSafeArea(.all)
        //        )
        
    }
    
    
    func calculateWidth()-> CGFloat{
        
        // horizontal padding 50
        let screen = UIScreen.main.bounds.width - 50
        //going to show first three cards...
        // all other will be hidden...
        
        // scnd and third will be moved X axis 30 value..
        let width = screen - (2 * 30)
        return width
        
    }
    
}


// Sample Data
struct Story : Identifiable{
    
    var id : Int
    var image : String
    var offset : CGFloat
    var title : String
}

struct ImpairedServ_Previews: PreviewProvider {
    static var previews: some View {
        ImpairedServ()
    }
}
