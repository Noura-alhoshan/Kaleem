
import SwiftUI

struct ListData: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var postType: Array<String>
    var date: String
    var Image: String
    var Color: Color
    var percentage: GLfloat
    var stars: Int
}



var data = [
    ListData(title: "LazyHGrid in SwiftUI (part 1/3)", postType: ["iOS","SwiftUI", "Xcode"], date: "05 Jun", Image: "LazyGrid",Color: Color.lighterPink, percentage: 0.30, stars: 5),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.lighterGray, percentage: 0.25, stars: 4),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "20 Nov", Image: "themeDetector",Color: Color.lightOrange, percentage: 0.10, stars: 3),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "10 Jun", Image: "try1",Color: Color.lightPink, percentage: 0.45, stars: 2),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "05 Feb", Image: "themeDetector",Color: Color.lightGray, percentage: 0.86, stars: 5),
    ListData(title: "LazyHGrid in SwiftUI (part 1/3)", postType: ["iOS","SwiftUI", "Xcode"], date: "15 Dec", Image: "LazyGrid",Color: Color.lightOrange, percentage: 0.30, stars: 3),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.lighterPink, percentage: 0.25, stars: 2),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.lighterGray, percentage: 0.10, stars: 3),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "try1",Color: Color.lightGray, percentage: 0.45, stars: 4),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.lightOrange, percentage: 0.86, stars: 5)
]


struct tags: View {
    var tags: Array<String>
    var body: some View {
        HStack {
        ForEach(tags, id: \.self) { e in
            Text(e)
                .foregroundColor(.pinkColor)
                .font(.system(size: 6))
                .padding(4)
                .overlay(
                   RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.pinkColor, lineWidth: 0.5)
               )
           }
        }
    }
}

//struct SimpleListView: View {
//
//    @State var d = data
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(d, id: \.self) { m in
//                    VStack {
//                        NavigationLink(destination: Text(m.title)) {
//                            HStack{
//                                Image(m.Image)
//                                    .resizable()
//                                    .frame(width: 120, height: 90)
//                                VStack(alignment: .leading, spacing: 8) {
//                                    tags(tags: m.postType)
//                                    Text(m.title)
//                                        .bold()
//                                        .font(.subheadline)
//                                        .lineLimit(1)
//                                    Text("The Happy Programmer")
//                                        .font(.caption2)
//                                        .foregroundColor(Color.gray)
//                                    HStack {
//                                        ProgressView(value: m.percentage)
//                                            .progressViewStyle(LinearProgressViewStyle(tint: Color.pinkColor))
//                                            .foregroundColor(Color.red)
//                                        Text(String(format: "%.0f%%", m.percentage * 100))
//                                            .font(.caption2)
//                                            .foregroundColor(Color.gray)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }.onDelete(perform: self.deleteItem)
//            }.listStyle(SidebarListStyle())
//            .navigationTitle("Posts")
//        }
//    }
    
 //   private func deleteItem(at indexSet: IndexSet) {
     //   self.d.remove(atOffsets: indexSet)
   // }
//}


//struct GroupedListFooter: View {
//    var body: some View {
//        HStack {
//            Image(systemName: "creditcard")
//            Text("Please support me on Patreon")
//        }
//    }
//}
//
//struct GroupedListHeader: View {
//    var body: some View {
//        HStack {
//            Image(systemName: "tray.full.fill")
//            Text("All Posts from The Happy programmer")
//        }
//    }
//}

// Blurry back ground Cards --------------------------------------


//blurrybackground



struct blurTags:  View {
    
    var tags: Array<String>
    let namespace: Namespace.ID
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                Text("\(tag)")
                    .fontWeight(.semibold)
                    .foregroundColor(.subtextColor)
                    .font(.caption)
                    
            }
        }.matchedGeometryEffect(id: "tags", in: namespace)
    }
}

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
}

struct Stars: View {
    
    var star: Int
    
    var body: some View {
        HStack(spacing: 5) {
            
            ForEach(1...star, id: \.self) { e in
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                    .font(.caption)
                }
            if star < 5 {
                
                let e = 5 - star
                ForEach(1...e, id: \.self) { e in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                }
            }
        }
    }
}
//**************************************************************************************    HERE
struct smallcardView: View {
    
    var p: ListData
    let namespace: Namespace.ID
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .leading) {
                HStack {
                  
                    
                    VStack(alignment: .leading) {
                        blurTags(tags: p.postType, namespace: namespace)
                        Spacer()
                        Text(p.title)
                            .foregroundColor(Color.textColor)
                            .matchedGeometryEffect(id: "title", in: namespace)
                        Spacer()
                        HStack {
                            Stars(star: p.stars)
                                .matchedGeometryEffect(id: "stars", in: namespace)
                            Text("(100)")
                                .font(.caption2)
                                .foregroundColor(.subtextColor)
                                .matchedGeometryEffect(id: "ratingNum", in: namespace)
                        }
                    }.padding(.leading)
                    Spacer()
                    VStack {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color.white)
                            .matchedGeometryEffect(id: "ellipsis", in: namespace)
                        Spacer()
                    }
                    
                    Image(p.Image)
                        .resizable()
                        .frame(width: 120, height: 90)
                        .cornerRadius(10)
                        .matchedGeometryEffect(id: "image", in: namespace)
                    
                }
            }
        }
    }
}

struct bigcardView: View {
    var p: ListData
    let namespace: Namespace.ID
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Image(p.Image)
                    .resizable()
                    .frame(height: 160)
                    .frame(maxHeight: .infinity)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "image", in: namespace)
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        blurTags(tags: p.postType, namespace: namespace)
                        Spacer()
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color.white)
                            .matchedGeometryEffect(id: "ellipsis", in: namespace)
                    }
                    
                    Spacer()
                    Text(p.title)
                        .foregroundColor(Color.textColor)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    Spacer()
                    HStack {
                        Stars(star: p.stars)
                            .matchedGeometryEffect(id: "stars", in: namespace)
                        Text("(100)")
                            .font(.caption2)
                            .foregroundColor(.subtextColor)
                            .matchedGeometryEffect(id: "ratingNum", in: namespace)
                    }
                }
                Spacer()
                VStack {
                    Spacer()
                }
            }
        }
    }
}

enum CardPosition: CaseIterable {
    case small, big
}

struct CardDetector: View {
    
    var p: ListData
    @State var position: CardPosition
    @Namespace var namespace
    var body: some View {
        
            Group {
                switch position {
                case .small:
                smallcardView(p: p, namespace: namespace)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onLongPressGesture {
                        withAnimation {
                            position = .big
                        }
                    }
                    .padding(.horizontal)
                case .big:
                bigcardView(p: p, namespace: namespace)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 270)
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onLongPressGesture {
                        withAnimation {
                            position = .small
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
}

struct BlurryBackGroundView: View {
    
    @State var small = true
    @Namespace var namespace
    @State private var position: CardPosition = .small
    
    var body: some View {
        HStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pinkColor, Color.purpleColor]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack {
                    Capsule()
                        .fill(Color.OrangeColor)
                        .frame(width: 200, height: 200)
                        .offset(x: -150, y: -55)
                    Spacer()
                    Capsule()
                        .fill(Color.OrangeColor)
                        .frame(width: 200, height: 200)
                        .offset(x: 150, y: 105)
                }
                ScrollView {
                   // HStack {
//                        Image(systemName: "text.justify")
//                            .font(.title3)
//                            .foregroundColor(Color.white)
//                        Spacer()
//                        Image("logo")
//                            .resizable()
//                            .frame(width: 130, height: 40)
//                        Spacer()
//                        Image(systemName: "bell")
//                            .font(.title2)
//                            .foregroundColor(Color.white)
                        //}.padding(.horizontal)
                    VStack {
                        ForEach(data, id: \.self) { p in
                            CardDetector(p:p, position: self.position)
                        }
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}





// ----------------- No Space List ---------------
extension Color {
    static let lightPink = Color(red: 236 / 255, green: 188 / 255, blue: 180 / 255)
    static let lightGray = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let lightOrange = Color(red: 219 / 255, green: 98 / 255, blue: 68 / 255)
    static let iconGray = Color(red: 112 / 255, green: 112 / 255, blue: 112 / 255)
    static let lighterPink = Color(red: 233 / 255, green: 219 / 255, blue: 210 / 255)
    static let lighterGray = Color(red: 214 / 255, green: 214 / 255, blue: 214 / 255)
}
struct testListV: View {
    var body: some View {
        BlurryBackGroundView()
    }
}

struct testListV_Previews: PreviewProvider {
    static var previews: some View {
        testListV()
    }
}
