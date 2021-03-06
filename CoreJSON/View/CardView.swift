//
//  CardView.swift
//  CoreJSON
//
//  Created by Вячеслав Квашнин on 16.07.2021.
//

import SwiftUI

struct CardView: View {
    var video: VideoModel?
    var fetchedData: Video?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(video == nil ? fetchedData!.titleName! : video!.titleName)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            Text(video == nil ? fetchedData!.detail! : video!.detail)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        })
    }
}
