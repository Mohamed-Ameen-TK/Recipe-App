//
//  LoginView.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//
//import SwiftUI
//import FirebaseAuth
//
//struct LoginPage: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var showAlert = false
//    @State private var alertMessage = ""
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
//                // Welcome Text
//                Text("Welcome Back!")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                
//                Text("Please enter your account here")
//                    .foregroundColor(.white.opacity(0.8))
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
//                // Forgot Password
//                HStack {
//                    Spacer()
//                    Button("Forgot password?") {
//                        // Handle forgot password logic
//                        forgotPassword()
//                    }
//                    .foregroundColor(.white)
//                    .font(.caption)
//                }
//                
//                // Login Button
//                Button(action: login) {
//                    Text("Login")
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
//                
//                // Sign Up Text
//                HStack {
//                    Text("Don't have any account?")
//                        .foregroundColor(.white.opacity(0.8))
//                    
//                    Button("Sign Up") {
//                        // Navigate to Sign Up Page
//                    }
//                    .foregroundColor(.red)
//                }
//            }
//            .padding(.horizontal, 40)
//        }
//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//        }
//    }
//    
//    // Login Function
//    private func login() {
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if let error = error {
//                alertMessage = error.localizedDescription
//                showAlert = true
//            } else {
//                // Navigate to the Main App
//                print("Login Successful!")
//            }
//        }
//    }
//    
//    // Forgot Password Function
//    private func forgotPassword() {
//        if email.isEmpty {
//            alertMessage = "Please enter your email to reset the password."
//            showAlert = true
//        } else {
//            Auth.auth().sendPasswordReset(withEmail: email) { error in
//                if let error = error {
//                    alertMessage = error.localizedDescription
//                } else {
//                    alertMessage = "Password reset email sent successfully!"
//                }
//                showAlert = true
//            }
//        }
//    }
//}
//
//#Preview {
//    LoginPage()
//}

//import SwiftUI
//import FirebaseAuth
//
//struct LoginPage: View {
//    @State private var email = ""
//    @State private var password = ""
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                // Background Image
//                Image("Login and SignUp")
//                    .resizable()
//                    .scaledToFill()
//                    .ignoresSafeArea()
//                
//                VStack(spacing: 20) {
//                    Spacer()
//                    
//                    // Welcome Text
//                    Text("Welcome Back!")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                    
//                    Text("Please enter your account here")
//                        .foregroundColor(.white.opacity(0.8))
//                    
//                    // Email TextField
//                    HStack {
//                        Image(systemName: "envelope")
//                            .foregroundColor(.gray)
//                        TextField("Email or phone number", text: $email)
//                            .autocapitalization(.none)
//                            .keyboardType(.emailAddress)
//                    }
//                    .padding()
//                    .background(Color.white.opacity(0.2))
//                    .cornerRadius(10)
//                    .foregroundColor(.white)
//                    
//                    // Password SecureField
//                    HStack {
//                        Image(systemName: "lock")
//                            .foregroundColor(.gray)
//                        SecureField("Password", text: $password)
//                    }
//                    .padding()
//                    .background(Color.white.opacity(0.2))
//                    .cornerRadius(10)
//                    .foregroundColor(.white)
//                    
//                    // Forgot Password
//                    HStack {
//                        Spacer()
//                        Button("Forgot password?") {
//                            // Handle forgot password logic
//                            forgotPassword()
//                        }
//                        .foregroundColor(.white)
//                        .font(.caption)
//                    }
//                    
//                    // Login Button
//                    Button(action: login) {
//                        Text("Login")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.red)
//                            .cornerRadius(10)
//                    }
//                    .padding(.top)
//                    
//                    Spacer()
//                    
//                    // Sign Up Text
//                    HStack {
//                        Text("Don't have any account?")
//                            .foregroundColor(.white.opacity(0.8))
//                        
//                        NavigationLink(destination: SignUpPage()) {
//                            Text("Sign Up")
//                                .foregroundColor(.red)
//                        }
//                    }
//                }
//                .padding(.horizontal, 40)
//            }
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//    
//    // Login Function
//    private func login() {
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if let error = error {
//                alertMessage = error.localizedDescription
//                showAlert = true
//            } else {
//                // Navigate to the Main App
//                print("Login Successful!")
//            }
//        }
//    }
//    
//    // Forgot Password Function
//    private func forgotPassword() {
//        if email.isEmpty {
//            alertMessage = "Please enter your email to reset the password."
//            showAlert = true
//        } else {
//            Auth.auth().sendPasswordReset(withEmail: email) { error in
//                if let error = error {
//                    alertMessage = error.localizedDescription
//                } else {
//                    alertMessage = "Password reset email sent successfully!"
//                }
//                showAlert = true
//            }
//        }
//    }
//}
//
//#Preview {
//    LoginPage()
//}

import SwiftUI
import FirebaseAuth

struct LoginPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("Login and SignUp")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Spacer()

                    // Welcome Text
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Please enter your account here")
                        .foregroundColor(.white.opacity(0.8))

                    // Email TextField
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Email or phone number", text: $email)
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

                    // Forgot Password
                    HStack {
                        Spacer()
                        NavigationLink(destination: PasswordRecovery()) {
                            Text("Forgot password?")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                    }

                    // Login Button
                    Button(action: login) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.top)

                    Spacer()

                    // Sign Up Text
                    HStack {
                        Text("Don't have any account?")
                            .foregroundColor(.white.opacity(0.8))

                        NavigationLink(destination: SignUpPage()) {
                            Text("Sign Up")
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    // Login Function
    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                alertMessage = error.localizedDescription
                showAlert = true
            } else {
                // Navigate to the Main App
                print("Login Successful!")
            }
        }
    }
}

#Preview {
    LoginPage()
}
