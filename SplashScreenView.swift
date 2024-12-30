//
//  ContentView.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//

//import SwiftUI
//import SwiftData
//
//struct SplashScreen: View {
//    @Environment(\.modelContext) private var modelContext // Access SwiftData's context
//    
//    @State private var isLoading = true // Control navigation
//    
//    var body: some View {
//        ZStack {
//            // Background image
//            Image("Login and SignUp")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            // Overlay content
//            VStack {
//                Spacer()
//                
//                // Main Title
//                Text("Let's\nStart Cooking")
//                    .font(.system(size: 48, weight: .bold))
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                
//                // Subtitle
//                Text("Find best recipes for cooking")
//                    .font(.system(size: 18))
//                    .foregroundColor(.white.opacity(0.8))
//                    .padding(.top, 8)
//                
//                Spacer()
//                
//                // Button to simulate navigation
//                Button(action: {
//                    // Action happens when loading completes
//                    loadData()
//                }) {
//                    Text("Start Exploring")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.red)
//                        .cornerRadius(12)
//                        .padding(.horizontal, 40)
//                }
//                .padding(.bottom, 40)
//            }
//        }
//        .onAppear {
//            loadData() // Load SwiftData models when the splash screen appears
//        }
//        .fullScreenCover(isPresented: .constant(!isLoading)) {
//            MainView() // Navigate to your main app view
//        }
//    }
//    
//    /// Simulate data loading or initialization
//    private func loadData() {
//        // Simulate loading from SwiftData (replace with actual logic if needed)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            isLoading = false
//        }
//    }
//}
//
//// Main app view (replace with your actual app's entry point)
//struct MainView: View {
//    var body: some View {
//        Text("Welcome to the Recipe App!")
//            .font(.largeTitle)
//            .padding()
//    }
//}
//
//#Preview {
//    SplashScreen()
//}

//import SwiftUI
//import SwiftData
//
//struct SplashScreen: View {
//    @Environment(\.modelContext) private var modelContext // Access SwiftData's context
//    
//    @State private var isLoading = true // Control navigation
//    @State private var showLogin = false // Control navigation to LoginPage
//    
//    var body: some View {
//        ZStack {
//            // Background image
//            Image("Login and SignUp")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            // Overlay content
//            VStack {
//                Spacer()
//                
//                // Main Title
//                Text("Let's\nStart Cooking")
//                    .font(.system(size: 48, weight: .bold))
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                
//                // Subtitle
//                Text("Find best recipes for cooking")
//                    .font(.system(size: 18))
//                    .foregroundColor(.white.opacity(0.8))
//                    .padding(.top, 8)
//                
//                Spacer()
//                
//                // Button to navigate to Login Page
//                Button(action: {
//                    loadData()
//                }) {
//                    Text("Start Exploring")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.red)
//                        .cornerRadius(12)
//                        .padding(.horizontal, 40)
//                }
//                .padding(.bottom, 40)
//            }
//        }
//        .onAppear {
//            loadData() // Load SwiftData models when the splash screen appears
//        }
//        .fullScreenCover(isPresented: $showLogin) {
//            LoginPage() // Show LoginPage after loading
//        }
//    }
//    
//    /// Simulate data loading or initialization
//    private func loadData() {
//        // Simulate loading from SwiftData (replace with actual logic if needed)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            isLoading = false
//            showLogin = true // Trigger navigation to LoginPage
//        }
//    }
//}
//
//#Preview {
//    SplashScreen()
//}

import SwiftUI
import SwiftData

struct SplashScreen: View {
    @Environment(\.modelContext) private var modelContext // Access SwiftData's context
    
    @State private var isLoading = false // Control navigation
    @State private var showLogin = false // Control navigation to LoginPage
    
    var body: some View {
        ZStack {
            // Background image
            Image("Login and SignUp")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Overlay content
            VStack {
                Spacer()
                
                // Main Title
                Text("Let's\nStart Cooking")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                // Subtitle
                Text("Find best recipes for cooking")
                    .font(.system(size: 18))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 8)
                
                Spacer()
                
                // Button to navigate to Login Page
                Button(action: {
                    startLoading() // Start loading and navigate
                }) {
                    Text("Start Exploring")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            }
        }
        .fullScreenCover(isPresented: $showLogin) {
            LoginPage() // Show LoginPage after loading
        }
    }
    
    /// Simulate data loading or initialization triggered by button
    private func startLoading() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Simulated delay
            isLoading = false
            showLogin = true // Navigate to LoginPage
        }
    }
}

#Preview {
    SplashScreen()
}
