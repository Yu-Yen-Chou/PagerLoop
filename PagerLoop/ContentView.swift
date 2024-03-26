//import SwiftUI
//
//struct ContentView: View {
//    let data1 = Array(0..<7)
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                CustomPager(data: data1)
//                    .frame(maxHeight: 200)
//                    .navigationBarTitle("Custom Pager")
//                Spacer()
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}




//
//  EmbeddedExampleView.swift
//  SwiftUIPagerExample
//
//  Created by Fernando Moya de Rivas on 02/03/2020.
//  Copyright © 2020 Fernando Moya de Rivas. All rights reserved.
//

import SwiftUI
import SwiftUIPager
import URLImage

struct ContentView: View {

    @StateObject var page1: Page = .first()
    @StateObject var page2: Page = .first()
    var data = Array(0..<4)


    @State var alignment: ExamplePositionAlignment = .start

    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        Pager(page: self.page1,
                              data: self.data,
                              id: \.self) { page in
                                self.pageView(page)
                           
//                        {
//
                         }
                        
                        .interactive(rotation: true)
                        .interactive(scale: 0.7)
                        .interactive(opacity: 0.5)
                        .itemSpacing(10)
                        .itemAspectRatio(0.8, alignment: .end)
                        .padding(8)
                        .frame(width: min(proxy.size.height, proxy.size.width),
                               height: min(proxy.size.height, proxy.size.width))
                       .background(Color.gray.opacity(0.2))

                      

                       
                        
                    }
                }
            }
            
            .navigationBarTitle("Inside a Scrollview", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }

    func pageView(_ page: Int) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.yellow)
            Text("Page: \(page)")
                .bold()
        }
        .cornerRadius(5)
        .shadow(radius: 5)
    }

}

enum ExamplePositionAlignment: String, CaseIterable {
    case start
    case justified
    case end
}

extension PositionAlignment {
    init(alignment: ExamplePositionAlignment) {
        switch alignment {
            case .start:
                self = .start(10)
            case .end:
                self = .end(10)
            case .justified:
                self = .justified(10)
        }
    }
}





//import SwiftUI
//import SwiftUIPager
//import URLImage // 导入URLImage
//
//struct ContentView: View
//{
//    let colors: [Color] = [.red, .blue, .green, .yellow]
//
//    @StateObject var page1 = Page.withIndex(2)
//    @StateObject var page2 = Page.first()
//    @State var data1 = Array(0..<7)
//
//    @State private var currentPage: Int = 0
//    @State private var isTimerPaused = false
//    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
//
//
//    var body: some View {
//        VStack {
//            Pager(page: self.page2,
//                  data: self.data1,
//                  id: \.self) { page in
//                PageView2(page: page)
//            }
//            .pagingPriority(.simultaneous)
//            .loopPages()
//            .sensitivity(.high)
//            .itemSpacing(10)
//           // .itemAspectRatio(2, alignment: .start)
//            .interactive(scale: 0.8)
//             .padding(20)
//          //  .background(Color.gray.opacity(0.2))
//
//             .onDraggingEnded({
//                 self.startTimer()
//             })
//             .onDraggingBegan({
//
//                 self.pauseTimer()
//
//             })
//            .onReceive(timer) { _ in
//                if !self.isTimerPaused {
//                    withAnimation {
//                        let nextPageIndex = (page2.index + 1) % data1.count
//                        page2.update(.new(index: nextPageIndex))
//                    }
//                }
//            }
//            .gesture(DragGesture()
//                        .onChanged { _ in
//                            self.pauseTimer()
//                        }
//                        .onEnded { _ in
//                            self.startTimer()
//                        }
//                    )
//
//            HStack(spacing: 10) {
//                ForEach(0..<data1.count, id: \.self) { index in
//                    Circle()
//                        .fill(index == page2.index ? Color.blue : Color.gray)
//                        .frame(width: 8, height: 8)
//                        .scaleEffect(index == page2.index ? 1.5 : 1.0)
//                       // .offset(y: self.indicatorOffset)
//                }
//            }
//
//            //.padding(.top, 0)
//
//            Spacer()
////            .onAppear {
////                self.updateIndicatorOffset()
////            }
//        }
//
//    }
//
//    private func startTimer() {
//        self.isTimerPaused = false
////        withAnimation {
////            self.updateIndicatorOffset()
////        }
//    }
//
//    private func pauseTimer() {
//        self.isTimerPaused = true
//    }
//
////    private func updateIndicatorOffset() {
////        let indicatorWidth: CGFloat = 10
////        self.indicatorOffset = CGFloat(page2.index) * (indicatorWidth + 10) + (indicatorWidth / 2)
////    }
//}
//
//
//
//
//struct PageView2: View {
//    let page: Int
//    let roles = [
//        "https://mresim.com/cdn/shop/files/mobile_ch_d0112b89-feb2-4138-a21f-54ecbef4c37c_1638x1667_crop_center.png?v=1706801258",
//        "https://mresim.com/cdn/shop/files/invoice_m_ch_1638x1667_crop_center.png?v=1698245638",
//        "https://mresim.com/cdn/shop/files/mobile_ch_d0112b89-feb2-4138-a21f-54ecbef4c37c_1638x1667_crop_center.png?v=1706801258",
//        "https://mresim.com/cdn/shop/files/mobile_ch_d0112b89-feb2-4138-a21f-54ecbef4c37c_1638x1667_crop_center.png?v=1706801258",
//        "https://mresim.com/cdn/shop/files/03_mobile_800x814_crop_center.png?v=1691344154",
//        "https://mresim.com/cdn/shop/files/01_mobile_800x814_crop_center.png?v=1691344154",
//        "https://via.placeholder.com/600x400/16A085/FFFFFF?text=Scenery+7",
//        "https://via.placeholder.com/600x400/C0392B/FFFFFF?text=Scenery+8",
//        "https://via.placeholder.com/600x400/2C3E50/FFFFFF?text=Scenery+9",
//    ]
//
//
//
//    var body: some View {
//        VStack {
//            URLImage(url: URL(string: roles[page])!) { image in
//                switch image {
//                case .empty:
//                    EmptyView()
//                case .success(let image):
//                    image
//                        .resizable()
//                        .scaledToFit()
//                case .failure:
//                    Text("Failed to load image")
//                @unknown default:
//                    EmptyView()
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//            NavigationLink(destination: Text("Page \(page)")) {
//                Text("Page \(page)")
//            }
//        }
//        .cornerRadius(5)
//        .shadow(radius: 5)
//    }
//}
//
//
//
