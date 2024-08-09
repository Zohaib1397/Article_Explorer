//
//  ArticleCardView.swift
//  SwiftUIAppStore
//
//  Created by Zohaib Ahmed on 8/9/24.
//

import SwiftUI

struct ArticleCardView: View {
    
    var article: Article
    @Binding var isShowContent: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView{
                    VStack(alignment: .leading){
                        Image(uiImage: article.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: isShowContent ? geometry.size.height * 0.7 : min(article.image.size.height/3, 500))
                            .border(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), width: isShowContent ? 0 : 1)
                            .clipShape(.rect(cornerRadius: 15))
                            .overlay(
                                ArticleExpertView(article: article, isShowContent: $isShowContent)
                                    .clipShape(.rect(cornerRadius: isShowContent ? 0 : 15))
                            )
                        
                        if self.isShowContent {
                            Text(self.article.content)
                                .foregroundStyle(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
                .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3), radius: isShowContent ? 0 : 15)
                if self.isShowContent {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(.easeInOut) {
                                self.isShowContent = false
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundStyle(Color.white)
                                .opacity(0.7)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            }
        }
    }

}

#Preview {
    ArticleCardView(article: sampleArticles.last!, isShowContent: .constant(true))
}
