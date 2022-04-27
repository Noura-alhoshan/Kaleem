
import SwiftUI
import Combine
import RadioGroup

struct SignUpTaps : View {
    
    @State var index = 1
    @State var showAlert = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View{
       
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

        }
        GeometryReader{_ in
            VStack{
                
                Image("Logo")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 150.0, height: 70.0)
                     .padding(.top, 10)
                
              Text("انشاء حساب")
                     .foregroundColor(.black)
                     .opacity(0.7)
                     .font(.title)
                     .font(.system(size: 30))
                     //.fontWeight(.bold)
                    .padding(.bottom, -60)
                
                ZStack{
                    
                    S_SignUp(index: self.$index)
                        // changing view order...
                        .zIndex(Double(self.index))
                    
                    V_SignUp(index: self.$index)

                }
                .padding(.top, 50)
            }
            .padding(.vertical)
   
        }
    
        .background(Color.white.edgesIgnoringSafeArea(.all)) //Whole page
  
    }
}

// Volunteer Sign Up Tap
struct V_SignUp : View {


    @State var VM = SignUpVM()
    @State var username = ""
    @State var phoneNo = "" // change to phone
    @State var email = ""
    @State var gender = ""
    //    gender btn value
    @State private var lastSelectedIndex: Int?
    @State var pass = ""
    @State var repass = ""
    @Binding var index : Int
    // Error Msgs for validation
    @State var usernameErr = ""
    @State var emailErr = ""
    @State var genderErr = ""
    @State var phoneNoErr = ""
    @State var passErr = ""
    @State var repassErr = ""
    @State var allEmptyErr = ""
    @State var showQuiz = false
    // call from SignUpVM : View Model (firebase)
     func V_SignUp (){
         // for Auth.
         VM.createNewAccount(email: email, password: pass, userType: "Volunteer", username: username, phone: phoneNo, accStatus: "rejected", gender: lastSelectedIndex!)
 
    }
    var body: some View{
        

        ZStack(alignment: .bottom) {
            
            NavigationLink(destination: AQuizV().environmentObject(AQuizManagerVM()), isActive: $showQuiz, label: {EmptyView()} )
            
            VStack{
                
                HStack{
                    
                    VStack(spacing: 10){
                        
                        Text("متطوع")
                            .foregroundColor(self.index == 0 ?  .black : .gray)
                            .opacity(0.7).font(.title2)
                            //.fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color("Kcolor") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)// for top curve...
                
                // 1- username feild
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("الاسم الكامل", text: self.$username)
                            .disableAutocorrection(true)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.username, perform: {newValue in self.usernameErr = VM.validateUserName(username: self.username)})
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("Kcolor"))
                    }
                
                    Divider().background(Color("Kcolor").opacity(0.5))
                    // to display error msg if any
                    if self.usernameErr != "" {
                        Text(self.usernameErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                           // .padding()
                            .multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)
              
                // 2- Phone No feild
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("رقم الجوال", text: self.$phoneNo)
                            .disableAutocorrection(true)
                           .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                          // .keyboardType(.numberPad)
                           .onChange(of: self.phoneNo, perform: {newValue in self.phoneNoErr = VM.validatePhoneNo(phone: self.phoneNo)})
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.phoneNoErr != "" {
                        Text(self.phoneNoErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            //.padding(.bottom)
                            //.multilineTextAlignment(TextAlignment.trailing)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // 3- EMAIL feild
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("البريد الإلكتروني", text: self.$email).disableAutocorrection(true)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .keyboardType(.emailAddress)
                            .onChange(of: self.email, perform: { newValue in
                                self.emailErr = VM.validateEmail(email: self.email)
                                
                                // check if the user already use this email from th DB
                                VM = SignUpVM(email: self.email)
                                VM.isEmailExisted(handler: { status, msg in
                                    if !status {
                                        self.emailErr = "*البريد الالكتروني مسجل مسبقا"
                                    } else {
                                        self.emailErr = ""
                                    }
                                })// END check
                                
                            })
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Kcolor"))

                    }

                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.emailErr != "" {
                        Text(self.emailErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                    }

                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // 4- GENDER feild
                //                        NEWLY ADDED
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
//                        TextField("الجنس", text: self.$gender).multilineTextAlignment(TextAlignment.trailing)
                            
//                        RadioGroupPicker(selectedIndex: $selectedIndex, titles: ["ذكر", "أنثى"])
//                            .isVertical(false).selectedColor(.kaleem)
//                            .isButtonAfterTitle(true)
////                         the "kaleem" color is newly created in the extension file
//                            .fixedSize()
                            
//                        VStack {
//                            Picker(selection: $selectedIndex,label: Text("الجنس")) {
//                                ForEach(0..<genders.count) {
//                                                    Text(self.genders[$0])
//                                                }
////                                     ForEach(genders, id: \.self) {
////                                         Text($0)
////
////                                     }
//                                 }
//                                 .pickerStyle(.menu)
////                            Text(selectedIndex)
//                             }
                      
                        CustomPicker(data: ["ذكر","أنثى"], placeholder: "الجنس", lastSelectedIndex: self.$lastSelectedIndex)
                        
                        Image("gender3")
                            .foregroundColor(Color("Kcolor"))

                    }

                    Divider().background(Color("Kcolor").opacity(0.5))
//                    if self.lastSelectedIndex == nil {
//                        Text("self.genderErr")
//                            .foregroundColor(.red)
//                            .font(.system(size: 10))
//                    }

                }
                .padding(.horizontal)
                .padding(.top, 25)
                /* 4- PASS FIELD*/
                VStack{
                    // call the details from another struct for toggling the password
                SecureInputView2("كلمة المرور", text: $pass).onChange(of: self.pass, perform: {newValue in self.passErr = VM.validatePass(pass: self.pass)})
                    
                    if self.passErr != "" {
                        Text(self.passErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            
                    }
                
                }
         .padding(.horizontal)
         .padding(.top,30)
            
                /* 5- CONFIRM PASS FIELD*/
                VStack{
                SecureInputView2("تأكيد كلمة المرور", text: $repass)
                        .onChange(of: self.repass, perform: { newValue in
                            self.repassErr = VM.validateRepass(pass: self.pass, repass: self.repass)
                        })
                    
                    if self.repassErr != "" {
                        Text(self.repassErr)
                            .foregroundColor(.red)
                            .font(.system(size: 10))

                    }
                    
                }
                 .padding(.horizontal)
                 .padding(.top,30)
             
            }
            // end feilds for volunteer tab
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("KGray")) //Container
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 0
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            // Button...
            
            Button(action: {
                
                if username == "" || phoneNo == "" || email == "" || lastSelectedIndex == nil || pass == "" || repass == ""  {
                    allEmptyErr = "جميع الحقول مطلوبة"
                }
                else{
                allEmptyErr = ""
//                    print ("EMAIL %%%% \(email) &&&&&&&&& PASSWORD: \(pass) IN SUV")
                    V_SignUp()
                    showQuiz = true
            
                
                }
            
            }) {
                VStack{
                if self.allEmptyErr != "" {
                    Text(self.allEmptyErr)
                        .foregroundColor(.red)
                        .font(.system(size: 13))

                }
                    Text("انتقال")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Kcolor"))
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            }
            // moving view down..
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}


// Speech-impaired Sign Up Tab..

struct S_SignUp : View {
    // confirmation alert vars
    @State var showAlert = false
    @State var alertAction: AlertAction?
    @State var showSignIn: Bool = false
    @State var showNextPage = false

    // end alert vars
    
    @State var VM = SignUpVM()
    @State var username2 = ""
    @State var phoneNo2 = ""
    @State var email2 = ""
    @State var pass2 = ""
    @State var repass2 = ""
    @Binding var index : Int
    // Error msgs vars
    @State var usernameErr2 = ""
    @State var emailErr2 = ""
    @State var phoneNoErr2 = ""
    @State var passErr2 = ""
    @State var repassErr2 = ""
    @State var allEmptyErr2 = ""
    
    // call from SignUpVM : View Model (firebase)
     func S_SignUp (){
         // for Auth.
         VM.createNewAccount(email: email2, password: pass2, userType: "Impaired", username: username2, phone: phoneNo2, accStatus: "none", gender: -1)
    }
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            //TO NAVIGATE TO SIGN IN PAGE after Sign UP
//            NavigationLink(destination: SignIn(), isActive: $showSignIn, label: {EmptyView()} )
            
            VStack{
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("أصم")
                            .foregroundColor(self.index == 1 ? .black : .gray)
                            .opacity(0.7) .font(.title2)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color("Kcolor") : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)// for top curve...
                
                // 1-
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("الاسم الكامل", text: self.$username2)
                            .disableAutocorrection(true)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.username2, perform: {newValue in self.usernameErr2 = VM.validateUserName(username: self.username2)})
                        Image(systemName: "person.fill")
                            .foregroundColor(Color("Kcolor"))
                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                   /* Text(self.usernameErr2)
                        .foregroundColor(self.username2 == "" ? Color("Kcolor") : .red)
                        .font(.system(size: 10))
                        .padding(.all, 0)
                    */
                     if self.usernameErr2 != "" {
                        Text(self.usernameErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                // 2-
                VStack{
                    
                    HStack(spacing: 15){
                        
                    
                        TextField("رقم الجوال", text: self.$phoneNo2)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                           // .keyboardType(.numberPad)
                            .multilineTextAlignment(TextAlignment.trailing)
                            .onChange(of: self.phoneNo2, perform: {newValue in self.phoneNoErr2 = VM.validatePhoneNo(phone: self.phoneNo2)})
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.phoneNoErr2 != "" {
                        Text(self.phoneNoErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                // 3-
                VStack{
                    
                    HStack(spacing: 15){
                        
                        
                        TextField("البريد الإلكتروني", text: self.$email2)
                            .disableAutocorrection(true)
                            .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            
                            .keyboardType(.emailAddress)
                            .onChange(of: self.email2, perform: { newValue in
                                self.emailErr2 = VM.validateEmail(email: self.email2)
                                
                                // check if the user already use this email from th DB
                                VM = SignUpVM(email: self.email2)
                                VM.isEmailExisted(handler: { status, msg in
                                    if !status {// !
                                        self.emailErr2 = "*البريد الالكتروني مسجل مسبقا"
                                    } else {
                                        self.emailErr2 = ""
                                    }
                                })// END check
                                
                            })
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Kcolor"))

                    }
                    
                    Divider().background(Color("Kcolor").opacity(0.5))
                    if self.emailErr2 != "" {
                        Text(self.emailErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                /* 4- PASS FIELD*/
                VStack{
                SecureInputView2("كلمة المرور", text: $pass2).onChange(of: self.pass2, perform: {newValue in self.passErr2 = VM.validatePass(pass: self.pass2)})
                    
                    if self.passErr2 != "" {
                        Text(self.passErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                    }
                
                }
         .padding(.horizontal)
         .padding(.top,30)

                /* 5- CONFIRM PASS FIELD*/
                VStack{
                SecureInputView2("تأكيد كلمة المرور", text: $repass2)
                        .onChange(of: self.repass2, perform: { newValue in
                            self.repassErr2 = VM.validateRepass(pass: self.pass2, repass: self.repass2)
                        })
                    
                    if self.repassErr2 != "" {
                        Text(self.repassErr2)
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                    }
                    
                }
                // bottom padding...
                .padding(.horizontal)
                 .padding(.top,30)
                /* empty Space to be equal to the first form hieght*/
                VStack{
              
                
                }
         .padding(.horizontal)
         .padding(.top,50)
                
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("KGray"))
            .clipShape(CShape1())
            // clipping the content shape also for tap gesture...
            .contentShape(CShape1())
            // shadow...
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 1
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            // Button...
            
            Button(action: {
                if username2 == "" || phoneNo2 == "" || email2 == "" || pass2 == "" || repass2 == "" {
                    allEmptyErr2 = "جميع الحقول مطلوبة"
                }
             //   else{
                    allEmptyErr2 = ""
                self.showNextPage = true
                    showAlert.toggle()
                    S_SignUp() // Submit as Speech-impaired
                    //TO NAVIGATE TO SIGN IN PAGE after sign up
                    
                
          //  }
                
            }) {
                VStack{
                if self.allEmptyErr2 != "" {
                    Text(self.allEmptyErr2)
                        .foregroundColor(.red)
                        .font(.system(size: 13))

                }
                Text("تسجيل")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Kcolor"))
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            // moving view down..
            .offset(y: 25)
            // hiding view when its in background...
            // only button...
            .opacity(self.index == 1 ? 1 : 0)
       
           // Text(alertAction == .ok ? "ok Clikced" : alertAction == .cancel ? "Cancel Clicked" : "")
        } // end of firt ZStack
        
// TO SHOW ALERT ####################
        if showAlert {
           // CustomAlert(shown: $showAlert, closureA: $alertAction, oneBtn: true,imgName: "check",title: "تهانينا!", message: "تم تسجيلك بنجاح", btn1: "حسنا", btn2: "", showNextPage2: $showNextPage)
            
        }
    }
}
// END ALL TABS


 // Supportive or SUB structs, called in the above tabs
struct SecureInputView2: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
       // VStack{
        HStack(spacing: 15)  {
            if isSecured {
                SecureField(title, text: $text).autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
            } else {
                TextField(title, text: $text)
                    .disableAutocorrection(true)
                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)

                   
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Color("Kcolor"))
            }
        }
            Divider().background(Color("Kcolor").opacity(0.5))
}
}

// Curve...

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            // right side curve...
            
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}


struct CShape1 : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            // left side curve...
            
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}
