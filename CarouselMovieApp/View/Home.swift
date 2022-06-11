//
//  Home.swift
//  CarouselMovieApp
//
//  Created by Vincentius Sutanto on 08/06/22.
//

import SwiftUI

struct Home: View {
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    @State var posts: [Post] = []
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack(spacing: 0){
                
            }
            
            VStack(alignment: .leading, spacing: 12){
                
                Button {
                    
                } label: {
                    Label {
                        Text("Back")
                            .fontWeight(.semibold)
                    } icon: {
                        Image(systemName: "chevron.left")
                            .font(.title2.bold())
                    }
                    .foregroundColor(.primary)
                }
                
                Text("My Movie")
                    .font(.title)
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            //Snap Carousel
            SnapCarousel(index: $currentIndex, items: posts) {post in
                
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical, 40)
            
            //custom paging control
            HStack (spacing: 10) {
                ForEach ( posts.indices, id: \.self){ index in
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear{
            for index in 1...7 {
                posts.append(Post(postImage: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
