//
//  ThreadCell.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ThreadCell: View {
    
    let thread: Thread
    private var dateText: String {
        thread.timestamp.dateValue().formatted(date: .numeric, time: .shortened)
    }


    
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                CircularProfileImage(profilepic: thread.User?.profileImage ?? "person-1")
                
                
                VStack (alignment: .leading, spacing: 4){
                    HStack{
                        Text(thread.User?.username ?? "Unkown")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(dateText)
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color.black.opacity(0.7))
                        }
                        

                    }
                    Text(thread.caption)
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
    ThreadCell(thread: Thread(
        ownerUid: "123",
        caption: "Hello world",
        timestamp: Timestamp(date: Date()),
        likes: 0
    ))
}
