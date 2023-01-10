//
//  VideoListView.swift
//  Africa
//
//  Created by Majka on 06/01/2023.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES
    var videos: [VideoModel] = Bundle.main.decode("videos.json")
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List(videos) { video in
                VideoListItemView(video: video)
                    .padding(.vertical, 8)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
        }
    } // navigation list
}

//MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
