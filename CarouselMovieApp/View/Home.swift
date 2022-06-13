//
//  Home.swift
//  CarouselMovieApp
//
//  Created by Vincentius Sutanto on 08/06/22.
//

import SwiftUI

struct Home: View {
    
    //@GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    //@State var posts: [Post] = []
    //@State var currentTab = "Recent"
    //@Namespace var animation
    
    var body: some View {
        
        ZStack{
            
            //TabView
            TabView(selection: $currentIndex){
                ForEach(posts.indices, id: \.self){ index in
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        Image(posts[index].postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(1)
                    }
                    .ignoresSafeArea()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            .overlay(
                LinearGradient(colors: [
                    Color.clear,
                    Color.black.opacity(0.2),
                    Color.black.opacity(0.1),
                    Color.white.opacity(0.4),
                    Color.white,
                    Color.white,
                    Color.white,
                ], startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea()
            .offset(y: -100)
            
            
            VStack(spacing: 10){
//                Button {
//
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title.bold())
//                        .foregroundColor(.white)
//                }
//                    .foregroundColor(.primary)
                
                //Snap Carousel
                SnapCarousel(trailingSpace: 150, index: $currentIndex, items: posts) {post in
                    
                    CardView(post: post)
                }
                .offset(y: getRect().height / 3.8)
                
                //Indicator (Custom Paging Control)
                HStack (spacing: 10) {

                    ForEach ( posts.indices, id: \.self){ index in

                        Circle()
                            .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                            .frame(width: 7, height: 7)
                            .scaleEffect(currentIndex == index ? 1.4 : 1)
                            .animation(.spring(), value: currentIndex == index)
                    }
                }
                .padding(.bottom, 18)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    @ViewBuilder
    func CardView(post: Post)->some View{
        VStack(spacing: 10){
            GeometryReader { proxy in
                let size = proxy.size
                
                Image(post.postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(25)
            }
            .padding(15)
            .background(Color.white)
            .cornerRadius(30)
            .frame(height: getRect().height / 2.5)
            .padding(.bottom, 15)
            
            //Data
            Text(post.title)
                .font(.title2.bold())
            
            HStack(spacing: 3){
                ForEach(1...5, id: \.self){ index in
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(index <= post.starRating ? .yellow : .gray)
                }
                
                Text("(\(post.starRating).0)")
            }
            .font(.caption)
            
            Text(post.desc)
                .font(.callout)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
                .padding(.horizontal)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//Screen Bounds
extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
