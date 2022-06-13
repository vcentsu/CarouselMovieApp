//
//  SnapCarousel.swift
//  CarouselMovieApp
//
//  Created by Vincentius Sutanto on 08/06/22.
//

import SwiftUI

// To for Accepting List
struct SnapCarousel<Content: View, T: Identifiable>: View {
    
    var content: (T) -> Content
    var list: [T]
    
    //properties
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 110, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T)->Content){
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader{proxy in
            
            //Width Snap Carousel
            
            let width = (proxy.size.width - trailingSpace)
            let adjustMentWidth = (trailingSpace / 2 ) - (spacing * CGFloat(currentIndex + 1))
            
            HStack(spacing: spacing){
                ForEach(list){ item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                        .offset(y: getOffset(item: item, width: width))
                }
            }
            .padding(.horizontal, spacing)
            //.offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
            .offset(x: (CGFloat(currentIndex) * -width) + adjustMentWidth + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({value in
                        
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        //MIN
                        currentIndex = max(min (currentIndex + Int(roundIndex), list.count - 1) , 0)
                        
                        //update index
                        currentIndex = index
                    })
                    .onChanged({ value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()
                        
                        //MIN
                        index = max(min (currentIndex + Int(roundIndex), list.count - 1) , 0)
                        
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }
    
    func getOffset(item: T, width: CGFloat)->CGFloat{
        
        
        //PROGRESS (Shifting Current Item to Top)
        let progress = ((offset < 0 ? offset : -offset) / width) * 60
        let topOffset = -progress < 60 ? progress : -(progress + 120)
        let previous = getIndex(item: item) - 1 == currentIndex ? (offset < 0 ? topOffset : -topOffset) : 0
        let next = getIndex(item: item) + 1 == currentIndex ? (offset < 0 ? -topOffset : topOffset) : 0
        
        //Safety Check 0 and max list size
        let checkBetween = currentIndex >= 0 && currentIndex < list.count ? (getIndex(item: item) - 1 == currentIndex ? previous : next) : 0
        
        return getIndex(item: item) == currentIndex ? -60 - topOffset : checkBetween
    }
    
    func getIndex(item: T)->Int{
        let index = list.firstIndex{ currentItem in
            return currentItem.id == item.id
        } ?? 0
        
        return index
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
