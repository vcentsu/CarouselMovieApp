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
                
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.height, alignment: .center)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical,150)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear{
            for index in 1...5 {
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
