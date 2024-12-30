//
//  PasswordRecoveryView.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//

import SwiftUI
import FirebaseAuth

struct PasswordRecovery: View {
    @State private var phoneNumber = ""
    @State private var isLoading = false
    @State private var verificationID = ""
    @State private var showOTPVerification = false
    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        ZStack {
            // Background Image
            Image("Login and SignUp")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                // Title
                Text("Password recovery")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Enter your number to recover your password")
                    .foregroundColor(.white.opacity(0.8))

                // Phone Number TextField
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.gray)
                    TextField("+971 657 7890", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .autocapitalization(.none)
                }
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)

                // Send OTP Button
                Button(action: sendOTP) {
                    HStack {
                        Text("Send OTP")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                }
                .padding(.top)

                Spacer()
            }
            .padding(.horizontal, 40)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .fullScreenCover(isPresented: $showOTPVerification) {
            OTPVerification(verificationID: $verificationID)
        }
    }

    /// Function to Send OTP
    private func sendOTP() {
        isLoading = true
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            isLoading = false
            if let error = error {
                alertMessage = error.localizedDescription
                showAlert = true
            } else {
                self.verificationID = verificationID ?? ""
                showOTPVerification = true
            }
        }
    }
}

#Preview {
    PasswordRecovery()
}
