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
    @State var SelectedQuestion: QuestionModel
    
    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var inputImage: UIImage?
    @State private var stringph = "false"
    
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
        uploadImage(image: inputImage!)
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

                            Text("انقر لإضافة صورة")
                                .foregroundColor(.white)
                                .font(.headline)

                            image?
                                .resizable()
                                .scaledToFit()
                        }
                        .onTapGesture {
                            showingImagePicker = true

                        }
                        }
                    }
                    .padding([.horizontal, .bottom])
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: $inputImage)
                    }
                   // .navigationTitle("Instafilter")
                    .onChange(of: inputImage) { _ in loadImage() }
                }

                
                Text("ماذا تعني هذه الإشارة؟")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)

                ForEach(SelectedQuestion.answers, id: \.id) { answer in
                    HStack(spacing: 20) {

                        Text(answer.text)
                            .bold()

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor( .black.opacity(0.5))
                    .background(SelectedQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                
            }
            
            Button(action: {
                addto()
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

    
    
    
    
    
    
