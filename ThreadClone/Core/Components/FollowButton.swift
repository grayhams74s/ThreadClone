//
//  FollowButton.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/10/26.
//

import SwiftUI

struct FollowButton: View {
    var body: some View {
        HStack {
            Button {
     
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
        }
        .padding(.top, 6)
    }

}

#Preview {
    FollowButton()
}
