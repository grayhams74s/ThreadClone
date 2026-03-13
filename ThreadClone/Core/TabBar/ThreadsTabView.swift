//
//  ThreadsTabView.swift
//  ThreadClone
//
//  Created by felix angcot jr on 3/6/26.
//

import SwiftUI
import Lottie

struct ThreadsTabView: View {
    @State private var selectedTab  = 0
    @State private var showCreatedThreadView = false
    @State private var previousTab = 0
    @State private var viewModel = CreateThreadViewModel()

        
    var body: some View {
        ZStack(alignment: .bottom) {
            tabViewUI
            // Animated loading banner
                loadingStateUI
                    .padding(.bottom, 60)
                    .offset(y: viewModel.isCreating ? 0 : 100)
                    .opacity(viewModel.isCreating ? 1 : 0)
                    .animation(.spring(), value: viewModel.isCreating)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 10)

            
            plusButtonUI
        }
        .animation(.spring(), value: viewModel.isCreating) // watches isCreating and triggers transition
    }
    
    fileprivate var loadingStateUI: some View {
        HStack {
            if viewModel.Doneuploading {
                LottieView(animation: .named("sentemail"))
                               .playing()
                               .looping()
                               .resizable()
                               .scaledToFit()
                               .frame(width: 80, height: 100)
                
                VStack (alignment: .leading) {
                    Text("Posted")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Thread Successfully Posted")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)

                }
                
            } else {
                LottieView(animation: .named("Thread-2"))
                               .playing()
                               .looping()
                               .resizable()
                               .scaledToFit()
                               .frame(width: 80, height: 100)
                
                Text("Posting....")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            if !viewModel.Doneuploading {
                ProgressView()
                    .tint(.black)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(.clear)
        )
        .padding()
        .foregroundStyle(.black)
    }
    
    
    fileprivate var tabViewUI: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem{
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear{ selectedTab = 0 }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear{ selectedTab = 1 }
                .tag(1)
            
            // Dummy tab for the plus
            Color.clear
                .tabItem {
                    Image(systemName: "")
                }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear{ selectedTab = 3 }
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear{ selectedTab = 4 }
                .tag(4)
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            if newValue == 2 {
                selectedTab = previousTab
                showCreatedThreadView = true
            } else {
                previousTab = newValue
            }
        }
        .sheet(isPresented: $showCreatedThreadView, onDismiss: {
            selectedTab = 0
        }, content: {
            CreateThreadView(viewModel: viewModel)
        })
        .tint(.black)
    }
    
    fileprivate var plusButtonUI: some View {
        Button {
            showCreatedThreadView = true
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.20))
                    .frame(width: 60, height: 43)
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
    }
    
}

#Preview {
    ThreadsTabView()
}
