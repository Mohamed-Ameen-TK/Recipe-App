//
//  SignUpView.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//
//
//import SwiftUI
//
//struct SignUpPage: View {
//    @State private var fullName = ""
//    @State private var email = ""
//    @State private var password = ""
//    
//    var body: some View {
//        ZStack {
//            // Background Image
//            Image("Login and SignUp")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            VStack(spacing: 20) {
//                Spacer()
//                
//                // Title
//                Text("Welcome Back!")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                
//                Text("Create new account")
//                    .foregroundColor(.white.opacity(0.8))
//                
//                // Full Name TextField
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.gray)
//                    TextField("Enter your full name", text: $fullName)
//                        .autocapitalization(.words)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Email TextField
//                HStack {
//                    Image(systemName: "envelope")
//                        .foregroundColor(.gray)
//                    TextField("Email or phone number", text: $email)
//                        .autocapitalization(.none)
//                        .keyboardType(.emailAddress)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Password SecureField
//                HStack {
//                    Image(systemName: "lock")
//                        .foregroundColor(.gray)
//                    SecureField("Password", text: $password)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Sign Up Button
//                Button(action: {
//                    // Add Sign Up logic here
//                    print("Sign Up Button Clicked")
//                }) {
//                    Text("Sign UP")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.red)
//                        .cornerRadius(10)
//                }
//                .padding(.top)
//                
//                Spacer()
//            }
//            .padding(.horizontal, 40)
//        }
//    }
//}
//
//#Preview {
//    SignUpPage()
//}

//import SwiftUI
//import FirebaseAuth
//
//struct SignUpPage: View {
//    @State private var fullName = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var errorMessage = ""
//    @State private var showError = false
//    @State private var isLoading = false
//    
//    var body: some View {
//        ZStack {
//            // Background Image
//            Image("Login and SignUp")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            VStack(spacing: 20) {
//                Spacer()
//                
//                // Title
//                Text("Welcome Back!")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                
//                Text("Create new account")
//                    .foregroundColor(.white.opacity(0.8))
//                
//                // Full Name TextField
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.gray)
//                    TextField("Enter your full name", text: $fullName)
//                        .autocapitalization(.words)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Email TextField
//                HStack {
//                    Image(systemName: "envelope")
//                        .foregroundColor(.gray)
//                    TextField("Email or phone number", text: $email)
//                        .autocapitalization(.none)
//                        .keyboardType(.emailAddress)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Password SecureField
//                HStack {
//                    Image(systemName: "lock")
//                        .foregroundColor(.gray)
//                    SecureField("Password", text: $password)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Sign Up Button
//                Button(action: {
//                    signUpUser()
//                }) {
//                    if isLoading {
//                        ProgressView()
//                            .tint(.white)
//                    } else {
//                        Text("Sign UP")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.red)
//                            .cornerRadius(10)
//                    }
//                }
//                .padding(.top)
//                
//                Spacer()
//            }
//            .padding(.horizontal, 40)
//            .alert(isPresented: $showError) {
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//    
//    /// Sign up the user with Firebase Authentication
//    private func signUpUser() {
//        // Validate inputs
//        guard !fullName.isEmpty else {
//            showError(message: "Full name is required.")
//            return
//        }
//        guard !email.isEmpty else {
//            showError(message: "Email is required.")
//            return
//        }
//        guard !password.isEmpty else {
//            showError(message: "Password is required.")
//            return
//        }
//        
//        isLoading = true
//        
//        // Create user in Firebase
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            isLoading = false
//            
//            if let error = error {
//                showError(message: error.localizedDescription)
//                return
//            }
//            
//            // Successfully signed up
//            if let user = result?.user {
//                print("User signed up: \(user.uid)")
//                // Save additional user info (e.g., fullName) in Firestore or Realtime Database if needed
//            }
//        }
//    }
//    
//    /// Show error message
//    private func showError(message: String) {
//        errorMessage = message
//        showError = true
//    }
//}
//
//#Preview {
//    SignUpPage()
//}

//import SwiftUI
//import FirebaseAuth
//
//struct SignUpPage: View {
//    @State private var fullName = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var errorMessage = ""
//    @State private var showError = false
//    @State private var isLoading = false
//    
//    var body: some View {
//        ZStack {
//            // Background Image
//            Image("Login and SignUp")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            VStack(spacing: 20) {
//                Spacer()
//                
//                // Title
//                Text("Welcome Back!")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                
//                Text("Create new account")
//                    .foregroundColor(.white.opacity(0.8))
//                
//                // Full Name TextField
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.gray)
//                    TextField("Enter your full name", text: $fullName)
//                        .autocapitalization(.words)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Email TextField
//                HStack {
//                    Image(systemName: "envelope")
//                        .foregroundColor(.gray)
//                    TextField("Email or phone number", text: $email)
//                        .autocapitalization(.none)
//                        .keyboardType(.emailAddress)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Password SecureField
//                HStack {
//                    Image(systemName: "lock")
//                        .foregroundColor(.gray)
//                    SecureField("Password", text: $password)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Sign Up Button
//                Button(action: {
//                    signUpUser()
//                }) {
//                    if isLoading {
//                        ProgressView()
//                            .tint(.white)
//                    } else {
//                        Text("Sign UP")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.red)
//                            .cornerRadius(10)
//                    }
//                }
//                .padding(.top)
//                
//                Spacer()
//            }
//            .padding(.horizontal, 40)
//            .alert(isPresented: $showError) {
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//    
//    /// Sign up the user with Firebase Authentication
//    private func signUpUser() {
//        // Validate inputs
//        guard !fullName.isEmpty else {
//            showError(message: "Full name is required.")
//            return
//        }
//        guard !email.isEmpty else {
//            showError(message: "Email is required.")
//            return
//        }
//        guard !password.isEmpty else {
//            showError(message: "Password is required.")
//            return
//        }
//        
//        // Optional: Add additional validation for email format
//        guard email.contains("@") && email.contains(".") else {
//            showError(message: "Enter a valid email address.")
//            return
//        }
//        
//        // Ensure password meets Firebase requirements
//        guard password.count >= 6 else {
//            showError(message: "Password must be at least 6 characters long.")
//            return
//        }
//        
//        isLoading = true
//        
//        // Create user in Firebase
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            isLoading = false
//            
//            if let error = error {
//                showError(message: error.localizedDescription)
//                return
//            }
//            
//            // Successfully signed up
//            if let user = result?.user {
//                print("User signed up successfully: \(user.uid)")
//                // Save additional user info (e.g., fullName) in Firestore or Realtime Database if needed
//            }
//        }
//    }
//    
//    /// Show error message
//    private func showError(message: String) {
//        errorMessage = message
//        showError = true
//    }
//}
//
//#Preview {
//    SignUpPage()
//}

//import SwiftUI
//import FirebaseAuth
//
//struct SignUpPage: View {
//    @State private var fullName = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var errorMessage = ""
//    @State private var showError = false
//    @State private var isLoading = false
//    
//    var body: some View {
//        ZStack {
//            // Background Image
//            Image("Login and SignUp")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            VStack(spacing: 20) {
//                Spacer()
//                
//                // Title
//                Text("Welcome Back!")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                
//                Text("Create new account")
//                    .foregroundColor(.white.opacity(0.8))
//                
//                // Full Name TextField
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.gray)
//                    TextField("Enter your full name", text: $fullName)
//                        .autocapitalization(.words)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Email TextField
//                HStack {
//                    Image(systemName: "envelope")
//                        .foregroundColor(.gray)
//                    TextField("Email or phone number", text: $email)
//                        .autocapitalization(.none)
//                        .keyboardType(.emailAddress)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Password SecureField
//                HStack {
//                    Image(systemName: "lock")
//                        .foregroundColor(.gray)
//                    SecureField("Password", text: $password)
//                }
//                .padding()
//                .background(Color.white.opacity(0.2))
//                .cornerRadius(10)
//                .foregroundColor(.white)
//                
//                // Sign Up Button
//                Button(action: {
//                    signUpUser()
//                }) {
//                    if isLoading {
//                        HomeView()
//                            .tint(.white)
//                    } else {
//                        Text("Sign UP")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.red)
//                            .cornerRadius(10)
//                    }
//                }
//                .padding(.top)
//                
//                Spacer()
//            }
//            .padding(.horizontal, 40)
//            .alert(isPresented: $showError) {
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//    
//    /// Sign up the user with Firebase Authentication
//    private func signUpUser() {
//        // Validate inputs
//        guard !fullName.isEmpty else {
//            showError(message: "Full name is required.")
//            return
//        }
//        guard !email.isEmpty else {
//            showError(message: "Email is required.")
//            return
//        }
//        guard !password.isEmpty else {
//            showError(message: "Password is required.")
//            return
//        }
//        
//        // Optional: Add additional validation for email format
//        guard email.contains("@") && email.contains(".") else {
//            showError(message: "Enter a valid email address.")
//            return
//        }
//        
//        // Ensure password meets Firebase requirements
//        guard password.count >= 6 else {
//            showError(message: "Password must be at least 6 characters long.")
//            return
//        }
//        
//        isLoading = true
//        
//        // Create user in Firebase
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            isLoading = false
//            
//            if let error = error {
//                print("Firebase Signup Error: \(error.localizedDescription)") // User-friendly message
//                print("Error Details: \(error)") // Technical details
//                showError(message: error.localizedDescription)
//                return
//            }
//            
//            if let user = result?.user {
//                print("User signed up successfully: \(user.uid)")
//                // Save additional user info (e.g., fullName) in Firestore or Realtime Database if needed
//            }
//        }
//    }
//    
//    /// Show error message
//    private func showError(message: String) {
//        errorMessage = message
//        showError = true
//    }
//}
//
//#Preview {
//    SignUpPage()
//}

import SwiftUI
import FirebaseAuth

struct SignUpPage: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showError = false
    @State private var isLoading = false
    @State private var isSignedUp = false // Controls navigation to HomeView

    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Login and SignUp")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    // Title
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Create new account")
                        .foregroundColor(.white.opacity(0.8))
                    
                    // Full Name TextField
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("Enter your full name", text: $fullName)
                            .autocapitalization(.words)
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    // Email TextField
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    // Password SecureField
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    // Sign Up Button
                    Button(action: {
                        signUpUser()
                    }) {
                        if isLoading {
                            ProgressView()
                                .tint(.white)
                        } else {
                            Text("Sign UP")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                    .disabled(isLoading) // Disable button while loading
                    .padding(.top)
                    
                    Spacer()
                }
                .padding(.horizontal, 40)
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }

                // Navigation trigger to HomeScreen
                NavigationLink(destination: HomeScreen(), isActive: $isSignedUp) {
                    EmptyView()
                }
            }
        }
    }
    
    /// Sign up the user with Firebase Authentication
    private func signUpUser() {
        // Validate inputs
        guard !fullName.isEmpty else {
            showError(message: "Full name is required.")
            return
        }
        guard !email.isEmpty else {
            showError(message: "Email is required.")
            return
        }
        guard !password.isEmpty else {
            showError(message: "Password is required.")
            return
        }
        
        // Optional: Add additional validation for email format
        guard email.contains("@") && email.contains(".") else {
            showError(message: "Enter a valid email address.")
            return
        }
        
        // Ensure password meets Firebase requirements
        guard password.count >= 6 else {
            showError(message: "Password must be at least 6 characters long.")
            return
        }
        
        isLoading = true
        
        // Create user in Firebase
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            isLoading = false
            
            if let error = error {
                print("Firebase Signup Error: \(error.localizedDescription)")
                showError(message: error.localizedDescription)
                return
            }
            
            if let user = result?.user {
                print("User signed up successfully: \(user.uid)")
                // Navigate to HomeScreen
                isSignedUp = true
            }
        }
    }
    
    /// Show error message
    private func showError(message: String) {
        errorMessage = message
        showError = true
    }
}

struct HomeScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to Home!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("You have successfully signed up.")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    SignUpPage()
}
