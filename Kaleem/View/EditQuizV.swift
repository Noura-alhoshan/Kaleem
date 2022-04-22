//
//  FreshForm.swift
//  Kaleem
//
//  Created by Sarah S on 25/07/1443 AH.
//

import SwiftUI
import Combine
import FirebaseStorage
import Firebase

struct EditAccQuizForm: View {
    
    // confirmation alert vars
    @State var alertAction: AlertAction?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var showingImagePicker = false
    @State private var showEditAlert = false
    @State private var goToListAfterDelete = false
    @State private var goBack = false
    @State private var isError = false
    @State private var isDifferent = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State var selection: String = ""
    
    @State var quizColl: String
    
    @State var QID: String//the id to use in the database
    @State var Question: String
    @State var ImageQuestion: String
    @State var CorrectAnswer: String
    
    @State var answer1: String
    @State var answer2: String
    @State var answer3: String
    @State var answer4: String
    
    let questionTextLimit = 30
    let answerTextLimit = 20
    
  //the following functions limits the fields characters
    func limitQuestion(_ upper: Int ) {
           if Question.count > upper {
               Question = String(Question.prefix(upper))
           }
       }
    
    func limitAnswer1(_ upper: Int ) {
           if answer1.count > upper {
               answer1 = String(answer1.prefix(upper))
           }
       }
    
    func limitAnswer2(_ upper: Int ) {
           if answer2.count > upper {
               answer2 = String(answer2.prefix(upper))
           }
       }
    
    func limitAnswer3(_ upper: Int ) {
           if answer3.count > upper {
               answer3 = String(answer3.prefix(upper))
           }
       }
    
    func limitAnswer4(_ upper: Int ) {
           if answer4.count > upper {
               answer4 = String(answer4.prefix(upper))
           }
       }
    
    
    //load pic to the page
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    
    
    
    
    //validate all fields the call another func to send the quiz info
    func UpdateQuestion(){
        
        
            
        if ( Question == "" || CorrectAnswer == "" || answer1 == "" || answer2 == "" || answer3 == "" || answer4 == "" ){
            isError = true
            
            
        }
      //to make sure the answer matches one of the choices in Picker
        else if (CorrectAnswer != answer1 && CorrectAnswer != answer2 && CorrectAnswer != answer3 && CorrectAnswer != answer4){
        isDifferent = true}
        
        else{
            isError = false
            isDifferent = false
            sendQuestion()
            
        }
    
    
    }
    
    
    
    
    //add question to database
    func sendQuestion(){
        if (inputImage == nil ){
            Firestore.firestore().collection(quizColl).document(self.QID).setData(["question":self.ImageQuestion,
                                                                                  "answer1": answer1,
                                                                                  "answer2":answer2,
                                                                                  "answer3": answer3,
                                                                                  "answer4": answer4,
                                                                                  "correctAnswer": CorrectAnswer,
                                                                                  "questionText": Question])
            showEditAlert = true
        }
        
        else{
        
        if let imageData = inputImage!.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            let storageRef = storage.reference().child("\(UUID().uuidString).jpg")
            storageRef.putData(imageData, metadata: nil){
                (ref, err) in
                if let err = err {
                    print("an error has occurred - \(err.localizedDescription)")
                    
                } else {
                    storageRef.downloadURL(completion: { (url, error) in
                        print("Image URL: \((url?.absoluteString)!)")
                        Firestore.firestore().collection(quizColl).document(self.QID).setData(["question":(url?.absoluteString)!,
                                                                                              "answer1": answer1,
                                                                                              "answer2":answer2,
                                                                                              "answer3": answer3,
                                                                                              "answer4": answer4,
                                                                                              "correctAnswer": CorrectAnswer,
                                                                                              "questionText": Question])
                    })
                    print("image uploaded successfully")
                    showEditAlert = true
                }
                
            }
        } else {
            print("coldn't unwrap/case image to data")
        }
            
        }//big else
        
    }//end of method
    

    
    
    var body: some View {
      
        ScrollView{

            HStack{
                Spacer()
                Button(action: {
                                    
                                    withAnimation(.easeInOut){
                                        self.mode.wrappedValue.dismiss()
                                    }
                                }, label: {
                                    Image(systemName: "chevron.right")
                                         .foregroundColor(.white)
                                         .padding(.vertical,10)
                                         .padding(.horizontal)
                                        // .background(Color.black.opacity(0.4))
                                         .background(Color("Color"))
                                         .cornerRadius(10)
                                 
                                }).padding(.horizontal,25)
            }
            
            VStack {
                
                ZStack {
                    
                    AsyncImage(url: URL(string: self.ImageQuestion), scale: 4.0).frame(width: 330, height: 180 )
                    
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray.opacity(0.3))
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                        .padding(.trailing, 240)///////////////////////////////////////////////////////////////////////////////////// control the position + the line below
                        .padding(.top, 135)
                    
                    
                    image?
                        .resizable()
                        .frame(width: 310, height: 280)
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
               
                
                Spacer(minLength: 25)
                
                TextField("السؤال", text: self.$Question)
                    .onReceive(Just(Question)) { _ in limitQuestion(questionTextLimit) }
                    .disableAutocorrection(true)
                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                    .padding(.all)
                    .background(Color.gray.opacity(0.1))//Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0) )
                    .cornerRadius(15)
                    .padding(.horizontal,20)
                
                Divider().background(Color("Kcolor").opacity(0.8))
                    .padding(.horizontal,20)
                    .padding(.vertical)
                    
                
              
                
                VStack{
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("الخيار الأول", text: self.$answer1
                            )  .onReceive(Just(answer1)) { _ in limitAnswer1(answerTextLimit) }
                                .disableAutocorrection(true)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            
                        }
                        Divider().background(Color("Kcolor").opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                    
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("الخيار الثاني", text: self.$answer2
                            )  .onReceive(Just(answer2)) { _ in limitAnswer2(answerTextLimit) }
                                .disableAutocorrection(true)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            
                        }
                        Divider().background(Color("Kcolor").opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                    
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("الخيار الثالث", text: self.$answer3
                            ).onReceive(Just(answer3)) { _ in limitAnswer3(answerTextLimit) }
                                .disableAutocorrection(true)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                            
                        }
                        Divider().background(Color("Kcolor").opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                    
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("الخيار الرابع", text: self.$answer4
                            )   .onReceive(Just(answer4)) { _ in limitAnswer4(answerTextLimit) }
                                .disableAutocorrection(true)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                
                        }
                        Divider().background(Color("Kcolor").opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top,20)
                    
                    Spacer(minLength: 30)
                    
                    HStack(spacing: 15){
                      
                        VStack {
                            Picker(selection: $CorrectAnswer, label: Text("Select") ) {//update 3/8 : changed from $selection to
                                Text(answer1).tag(answer1)
                                Text(answer2).tag(answer2)
                                Text(answer3).tag(answer3)
                                Text(answer4).tag(answer4)
                                
                            } .padding()
                                
                                .frame(width: 180, height: 50)
                                .background( Color .green.opacity(0.1))
                                .cornerRadius(10)
                                .onReceive(Just(CorrectAnswer)) {
//                                    if (selection == ""){///////////////////////////////////////////////// NEW
//                                        selection = CorrectAnswer
//                                    }
                                   // CorrectAnswer = selection
                                    print("Selected: \($0)")
                                }
                                .onAppear(perform: {
                                    //$selection =

                                })
                        }
                        
                        Text("الإجابة:")
                    } //hstack
                    .padding(.horizontal)
                    
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor( .black.opacity(0.5))
                   // .background( Color .green.opacity(0.1))
                    .cornerRadius(10)
                    
                    //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                    
                }  /*CONTAINER*/
                .padding()
                .padding(.bottom, 5)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,20)
                

                if (isDifferent){
                    Text("الرجاء التأكد من مطابقة الإجابة لأحد الخيارات ")
                    //.offset(y: -10)
                        .foregroundColor(.red).padding(.top,13)

                }
                else
                if (isError) {
                    
                    Text("جميع الحقول مطلوبة")
                    //.offset(y: -10)
                        .foregroundColor(.red).padding(.top,13)
                }
                else {
                    Text(" ").foregroundColor(.red).padding(.top,13)
                }
                HStack{
                
//                    Button(action: {
//                        showDeleteAlert = true
//                    }, label: {
//                        Text("حذف")
//                            .foregroundColor(Color.white)
//                            .fontWeight(.bold)
//                            .padding(.vertical)
//                            .padding(.horizontal,50)
//                            .background(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
//                            .clipShape(Capsule())
//                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
//                    })
//                        .alert("هل أنت متأكد من حذف السؤال؟", isPresented: $showDeleteAlert, actions: {
//                              Button("نعم", action: {
//                                  deleteQuestion()
//                              })
//                              Button("لا", role: .cancel, action: {})
//                            })
//                        .alert(isPresented: $showSuccesfulDeleteAlert) {
//
//                        Alert(
//                            title: Text("تمت العملية بنجاح"),
//                            message: Text("تم حذف السؤال من اختبار القبول"),
//                            dismissButton: .default(
//                                            Text("إغلاق"),
//                                            action: { goToListAfterDelete = true })
//                        )
//                        }
                    
                    
                Button(action: {
                    UpdateQuestion()
                    print (CorrectAnswer)
                }, label: {
                    Text("حفظ")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal,50)
                        .background(Color("Kcolor"))
                        .clipShape(Capsule())
                        .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                })
                    .alert(isPresented: $showEditAlert) {

                    Alert(
                        title: Text("تمت العملية بنجاح"),
                        message: Text("تم تعديل معلومات السؤال"),
                        dismissButton: .default(
                                        Text("إغلاق"),
                                        action: { self.mode.wrappedValue.dismiss() })
                    )
                    }
                    //.padding(.bottom, 10)
      
                    
                }
                // TO SHOW ALERT ####################
                        
            }//big vstack
            .padding([.horizontal, .bottom])
            
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)}
            
            .onChange(of: inputImage) { _ in loadImage() }
            
            
            
          
        }//scroller
           
        .navigationBarTitle("")
        .navigationBarHidden(true)
       
    }//view body
    
    
}//struct



//struct AlertBody: View {
//    @State var alertAction: AlertAction?
//    @State private var showAlert = true
//
//    var body: some View {
//
//       Text("")
//        CustomAlert(shown: $showAlert, closureA: $alertAction, oneBtn: true,imgName: "check",title: "تهانينا!", message: "تم تسجيلك بنجاح", btn1: "تأكيد", btn2: "إلغاء").padding(.top, 50).padding(.vertical)
//            .navigationBarTitle("")
//            .navigationBarHidden(true)
//
//    }
//
//}
