//
//  CircularProfileImage.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/7/26.
//

import SwiftUI
import Kingfisher

struct CircularProfileImage: View {
        
    let profilepic: String
    
    var body: some View {
            KFImage(URL(string: profilepic))
                .placeholder {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                }
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .contentShape(Circle())
                .clipped()
    }
}

#Preview {
    CircularProfileImage(profilepic: "person-1")
}
