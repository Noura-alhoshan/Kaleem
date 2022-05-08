//
//
//import Foundation
//import SwiftUI
//import Firebase
//
//struct FavoriteListV: View {
//    @ObservedObject private var viewModel = SentencesVM()
//    @State var backToHome: Bool = false
//    @StateObject var speaker: Speaker = Speaker()
////    @State var OneFavSentence: FavSentence
////    @State private var showDeleteAlert = false
////    @State private var showSuccesfulDeleteAlert = false
//    
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
////
////    func deleteFav(){
////        Firestore.firestore().collection(quizCollec).document(self.SelectedQuestion.Qid).delete(){ err in
////            if let err = err {//cloud deletion error
////                print("Error removing document: \(err)")
////            }
////            else {
////                print("Document successfully removed!")
////                showSuccesfulDeleteAlert = true
////
////            }
////
////        }
////    }
//    
//    var body: some View {
//        
//        
//        VStack{
//            Text("المفضلة")
//                .foregroundColor(.black.opacity(0.7))
//                .font(.title)
//                .fontWeight(.bold)
//                .padding(.horizontal,22)
//                .padding(.top,12)
//            
//            List (viewModel.FavList) { v in
//                
//                
//                
//                HStack{
//                    HStack{
//                        
//                        
//                        Button( action: {
//                     
//                            viewModel.deleteFavSen(id: v.id)
//                            
//                        } , label: {
//                            
//                     
//                                Image(systemName:"trash").font(.system (size: 25, weight: .semibold))
//                                    .foregroundColor(Color("Color"))
//                
//                   
//                        })
//                        
//                        
//                        Button( action: {
//                            speaker.speak(v.Sentence)//speaking action
//                      
//                            
//                        } , label: {
//                            
//                            if (speaker.isSpeaking) {
//                                Image(systemName:"speaker.fill").font(.system (size: 25, weight: .semibold))
//                                    .foregroundColor(Color("Color"))
//                            }
//                            else{
//                                Image(systemName:"speaker").font(.system (size: 25, weight: .semibold))
//                                    .foregroundColor(Color("Color"))
//                              
//                            }
//                   
//                        })
//                     
//   
//                    }
//                    
//                    VStack(alignment: .trailing){
//                        HStack{
//                            Text(v.Sentence)
//                                .font(.title3)
//                            Spacer()
//                            
//                        }.frame( width:200,height: 80)
//                    }.padding(.leading,100)
//                    
//                    
//                }
//                
//                
//                //      ZStack(alignment: .trailing) {
//                
//                
//                
//                
//                
//                
//                // }
//                
//            }.onAppear(perform: {      self.viewModel.FavFetchData()})
//      
//                
//                .navigationBarTitle("")
//                .navigationBarHidden(true)
//            
//            
//        }.navigationBarTitle("")
//            .navigationBarHidden(true)
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//
////
////func deleteQuestion(){
////    Firestore.firestore().collection("FavoriteList").document(self.OneFavSentence.id).delete(){ err in
////        if let err = err {//cloud deletion error
////            print("Error removing document: \(err)")
////        }
////        else {
////            print("Document successfully removed!")
////            showSuccesfulDeleteAlert = true
////
////        }
////
////    }
////}
////
////    init(){
////        viewModel.FavFetchData()
////    }
//
//    
// 
//}
//
//struct FavoriteList: PreviewProvider{
//    static var previews: some View{
//        FavoriteListV()
//    }
//}
//
//
