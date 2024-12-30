////
////  PasswordResetView.swift
////  ProjectExample
////
////  Created by Mohamed Ameen on 28/12/24.
////
//
//import SwiftUI
//import FirebaseAuth
//
//struct PasswordResetView: View {
//    @State private var newPassword = ""
//    @State private var confirmPassword = ""
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
//                // Title
//                Text("Reset your password")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//
//                Text("Please enter your new password")
//                    .foregroundColor(.white.opacity(0.8))
//
//                // Password TextField
//                SecureField("New Password", text: $newPassword)
//                    .padding()
//                    .background(Color.white.opacity(0.2))
//                    .cornerRadius(10)
//                    .foregroundColor(.white)
//                    .autocapitalization(.none)
//
//                SecureField("Confirm Password", text: $confirmPassword)
//                    .padding()
//                    .background(Color.white.opacity(0.2))
//                    .cornerRadius(10)
//                    .foregroundColor(.white)
//                    .autocapitalization(.none)
//
//                // Password Requirements
//                VStack(alignment: .leading, spacing: 5) {
//                    HStack {
//                        Image(systemName: newPassword.count >= 6 ? "checkmark.circle.fill" : "xmark.circle.fill")
//                            .foregroundColor(newPassword.count >= 6 ? .green : .red)
//                        Text("At least 6 characters")
//                            .foregroundColor(.white)
//                    }
//                    HStack {
//                        Image(systemName: newPassword.contains(where: { $0.isNumber }) ? "checkmark.circle.fill" : "xmark.circle.fill")
//                            .foregroundColor(newPassword.contains(where: { $0.isNumber }) ? .green : .red)
//                        Text("Contains a number")
//                            .foregroundColor(.white)
//                    }
//                }
//
//                // Done Button
//                Button(action: resetPassword) {
//                    Text("Done")
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
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Info"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//
//    /// Reset Password Function
//    private func resetPassword() {
//        // Check if passwords match
//        guard newPassword == confirmPassword else {
//            alertMessage = "Passwords do not match."
//            showAlert = true
//            return
//        }
//
//        // Validate password length and content
//        guard newPassword.count >= 6 else {
//            alertMessage = "Password must be at least 6 characters long."
//            showAlert = true
//            return
//        }
//
//        // Get the current user
//        if let user = Auth.auth().currentUser {
//            user.updatePassword(to: newPassword) { error in
//                if let error = error {
//                    alertMessage = "Error resetting password: \(error.localizedDescription)"
//                    showAlert = true
//                } else {
//                    alertMessage = "Password has been successfully reset!"
//                    showAlert = true
//                }
//            }
//        } else {
//            alertMessage = "User not authenticated. Please log in again."
//            showAlert = true
//        }
//    }
//}
//
//#Preview {
//    PasswordResetView()
//}

import SwiftUI
import FirebaseAuth

struct PasswordReset: View {
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToLogin = false  // State for navigation

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

                    // Title
                    Text("Reset your password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Please enter your new password")
                        .foregroundColor(.white.opacity(0.8))

                    // Password TextField
                    SecureField("New Password", text: $newPassword)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .autocapitalization(.none)

                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .autocapitalization(.none)

                    // Password Requirements
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(systemName: newPassword.count >= 6 ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(newPassword.count >= 6 ? .green : .red)
                            Text("At least 6 characters")
                                .foregroundColor(.white)
                        }
                        HStack {
                            Image(systemName: newPassword.contains(where: { $0.isNumber }) ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(newPassword.contains(where: { $0.isNumber }) ? .green : .red)
                            Text("Contains a number")
                                .foregroundColor(.white)
                        }
                    }

                    // Done Button
                    Button(action: resetPassword) {
                        Text("Done")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.top)

                    Spacer()
                }
                .padding(.horizontal, 40)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Info"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }

                // Navigate to the Login screen when the state is true
                .navigationDestination(isPresented: $navigateToLogin) {
                    LoginView()  // Redirect to the LoginView
                }
            }
        }
    }

    /// Reset Password Function
    private func resetPassword() {
        // Check if passwords match
        guard newPassword == confirmPassword else {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }

        // Validate password length and content
        guard newPassword.count >= 6 else {
            alertMessage = "Password must be at least 6 characters long."
            showAlert = true
            return
        }

        // Get the current user
        if let user = Auth.auth().currentUser {
            user.updatePassword(to: newPassword) { error in
                if let error = error {
                    alertMessage = "Error resetting password: \(error.localizedDescription)"
                    showAlert = true
                } else {
                    alertMessage = "Password has been successfully reset!"
                    showAlert = true
                    
                    // Navigate to the login page after successful password reset
                    navigateToLogin = true
                }
            }
        } else {
            alertMessage = "User not authenticated. Please log in again."
            showAlert = true
        }
    }
}

struct LoginView: View {
    var body: some View {
        Text("Login Page")
            .font(.title)
            .padding()
    }
}

#Preview {
    PasswordReset()
}
