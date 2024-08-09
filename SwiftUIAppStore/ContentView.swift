//
//  ContentView.swift
//  SwiftUIAppStore
//
//  Created by Zohaib Ahmed on 8/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var isShowContent: Bool = false
    @State var selectedArticleIndex: Int?
    @Namespace var nsArticle
    var body: some View{
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 40){
                    TopBar()
                    
                    ForEach(sampleArticles.indices, id: \.self){ index in
                        ArticleCardView(article: sampleArticles[index], isShowContent: $isShowContent)
                            .matchedGeometryEffect(id: index, in: nsArticle)
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.35, dampingFraction: 0.65, blendDuration: 0.1)){
                                    selectedArticleIndex = index
                                    isShowContent.toggle()
                                }
                            }
                            .frame(height: min(sampleArticles[index].image.size.height/3, 500))
                            
                            
                    }
                    Spacer()
                }
            }
            .opacity(isShowContent ? 0 : 1)
            if isShowContent, let selectedArticleIndex {
                ArticleCardView(article: sampleArticles[selectedArticleIndex], isShowContent: $isShowContent)
                    .matchedGeometryEffect(id: selectedArticleIndex, in: nsArticle)
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct TopBar: View{
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(getCurrentDate().uppercased())
                    .font(.system(.caption))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.gray)
                Text("Today")
                    .font(.system(.largeTitle))
                    .fontWeight(.heavy)
            }
            Spacer()
            
            AvatarImage(image: "profile")
            
        }.padding(.horizontal, 20)
    }
    
    private func getCurrentDate(with format: String = "EEEE, MMM d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}

struct AvatarImage: View{
    
    var image: String
    var width: CGFloat = 60
    var height: CGFloat = 60
    
    var body: some View{
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .clipShape(.circle)
    }
}
