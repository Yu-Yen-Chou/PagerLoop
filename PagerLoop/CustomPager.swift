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

import SwiftUI
import SwiftUIPager
import URLImage // 导入URLImage
import Kingfisher

struct CustomPager: View
{
    let colors: [Color] = [.red, .blue, .green, .yellow]

    @StateObject var page1 = Page.withIndex(2)
    @StateObject var page2 = Page.first()
    @State var data1 = Array(0..<7)

    @State private var currentPage: Int = 0
    @State private var isTimerPaused = false
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()


    var body: some View {
        VStack {
            Pager(page: self.page2,
                  data: self.data1,
                  id: \.self) { page in
                PageView3(page: page)
                
            }
            .pagingPriority(.simultaneous)
            .loopPages()
            .sensitivity(.high)
            .itemSpacing(10)
           // .itemAspectRatio(2, alignment: .start)
            .interactive(scale: 0.8)
             .padding(20)
          //  .background(Color.gray.opacity(0.2))
            
             .onDraggingEnded({
                 self.startTimer()
             })
             .onDraggingBegan({

                 self.pauseTimer()

             })
            .onReceive(timer) { _ in
                if !self.isTimerPaused {
                    withAnimation {
                        let nextPageIndex = (page2.index + 1) % data1.count
                        page2.update(.new(index: nextPageIndex))
                    }
                }
            }
            .gesture(DragGesture()
                        .onChanged { _ in
                            self.pauseTimer()
                        }
                        .onEnded { _ in
                            self.startTimer()
                        }
                    )

            HStack(spacing: 10) {
                ForEach(0..<data1.count, id: \.self) { index in
                    Circle()
                        .fill(index == page2.index ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                        .scaleEffect(index == page2.index ? 1.5 : 1.0)
                       // .offset(y: self.indicatorOffset)
                }
            }
       
            //.padding(.top, 0)
            
            Spacer()
//            .onAppear {
//                self.updateIndicatorOffset()
//            }
        }
     
    }

    private func startTimer() {
        self.isTimerPaused = false
//        withAnimation {
//            self.updateIndicatorOffset()
//        }
    }
    
    private func pauseTimer() {
        self.isTimerPaused = true
    }

//    private func updateIndicatorOffset() {
//        let indicatorWidth: CGFloat = 10
//        self.indicatorOffset = CGFloat(page2.index) * (indicatorWidth + 10) + (indicatorWidth / 2)
//    }
}


 

struct PageView3: View {
    let page: Int
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
    
    let roles = [
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
        "https://cdn.shopify.com/s/files/1/0742/2620/4955/files/promotion_banner_invoice_ch.png?v=1710947649",
    ]


    var body: some View {
        VStack {
        
//                URLImage(URL(string: roles[page])!) { image in
//                    image
//                        .resizable()
//                       // .scaledToFit()
//                }
//         
          //  .frame(maxWidth: .infinity, maxHeight: .infinity)

           
                KFImage(URL(string:roles[page])!) // globalData.pageData[page].url
                    .placeholder {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                    }
                    .resizable()
                //   .scaledToFit()
                //.frame(width: 100, height: 100)
                
           
            
            NavigationLink(destination: Text("Page \(page)")) {
                Text("Page \(page)")
            }
        }
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}


 



//import SwiftUI
//import SwiftUIPager
//
//struct CustomPager: View {
//    let data: [Int]
//
//    @StateObject var page = Page.first()
//    @State private var isTimerPaused = false
//    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
//
//    @State private var indicatorOffset: CGFloat = 0
//    let cardWidth = UIScreen.main.bounds.width - (20) - (10*2) //279
//
//
//
//    var body: some View {
//        VStack {
//            Pager(page: self.page,
//                  data: self.data,
//                  id: \.self) { page in
//                PageView(page: page)
//            }
//            .pagingPriority(.simultaneous)
//            .onDraggingEnded({
//                self.startTimer()
//            })
//            .onDraggingBegan({
//
//                self.pauseTimer()
//
//            })
//            .loopPages()
//            .sensitivity(.high)
//            .itemSpacing(10)
//            .interactive(scale: 0.8)
//           // .itemAspectRatio(1, alignment: .start)
//            .preferredItemSize(CGSize(width: cardWidth, height: 200))
//           // .background(Color.gray.opacity(0.2))
//
//            .onReceive(timer) { _ in
//                if !self.isTimerPaused {
//                    withAnimation {
//                        let nextPageIndex = (page.index + 1) % data.count
//                        page.update(.new(index: nextPageIndex))
//                    }
//                }
//            }
//
//
//            HStack(spacing: 10) {
//                ForEach(0..<data.count, id: \.self) { index in
//                    Circle()
//                        .fill(index == page.index ? Color.blue : Color.gray)
//                        .frame(width: 8, height: 8)
//                        .scaleEffect(index == page.index ? 1.5 : 1.0)
//                        .offset(y: self.indicatorOffset)
//                }
//            }
//            .padding(.top, 5)
//
//        }
//
//    }
//
//    private func startTimer() {
//        self.isTimerPaused = false
//
//
//    }
//
//    private func pauseTimer() {
//        self.isTimerPaused = true
//    }
//
//}
//
