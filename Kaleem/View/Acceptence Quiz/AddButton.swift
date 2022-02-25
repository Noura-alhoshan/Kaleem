//
//  AddButton.swift
//  Kaleem
//
//  Created by Sarah S on 24/07/1443 AH.
//


import SwiftUI

struct FloatingMenu: View {
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    @State var showAddQestion: Bool = false
    
    var body: some View {
        
       // NavigationLink(destination: AddQuizForm(SelectedQuestion: SelectedQuestion).environmentObject(AQuizManagerVM()), isActive: $showAddQestion, label: {EmptyView()} )
        
        VStack {
//            Spacer()
//            if showMenuItem1 {
//                MenuItem(icon: "camera.fill")
//            }
//            if showMenuItem2 {
//                MenuItem(icon: "photo.on.rectangle")
//            }
//            if showMenuItem3 {
//                MenuItem(icon: "square.and.arrow.up.fill")
//            }
         
        }
    }
    
    func showMenu() {
        withAnimation {
            self.showMenuItem3.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            withAnimation {
                self.showMenuItem2.toggle()
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            withAnimation {
                self.showMenuItem1.toggle()
            }
        })
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu()
    }
}

struct MenuItem: View {
    
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                .frame(width: 55, height: 55)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }
        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
        .transition(.move(edge: .trailing))
    }
}
