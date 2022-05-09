//
//  Home.swift
//  CoreJSON
//
//  Created by Вячеслав Квашнин on 16.07.2021.
//

import SwiftUI

struct Home: View {
    
    @StateObject var jsonModel = JSONViewModel()
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Video.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Video.titleName, ascending: true)]) var results: FetchedResults<Video>
    
    var body: some View {
        VStack {
            if results.isEmpty {
                
                if jsonModel.videos.isEmpty {
                    ProgressView()
                    //fetching Data
                    
                        .onAppear(perform: {
                            jsonModel.fetchData(context: context)
                        })
                }
                else {
                    List(jsonModel.videos, id: \.self) { video in
                        
                        CardView(video: video)
                        
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            else {
                List(results) { video in
                    CardView(fetchedData: video)
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle(!results.isEmpty ? "Fetched Core Data" : "Fetched JSON")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button(action: {
                    do {
                        results.forEach { (video) in
                            context.delete(video)
                        }
                        try context.save()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                })
            }
        })
    }
}
