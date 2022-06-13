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
        
        VStack(spacing: 15){
            
//            VStack(alignment: .leading, spacing: 12){
//
//                Button {
//
//                } label: {
//                    Label {
//                        Text("Back")
//                            .fontWeight(.semibold)
//                    } icon: {
//                        Image(systemName: "chevron.left")
//                            .font(.title2.bold())
//                    }
//                    .foregroundColor(.primary)
//                }
//
//                Text("Marvel Movies")
//                    .font(.title)
//                    .fontWeight(.black)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
            
            
            //Snap Carousel
            SnapCarousel(trailingSpace: 150, index: $currentIndex, items: posts) {post in
                
                VStack(spacing: 10){
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        Image(post.postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(25)
                    }
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
            
            //Indicator (Custom Paging Control)
            HStack (spacing: 10) {

                ForEach ( posts.indices, id: \.self){ index in

                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                }
            }
            .padding(.bottom, 40)
        }
        .frame(maxHeight: .infinity, alignment: .top)
//        .onAppear{
//            for index in 1...7 {
//                posts.append(Post(postImage: "post\(index)"))
//            }
//        }
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
