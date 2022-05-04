

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
                                Image(systemName: "chevron.forward")
                                    .font(.system(size: 25, weight: .semibold))
                                    .foregroundColor(.black.opacity(0.6))
                                     .padding(.vertical)
                                     .padding(.horizontal)
                                 
                     
                        }).padding(.horizontal,25)
        }  .padding(.top,-390)
        ZStack(alignment: .topLeading) {
  
         
            Color.white.opacity(0.2)
                .frame(width: 300, height: 650)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                .blur(radius: 1)
            
            VStack(alignment: .center, spacing: 16) {
                Text("🔒 الخصوصية")
            
                    .font(Font.custom("Almarai-Bold", size: 27))
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.top)
                
                

                
                VStack(alignment: .trailing, spacing: 16) {
                    Spacer(minLength: 5)
                    Text("١. البند الأول: مقدمة")
                        .font(Font.custom("Almarai-Bold", size: 20))
                        .multilineTextAlignment(.trailing)
                    
                    Text("إن إدارة التطبيق تلتزم بالمحافظة على سرية وخصوصية معلومات المستخدم والمواد المدخلة من قبلهم كأساس لسياسة الخصوصية")
                 
                        .font(.footnote)
                        .multilineTextAlignment(TextAlignment.trailing)
                    
                    Spacer(minLength: 10)
                    Text("٢. البند الثاني: معلومات المستخدم")
            
                        .font(Font.custom("Almarai-Bold", size: 20))
                        .multilineTextAlignment(.trailing)
                    
                    secondPrivacy()
                    
                    Spacer(minLength: 10)
                 
              
                    thirdPrivacy()
                    Spacer(minLength: 10)
             
                    Text("* إن اللغة العربية هي المعتمدة في تطبيق الأحكام والشروط، وفي حال نشأ خلاف في تفسير أي نص ورد بأي لغة أخرى فيقدم النص المكتوب باللغة العربية.")
            
                          .font(.footnote)
                          

                          .multilineTextAlignment(TextAlignment.center)
                          .padding(.bottom,30)
                
                    
                           
                        
                }
            }   .font(Font.custom("Almarai-Bold", size: 10))
            .padding()
            .frame(width: 300, height: 650)
            .foregroundColor(Color.black.opacity(0.8))
            
        }
    }
}
struct secondPrivacy: View {

    var body: some View {
        VStack(alignment: .trailing){
        Text("١.٢ البيانات الشخصية المستخدمة في التسجيل")
           
            Text("")
            
            Text("٢.٢ بيانات الموقع الجغرافي للمستخدم وتحركاته")
            
        
        }   .font(.footnote)
            .multilineTextAlignment(TextAlignment.trailing)
        
    }
}

struct thirdPrivacy: View {

    var body: some View {
        Text("٣. البند الثالث: جمع البيانات وتخزينها")
            .font(Font.custom("Almarai-Bold", size: 20))
  
          
        VStack(alignment: .trailing) {
      
            
            Text("خصائص الجهاز : لتقديم الخدمات يحتاج التطبيق الوصول الى بعض معلومات المستخدم والجهاز مثل : الموقع GPS ، الكاميرا")
                  
        
        }   .font(.footnote)
            .multilineTextAlignment(TextAlignment.trailing)
     
        
    }
}
