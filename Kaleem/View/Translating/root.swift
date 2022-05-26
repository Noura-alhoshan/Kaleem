//
//  root.swift
//  VideoCap
//

//

import SwiftUI
import Alamofire

struct root: View {
    @State var videoData:Data?
    @State var url:URL?
    @State var uploadAmount = 0.0
    @State var showUploading = false
    @State var message:String?
    @State var isLoading = false
    @State var progressV:ProgressView = ProgressView()
    @State var isBeforeTranslate = true

    var body: some View {
        VStack{
            if let url = url {
                if uploadAmount != 1{
                    Text(message ?? "").onAppear {
                        
                    }
                }
                Spacer(minLength: 20)
                Text(message ?? "")
            }
         //   if self.isBeforeTranslate{
       
        //        SignToTextV()
   //instructions()
       
            //    .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.3, alignment: .trailing)
        //    }
            Spacer(minLength: 200)
          
            HStack{
           Spacer(minLength: 130)
                if isLoading{
                    LoadingView(isShowing: $isLoading) {
                        Text("")
                    }
                }
                }
            
//            if !self.isLoading{
//               Button("Capture video")
//                {
//                    showModal()
//                }
//                }
            
    
//            Button(action: {
//                isBeforeTranslate = false
//                showModal()
//                videoData = nil
//                url = nil
//                uploadAmount = 0.0
//                showUploading = false
//                message = nil
//               isLoading = false
//
//            }) {
//                Text(" ابدأ الالتـقاط")
//                    .foregroundColor(Color.white)
//                    .fontWeight(.bold)
//                    .padding(.vertical)
//                    .padding(.horizontal,50)
//                    .background(Color("Kcolor"))
//                    .clipShape(Capsule())
//                    .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)            }
//
//            Spacer(minLength: 10)
//        }.onAppear {
//            if let url = self.url{
//                uploadToServer(videoUrl: url)
//            }
//        }
      
        if !self.isLoading {
            Button("ابدأ بالالتقاط") {
                isBeforeTranslate = false
                showModal()
                videoData = nil
                url = nil
                uploadAmount = 0.0
                showUploading = false
                message = nil
               isLoading = false
            }                .frame(width: 200, height:100)
                .foregroundColor(Color("Color"))
        }
        Spacer(minLength: 10)
    }.onAppear {
        if let url = self.url{
            uploadToServer(videoUrl: url)
        }
    }
    
}
    
    func showModal() {
            let window = UIApplication.shared.windows.first
        let vc = UIHostingController(rootView: ContentV(rootView: self))
        vc.modalPresentationStyle = .fullScreen
            window?.rootViewController?.present(vc, animated: true)
        }
    func uploadToServer(videoUrl:URL){
        guard let url = URL.init(string: "http://165.232.90.241/api/store_video") else{
            return
        }
        do {
            
            let videoData = try Data(contentsOf: videoUrl)
            isLoading = true
            AF.upload(multipartFormData: { multiData in
                multiData.append(videoData, withName: "video",fileName: "video.mp4", mimeType: "mp4")
                    
            },to:url,usingThreshold: UInt64.init(),method: .post
            ).uploadProgress{ progress in
                uploadAmount = progress.fractionCompleted
            }
                .validate().response{ response in
                switch response.result{
                case .success(let data):
                    do {
                        let stringResponse = String.init(data: data!, encoding: .utf8)
                        print(stringResponse)
                        let any = try JSONDecoder().decode(personAny.self, from: data!)
                        print(any.code)
                        //message = any.message
                        //isLoading = false
                        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                            getMessage(id: any.data.id)
                        }
                    } catch  let error{
                    
                        message = error.localizedDescription
                        isLoading = false
                    }
                case .failure(let error):
                    
                    message = error.localizedDescription
                    isLoading = false
                    
                }
            }
        } catch _ {
        }
    }
    func getMessage(id:Int){
        guard let url = URL.init(string: "http://165.232.90.241/api/get_video_result") else{
            return
        }
        let paramets:Parameters = ["id":id]
        AF.request(url,method: .post,parameters: paramets).validate().response{response in
            switch response.result{

            case .success(let data):
                do {

                    let response = try JSONDecoder().decode(analyzeResponse.self, from: data!)
                    if response.result == ""{
                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                            getMessage(id: id)
                        }
                        return
                    }
                    message = response.result
                    isLoading = false
                } catch let error {
                    message = error.localizedDescription
                    isLoading = false

                }

            case .failure(let error):
                isLoading = false
                message = error.localizedDescription

            }
        }
    }
}

struct root_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            root()
        }
    }
}

//struct personAny: Codable {
//    let code: Int
//    let success: Bool
//    let message: String
//    let data: [Datum]
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let src, updatedAt,result, createdAt: String
//    let id: Int
//
//    enum CodingKeys: String, CodingKey {
//        case src
//        case updatedAt = "updated_at"
//        case createdAt = "created_at"
//        case id
//        case result
//    }
//}
struct personAny: Codable {
    let code: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let src, result, updatedAt, createdAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case src, result
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}


struct analyzeResponse: Codable {
    let code: Int
    let success: Bool
    let message, result: String
}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                   Text("جاري الترجمة ...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }

}


/*
 //
 //  root.swift
 //  VideoCap
 //
 //  Created by ali  on 18/03/2022.
 //

 import SwiftUI
 import Alamofire

 struct root: View {
     @State var videoData:Data?
     @State var url:URL?
     @State var uploadAmount = 0.0
     @State var showUploading = false
     @State var message:String?
     @State var isLoading = false
     @State var progressV:ProgressView = ProgressView()
     @State var isBeforeTranslate = true
     var body: some View {
         VStack{
             if let url = url {
                 if uploadAmount != 1{
                     Text(message ?? "").onAppear {
                         
                     }
                 }
                 Spacer(minLength: 20)
                 Text(message ?? "")
             }
             if self.isBeforeTranslate{
        
      
    instructions()
        
                 .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.3, alignment: .trailing)
             }
             Spacer(minLength: 200)
             HStack{
                 Spacer(minLength: 130)
                 if isLoading{
                     LoadingView(isShowing: $isLoading) {
                         Text("")
                     }
                 }
             }
             
             Button("ابدأ بالالتقاط") {
                 isBeforeTranslate = false
                 showModal()
                 videoData = nil
                 url = nil
                 uploadAmount = 0.0
                 showUploading = false
                 message = nil
                isLoading = false
             }
             Spacer(minLength: 10)
         }.onAppear {
             if let url = self.url{
                 uploadToServer(videoUrl: url)
             }
         }
       
         
     }
     func showModal() {
             let window = UIApplication.shared.windows.first
         let vc = UIHostingController(rootView: ContentV(rootView: self))
         vc.modalPresentationStyle = .fullScreen
             window?.rootViewController?.present(vc, animated: true)
         }
     func uploadToServer(videoUrl:URL){
         guard let url = URL.init(string: "http://165.232.90.241/api/store_video") else{
             return
         }
         do {
             
             let videoData = try Data(contentsOf: videoUrl)
             isLoading = true
             AF.upload(multipartFormData: { multiData in
                 multiData.append(videoData, withName: "video",fileName: "video.mp4", mimeType: "mp4")
                     
             },to:url,usingThreshold: UInt64.init(),method: .post
             ).uploadProgress{ progress in
                 uploadAmount = progress.fractionCompleted
             }
                 .validate().response{ response in
                 switch response.result{
                 case .success(let data):
                     do {
                         let stringResponse = String.init(data: data!, encoding: .utf8)
                         print(stringResponse)
                         let any = try JSONDecoder().decode(personAny.self, from: data!)
                         print(any.code)
                         //message = any.message
                         //isLoading = false
                         DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                             getMessage(id: any.data.id)
                         }
                     } catch  let error{
                         
                         message = error.localizedDescription
                         isLoading = false
                     }
                 case .failure(let error):
                     
                     message = error.localizedDescription
                     isLoading = false
                     
                 }
             }
         } catch _ {
         }
     }
     func getMessage(id:Int){
         guard let url = URL.init(string: "http://165.232.90.241/api/get_video_result") else{
             return
         }
         let paramets:Parameters = ["id":id]
         AF.request(url,method: .post,parameters: paramets).validate().response{response in
             switch response.result{

             case .success(let data):
                 do {

                     let response = try JSONDecoder().decode(analyzeResponse.self, from: data!)
                     if response.result == ""{
                         DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                             getMessage(id: id)
                         }
                         return
                     }
                     message = response.result
                     isLoading = false
                 } catch let error {
                     message = error.localizedDescription
                     isLoading = false

                 }

             case .failure(let error):
                 isLoading = false
                 message = error.localizedDescription

             }
         }
     }
 }

 struct root_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             root()
         }
     }
 }

 //struct personAny: Codable {
 //    let code: Int
 //    let success: Bool
 //    let message: String
 //    let data: [Datum]
 //}
 //
 //// MARK: - Datum
 //struct Datum: Codable {
 //    let src, updatedAt,result, createdAt: String
 //    let id: Int
 //
 //    enum CodingKeys: String, CodingKey {
 //        case src
 //        case updatedAt = "updated_at"
 //        case createdAt = "created_at"
 //        case id
 //        case result
 //    }
 //}
 struct personAny: Codable {
     let code: Int
     let success: Bool
     let message: String
     let data: DataClass
 }

 // MARK: - DataClass
 struct DataClass: Codable {
     let src, result, updatedAt, createdAt: String
     let id: Int

     enum CodingKeys: String, CodingKey {
         case src, result
         case updatedAt = "updated_at"
         case createdAt = "created_at"
         case id
     }
 }


 struct analyzeResponse: Codable {
     let code: Int
     let success: Bool
     let message, result: String
 }

 struct ActivityIndicator: UIViewRepresentable {

     @Binding var isAnimating: Bool
     let style: UIActivityIndicatorView.Style

     func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
         return UIActivityIndicatorView(style: style)
     }

     func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
         isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
     }
 }
 struct LoadingView<Content>: View where Content: View {

     @Binding var isShowing: Bool
     var content: () -> Content

     var body: some View {
         GeometryReader { geometry in
             ZStack(alignment: .center) {

                 self.content()
                     .disabled(self.isShowing)
                     .blur(radius: self.isShowing ? 3 : 0)

                 VStack {
                    Text("جاري الترجمة ...")
                     ActivityIndicator(isAnimating: .constant(true), style: .large)
                 }
                 .frame(width: geometry.size.width / 2,
                        height: geometry.size.height / 5)
                 .background(Color.secondary.colorInvert())
                 .foregroundColor(Color.primary)
                 .cornerRadius(20)
                 .opacity(self.isShowing ? 1 : 0)

             }
         }
     }

 }

 */
