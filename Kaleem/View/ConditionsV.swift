

import SwiftUI

struct Conditions: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6702727675, green: 0.7386049628, blue: 0.7854616046, alpha: 1)), Color(#colorLiteral(red: 0.9962391257, green: 0.8958832622, blue: 0.8005118966, alpha: 1))]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2299459577, green: 0.6377876401, blue: 0.7500101328, alpha: 1)).opacity(0.6), Color(#colorLiteral(red: 0.99701792, green: 0.8917155862, blue: 0.8008757234, alpha: 1)).opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            ZStack {
//                Circle()
//                    .frame(width: 400, height: 400)
//                    .offset(x: 150, y: -200)
//                    .foregroundColor( Color(#colorLiteral(red: 0.99701792, green: 0.8917155862, blue: 0.8008757234, alpha: 1)).opacity(0.6))
//                    .blur(radius: 8)
//                Circle()
//                    .frame(width: 300, height: 300)
//                    .offset(x: -100, y: -125)
//                    .foregroundColor(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.4))
//                    .blur(radius: 8)
                
                PopupView()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        Conditions()
    }
}

struct PopupView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        
        HStack {
            Spacer()
            Button(action: {
                self.mode.wrappedValue.dismiss()
                                withAnimation(.easeInOut){
                                  
                                }
                            }, label: {
                                Image(systemName: "chevron.forward")
                                    .font(.system(size: 25, weight: .semibold))
                                    .foregroundColor(.black.opacity(0.6))
                                     .padding(.vertical)
                                     .padding(.horizontal)
                                 
                     
                        }).padding(.horizontal,25)
        }  .padding(.top,-390)
        ZStack(alignment: .topLeading) {
  
         
            Color.white.opacity(0.2)
                .frame(width: 300, height: 680)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                .blur(radius: 1)
            
            VStack(alignment: .center, spacing: 16) {
                Text("✔️ الشروط")
                    .font(Font.custom("Almarai-Bold", size: 30))
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.top)

                
                VStack(alignment: .trailing, spacing: 16) {
                    Spacer(minLength: 5)
                    Text("١. البند الأول: هدف تطبيق (كليــم)")
                        .font(Font.custom("Almarai-Bold", size: 20))
                        .multilineTextAlignment(.trailing)
                   Text("دعم فئة الصم وضعاف السمع من خلال تمثيل تطبيق كليــم كمساعد شخصي لاحتياجاتهم")
                        .font(.footnote)
                        .multilineTextAlignment(TextAlignment.trailing)
                    
                    Spacer(minLength: 10)
                    Text("٢. البند الثاني: التزامات المستخدم")
                        .font(Font.custom("Almarai-Bold", size: 20))
                        .multilineTextAlignment(.trailing)
                    
                    secondTerm()
                    
                    Spacer(minLength: 10)
                 
              
                        thirdTerm()
                    Spacer(minLength: 10)
             
                    Text("* يستمر حساب المستخدم مفعلاً ما لم يتم إنهاؤه من قبل إدارة تطبيق (كليــم)، أو بناءً على طلب من المستخدم يرسل إلى البريد الإلكتروني: (Kaleemapp.ksu@gmail.com)")
                          .font(.footnote)

                          .multilineTextAlignment(TextAlignment.center)
                          .padding(.bottom)
                        
                }
            }   .font(Font.custom("Almarai-Bold", size: 10))
            .padding()
            .frame(width: 300, height: 680)
            .foregroundColor(Color.black.opacity(0.8))
            
        }
    }
}
struct secondTerm: View {

    var body: some View {
        VStack(alignment: .trailing){
        Text("١.٢  يتحمل المستخدم المسؤولية عن صحة البيانات  المدخلة في التطبيق")
           
            Text("")
            
            Text("٢.٢  يتحمل المستخدم المسؤولية عن صحة البيانات  المدخلة في التطبيق")
            
        
        }   .font(.footnote)
            .multilineTextAlignment(TextAlignment.trailing)
        
    }
}

struct thirdTerm: View {

    var body: some View {
        Text("٣. البند الثالث: سياسة كلمة المرور")
            .font(Font.custom("Almarai-Bold", size: 20))
  
          
        VStack(alignment: .trailing) {
      
            
        Text("١.٣  يجب أن تحتوي على الأقل ٧ خانات")
             
            Text("")
            
            Text("٢.٣ يجب أن تحتوي حرف واحد على الأقل كبير، وحرف واحد على الأقل صغير، ورقم واحد على الأقل")
                  
        
        }   .font(.footnote)
            .multilineTextAlignment(TextAlignment.trailing)
     
        
    }
}
