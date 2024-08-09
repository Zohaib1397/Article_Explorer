//
//  ArticleExpertView.swift
//  SwiftUIAppStore
//
//  Created by Zohaib Ahmed on 8/9/24.
//

import SwiftUI

struct ArticleExpertView: View {
    var article: Article
    @Binding var isShowContent: Bool
    var body: some View{
        VStack{
            Spacer()
            
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay(
                    HStack{
                        VStack(alignment: .leading) {
                            Text(article.category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.secondary)
                            Text(article.headline)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.primary)
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            if !isShowContent {
                                Text(article.subHeadline)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                        }
                        .padding()
                        Spacer()
                    }
                )
        }
        .foregroundStyle(.white)
    }
    
}

#Preview("Article Excerpt View with subheadline", traits: .fixedLayout(width: 380, height: 500)) {
    ArticleExpertView(article: sampleArticles.first!, isShowContent: .constant(false))
}

