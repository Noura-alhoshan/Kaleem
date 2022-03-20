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

struct AddQuizForm: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var showingImagePicker = false
    @State private var showAlert = false
    @State private var isError = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State var selection: String = ""
    @State var Question: String = ""
    @State var CorrectAnswer: String = ""
    @State var answer1: String = ""
    @State var answer2: String = ""
    @State var answer3: String = ""
    @State var answer4: String = ""
    
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
    func addQuestion(){
        if (inputImage == nil || Question == "" || CorrectAnswer == "" || answer1 == "" || answer2 == "" || answer3 == "" || answer4 == "" ){
            isError = true
        }
        
        else{
            isError = false
            sendQuestion(image: inputImage!)
            
        }
    }
    
    
    
    
    //add question to database
    func sendQuestion(image:UIImage){
        if let imageData = image.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            let storageRef = storage.reference().child("\(UUID().uuidString).jpg")
            storageRef.putData(imageData, metadata: nil){
                (ref, err) in
                if let err = err {
                    print("an error has occurred - \(err.localizedDescription)")
                    
                } else {
                    storageRef.downloadURL(completion: { (url, error) in
                        print("Image URL: \((url?.absoluteString)!)")
                        Firestore.firestore().collection("AcceptanceQuiz").addDocument(data: ["question":(url?.absoluteString)!,
                                                                                              "answer1": answer1,
                                                                                              "answer2":answer2,
                                                                                              "answer3": answer3,
                                                                                              "answer4": answer4,
                                                                                              "correctAnswer": CorrectAnswer,
                                                                                              "questionText": Question])
                    })
                    print("image uploaded successfully")
                    showAlert = true
                }
                
            }
        } else {
            print("coldn't unwrap/case image to data")
        }
    }//end of method
    
    
    
    var body: some View {
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
        ScrollView{
           
            
            VStack {
                
                
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                        .frame(width: 310, height: 280)
                        .foregroundColor(.gray.opacity(0.2))
                        .padding(.bottom, 20)
                        .cornerRadius(5)
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray.opacity(0.3))
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                        .padding(.bottom, 30)
                    
                    
                    
                    image?
                        .resizable()
                        .frame(width: 310, height: 280)
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                
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
                            Picker("الإجابة", selection: $selection ) {
                                // Text("hey").tag("answer1")
                                Text(answer1).tag(answer1)
                                Text(answer2).tag(answer2)
                                Text(answer3).tag(answer3)
                                Text(answer4).tag(answer4)
                                
                            } .padding()
                                
                                .frame(width: 180, height: 50)
                                .background( Color .green.opacity(0.1))
                                .cornerRadius(10)
                                .onReceive(Just(selection)) {
                                    CorrectAnswer = selection
                                    print("Selected: \($0)")
                                }
                        }
                        
                        Text("الإجابة:")
                    } //hstack
                    .padding(.horizontal)
                    
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor( .black.opacity(0.5))
                   // .background( Color .green.opacity(0.1))
                    .cornerRadius(10)
                    
                    //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                    
                }
//                /CONTAINER/
                .padding()
                .padding(.bottom, 5)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,20)
                

                
                if (isError) {
                    Text("جميع الحقول مطلوبة")
                    //.offset(y: -10)
                        .foregroundColor(.red).padding(.top,13)
                }
                else {
                    Text(" ").foregroundColor(.red).padding(.top,13)
                }
                
                Button(action: {
                    addQuestion()
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
                }).alert(isPresented: $showAlert) {
                    
                    Alert(
                        title: Text("تمت العملية بنجاح"),
                        message: Text("تم إضافة السؤال إلى اختبار القبول"),
                        dismissButton: .default(
                                        Text("إغلاق"),
                                        action: { self.mode.wrappedValue.dismiss() })
                    )
                    } .padding(.bottom, 10)
                
                
                
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


struct AddQuizForm_Previews: PreviewProvider {
    static var previews: some View {
        AddQuizForm()
    }
}
