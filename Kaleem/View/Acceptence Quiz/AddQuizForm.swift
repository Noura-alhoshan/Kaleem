//
//  testListV.swift
//  Kaleem
//
//  Created by Sarah S on 23/07/1443 AH.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct AddQuizForm: View {
    @EnvironmentObject var quizManager1: AQuizManagerVM
   // @State var SelectedQuestion: QuestionModel
    
    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var inputImage: UIImage?
    //@State private var stringph = "false"
    @State var Question: String = ""
    @State var CorrectAnswer: String = ""
    @State var answer1: String = ""
    @State var answer2: String = ""
    @State var answer3: String = ""
    @State var answer4: String = ""
    @State var isCorrect1 = false
    @State var isCorrect2 = false
    @State var isCorrect3 = false
    @State var isCorrect4 = false
    @State var numOfChecked = 0
    
    
   // @State private var checked: [Bool] = [self.isCorrect1, isCorrect2, isCorrect3]
    func checkAnswers() {
        let checked = [self.isCorrect1, self.isCorrect2, self.isCorrect3,self.isCorrect4]
        
        for index in 0...3 {
            if (checked[index] ) {
                numOfChecked += 1
                //print (numOfChecked)
        }
        }//for
        
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func uploadImage(image:UIImage){
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
                        Firestore.firestore().collection("AcceptanceQuiz").addDocument(data: ["username":(url?.absoluteString)!])
                    })
                    print("image uploaded successfully")
                    //stringph = (ref?.path)!
                    //Firestore.firestore().collection("AcceptanceQuiz").addDocument(data: ["username":stringph])
                    }
                
            }
        } else {
            print("coldn't unwrap/case image to data")
        }
    }//end of method

    
    
    func addto(){
       // Firestore.firestore().collection("AcceptanceQuiz").addDocument(data: ["username":inputImage]) { error in
       // uploadImage(image: inputImage!)
            // Check for errors
            //if error == nil {
                // No errors
           // }
           // else {
                // Handle the error
            //}
       // }
    }
    
    var body: some View {
        VStack(spacing: 30) {
                
            VStack( spacing: 19) {

                NavigationView {
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(.secondary)
                                .frame(width: 298, height: 360)
                                .foregroundColor(.gray.opacity(0.3))

                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.gray.opacity(0.4))
                                .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                                .padding(.bottom, 80)

                            image?
                                .resizable()
                               // .frame(width: 298, height: 320)
                                .scaledToFit()
                        }
                        .onTapGesture {
                            showingImagePicker = true
                        }
                        }
                    }
                   // .padding([.horizontal, .bottom])
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: $inputImage)
                    }
                   // .navigationTitle("Instafilter")
                    .onChange(of: inputImage) { _ in loadImage() }
                }

                
            VStack{
                HStack  {
                    TextField("السؤال", text: self.$Question
                    )
                        .disableAutocorrection(true)
                        .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                       // .background(.gray.opacity(0.1))
                        .textFieldStyle(.roundedBorder)
                        .shadow(color: .gray, radius: 3, x: 0.2, y: 0.2)
                    
                }
                //Divider().background(Color("Kcolor").opacity(0.5))
            }
            
            .padding(.horizontal)
            
            Divider().background(Color("Kcolor").opacity(0.8))
            
            
            
                    HStack(spacing: 3) {
                        HStack(spacing: 3)  {
                            TextField("الخيار الأول", text: self.$answer1
                            )
                                .disableAutocorrection(true)
                                .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                                //.background(isCorrect1 ? .green : .gray.opacity(0.1))
                                .textFieldStyle(.roundedBorder)
                        }
             
                    .padding(.horizontal)
                       // CheckBoxView(checked: $isCorrect1)
                        
                        
                    }
                   // .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor( .black.opacity(0.5))
                    . background(isCorrect1 ? Color("Kaleem").opacity(0.2) : .gray.opacity(0.1))
                    .cornerRadius(10)
                    //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
           
            HStack(spacing: 3) {
                HStack(spacing: 3)  {
                    TextField("الخيار الثاني", text: self.$answer2
                    )
                        .disableAutocorrection(true)
                        .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                       // .background(.gray.opacity(0.1))
                        .textFieldStyle(.roundedBorder)
                }
     
            .padding(.horizontal)
               // CheckBoxView(checked: $isCorrect2)
                
                
            }
           // .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundColor( .black.opacity(0.5))
            //.background(SelectedQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
            .cornerRadius(10)
            //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
            
            
            HStack(spacing: 3) {
                HStack(spacing: 3)  {
                    TextField("الخيار الثالث", text: self.$answer3
                    )
                        .disableAutocorrection(true)
                        .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                       // .background(.gray.opacity(0.1))
                        .textFieldStyle(.roundedBorder)
                }
     
            .padding(.horizontal)
                //CheckBoxView(checked: $isCorrect2)
                
                
            }
           // .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundColor( .black.opacity(0.5))
            //.background(SelectedQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
            .cornerRadius(10)
            //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)

            
            HStack(spacing: 3) {
                HStack(spacing: 3)  {
                    TextField("الخيار الرابع", text: self.$answer4
                    )
                        .disableAutocorrection(true)
                        .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                       // .background(.gray.opacity(0.1))
                        .textFieldStyle(.roundedBorder)
                }
     
            .padding(.horizontal)
                //CheckBoxView(checked: $isCorrect2)
                
                
            }
           // .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundColor( .black.opacity(0.5))
            //.background(SelectedQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
            .cornerRadius(10)
            //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
            
            
            
            Button(action: {
                addto()
                checkAnswers()
                print (numOfChecked)
                //AddAccQuizV()
               // showAccQuiz = true
            }, label: {
                Text("حفظ")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.black)
                    .cornerRadius(35.0)
            })
            

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(.white)
       //.navigationBarHidden(true)
    }
}




struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color("Kaleem") : Color.secondary)
            .frame(width: 60, height: 60 )
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}







//
//        let storageRef = Storage.storage().reference().child("lock.png")
//        let compressedImage = inputImage! //image.jpegData(compressionQuality: 1)
//        if let uploadData = compressedImage.pngData(){
//        storageRef.putData(uploadData, metadata: nil
//        , completion: { (metadata, error) in
//        //self.hideActivityIndicator(view: self.view)
//        if error != nil {
//        //self.writeDatabaseCustomer()
//        print("error")
//        return}
//        else{
//        storageRef.downloadURL(completion: { (url, error) in
//        print("Image URL: \((url?.absoluteString)!)")
//            Firestore.firestore().collection("AcceptanceQuiz").addDocument(data: ["username":(url?.absoluteString)!])
//
      //
    //    })}})
    //    }

    
    
    
    
    
    
