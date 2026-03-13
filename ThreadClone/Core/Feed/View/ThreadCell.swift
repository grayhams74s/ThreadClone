//
//  ThreadCell.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI

struct ThreadCell: View {
    
    let user: User
    
    
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                CircularProfileImage(profilepic: user.profileImage ?? "")
                
                
                VStack (alignment: .leading, spacing: 4){
                    HStack{
                        Text(user.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color.black.opacity(0.7))
                        }
                        

                    }
                    Text("SADASDSADSA")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 26){
                        Button {
                            
                        }label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        }label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        }label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        }label: {
                            Image(systemName: "paperplane")
                        }
                        
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                    
                }


            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell(user: User.mockUsers)
}
