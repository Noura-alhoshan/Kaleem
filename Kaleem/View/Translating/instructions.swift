//
//  instructions.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 29/09/1443 AH.
//

import Foundation
import SwiftUI

struct instructions: View {
    
    var body: some View {
        VStack{
  
        Spacer(minLength: 10)
        Text("تعليمات ما قبل الترجمة")
            .bold()
            .font(.system(size: 25))
        Spacer(minLength: 10)
    
            Text("١. الرجاء التمّهل عند القيام بالإيماء")
                .multilineTextAlignment(.trailing)
            Spacer(minLength: 10)
            Text("٢. يجب أن يكون الرأس واليدين كاملتين بالمرفق ضمن إيطار الالتقاط")
                .multilineTextAlignment(.trailing)
            Spacer(minLength: 10)
            Text("٣. يجب أخذ موضع تصوير ثابت")
            Spacer(minLength: 10)
            Text("٤. بالضغط على أيقونة*ابدأ بالالتقاط* ستنفتح الكاميرا الأمامية مباشرة")
                .lineLimit(3)
                .multilineTextAlignment(.trailing)
    
        }
}
}
