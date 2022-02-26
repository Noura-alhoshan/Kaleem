//
//  FreshForm.swift
//  Kaleem
//
//  Created by Sarah S on 25/07/1443 AH.
//

import SwiftUI
import Combine

struct FreshForm: View {
    
    
    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State var Question: String = ""
    @State var selection: String = ""
    @State var CorrectAnswer: String = ""
    @State var answer1: String = ""
    @State var answer2: String = ""
    @State var answer3: String = ""
    @State var answer4: String = ""
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    
    var body: some View {
        
        ScrollView{
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                        .frame(width: 310, height: 280)
                        .foregroundColor(.gray.opacity(0.2))
                        .padding(.bottom, 20)
                    
                    
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
                    .disableAutocorrection(true)
                    .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                    .padding(.all)
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0) )
                
                
                Divider().background(Color("Kcolor").opacity(0.8))
                
                    .padding(.vertical)
                
                VStack{
                    VStack{
                        HStack(spacing: 15)  {
                            TextField("الخيار الأول", text: self.$answer1
                            )
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
                            )
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
                            )
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
                            )
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
                        Picker("الإجابة الصحيحة", selection: $selection ) {
                           // Text("hey").tag("answer1")
                                    Text(answer1).tag(answer1)
                                    Text(answer2).tag(answer2)
                                    Text(answer3).tag(answer3)
                                    Text(answer4).tag(answer4)
                                    
                        } .padding()
                            .frame(width: 130, height: 50)
                            //.padding(.horizontal,30)
                            .onReceive(Just(selection)) {
                            CorrectAnswer = selection
                            print("Selected: \($0)")
                        }
                            }
                        
                        Text("الإجابة الصحيحة:")
                } //hstack
                    .padding(.horizontal)
                       
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor( .black.opacity(0.5))
                        .background( Color .green.opacity(0.1))
                        .cornerRadius(10)
                        
                        //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                    
                }  /*CONTAINER*/
                .padding()
                .padding(.bottom, 5)
                /*WITHIT OR WITHOUT IT?*/
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,20)
                
                
                Button(action: {
                    // addto()
                    // checkAnswers()
                     print (CorrectAnswer)
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
                }) .padding(.top, 10)
                
                
                
            }//big vstack
            .padding([.horizontal, .bottom])
            
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)}
            
            .onChange(of: inputImage) { _ in loadImage() }
            
        }//scroller
        
        
    }//view body
    
}//struct


struct FreshForm_Previews: PreviewProvider {
    static var previews: some View {
        FreshForm()
    }
}



/*
 NavigationView {
 VStack {
 ZStack {
 Rectangle()
 .fill(.secondary)
 
 Text("Tap to select a picture")
 .foregroundColor(.white)
 .font(.headline)
 
 image?
 .resizable()
 .scaledToFit()
 }
 .onTapGesture {
 // select an image
 }
 
 HStack {
 Text("Intensity")
 Slider(value: $filterIntensity)
 }
 .padding(.vertical)
 
 HStack {
 Button("Change Filter") {
 // change filter
 }
 
 Spacer()
 
 Button("Save") {
 // save the picture
 }
 }
 }
 .padding([.horizontal, .bottom])
 .navigationTitle("Instafilter")
 }
 
 ///////////////////////////////////////////////////////////////////////
 
 VStack() {
 NavigationView {
 VStack {
 ZStack {
 Rectangle()
 .fill(.secondary)
 .frame(width: 310, height: 300)
 .foregroundColor(.gray.opacity(0.3))
 .padding(.bottom, 80)
 
 Image(systemName: "plus.circle.fill")
 .resizable()
 .frame(width: 70, height: 70)
 .foregroundColor(.gray.opacity(0.4))
 .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
 .padding(.bottom, 50)
 
 image?
 .resizable()
 .frame(width: 298, height: 300)
 .scaledToFit()
 }
 .onTapGesture {
 showingImagePicker = true
 }
 }
 
 }
 // .navigationTitle("Instafilter")
 .onChange(of: inputImage) { _ in loadImage() }
 
 
 VStack(alignment: .trailing) {
 // Text(label)
 //.font(.headline)
 TextField("السؤال", text: self.$Question)
 .disableAutocorrection(true)
 .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
 .padding(.all)
 .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0) )
 }
 .padding(.horizontal)
 
 Divider().background(Color("Kcolor").opacity(0.8))
 
 
 
 VStack{
 
 
 VStack{
 HStack(spacing: 15)  {
 TextField("الخيار الأول", text: self.$answer1
 )
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
 )
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
 )
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
 )
 .disableAutocorrection(true)
 .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
 
 }
 Divider().background(Color("Kcolor").opacity(0.5))
 }
 .padding(.horizontal)
 .padding(.top,20)
 
 
 } // the big one
 /*CONTAINER*/
 .padding()
 .padding(.bottom, 5)
 /*WITHIT OR WITHOUT IT?*/
 .background(Color.gray.opacity(0.1))
 .cornerRadius(15)
 .padding(.horizontal,20)
 
 VStack{
 HStack(spacing: 15)  {
 TextField("الإجابة", text: self.$CorrectAnswer
 )
 .disableAutocorrection(true)
 .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
 
 }
 Divider().background(Color("Kcolor").opacity(0.5))
 }
 .padding(.horizontal)
 .padding(.top,20)
 
 
 Button(action: {
 // addto()
 // checkAnswers()
 // print (numOfChecked)
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
 // .padding([.horizontal, .bottom])
 .sheet(isPresented: $showingImagePicker) {
 ImagePicker(image: $inputImage)
 
 }.padding()
 .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
 .background(.white)
 
 
 
 
 
 
 
 
 
 
 
 
 */
