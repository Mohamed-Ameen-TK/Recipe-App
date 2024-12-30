//
//  OTPVarificationView.swift
//  ProjectExample
//
//  Created by Mohamed Ameen on 28/12/24.
//

//import SwiftUI
//import FirebaseAuth
//
//struct OTPVerificationView: View {
//    @Binding var verificationID: String
//    @State private var otpCode = Array(repeating: "", count: 6) // 6-digit OTP
//    @State private var timeRemaining = 180 // Timer in seconds (3 minutes)
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Spacer()
//
//            // Title and Subtitle
//            Text("Check your email")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//
//            Text("We’ve sent this code to your message")
//                .foregroundColor(.gray)
//
//            // OTP Code Fields
//            HStack(spacing: 8) {
//                ForEach(0..<6, id: \.self) { index in
//                    TextField("", text: $otpCode[index])
//                        .keyboardType(.numberPad)
//                        .multilineTextAlignment(.center)
//                        .font(.system(size: 24))
//                        .frame(width: 50, height: 50)
//                        .background(Color.gray.opacity(0.1))
//                        .cornerRadius(8)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(index < otpCode.count && !otpCode[index].isEmpty ? Color.green : Color.gray, lineWidth: 1)
//                        )
//                        .onChange(of: otpCode[index]) { newValue, transaction in
//                            if newValue.count > 1 {
//                                otpCode[index] = String(newValue.last!) // Keep only the last character
//                            }
//                            if newValue.count == 1 && index < 5 {
//                                // Automatically move to the next field
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                                    UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
//                                }
//                            }
//                        }
//
//                }
//            }
//
//            // Timer Countdown
//            Text("Code expires in: \(timeString(from: timeRemaining))")
//                .font(.caption)
//                .foregroundColor(.red)
//
//            // Next Button
//            Button(action: verifyOTP) {
//                Text("Next")
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.red)
//                    .cornerRadius(10)
//            }
//            .padding(.horizontal, 40)
//
//            // Resend Button
//            Button(action: resendOTP) {
//                Text("Send again")
//                    .foregroundColor(.red)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(10)
//            }
//            .padding(.horizontal, 40)
//
//            Spacer()
//        }
//        .padding(.horizontal, 20)
//        .onAppear(perform: startTimer)
//        .alert(isPresented: $showAlert) {
//            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//        }
//    }
//
//    // Verify OTP
//    private func verifyOTP() {
//        let otpString = otpCode.joined()
//        guard otpString.count == 6 else {
//            alertMessage = "Please enter a valid 6-digit OTP."
//            showAlert = true
//            return
//        }
//
//        let credential = PhoneAuthProvider.provider().credential(
//            withVerificationID: verificationID,
//            verificationCode: otpString
//        )
//
//        Auth.auth().signIn(with: credential) { authResult, error in
//            if let error = error {
//                alertMessage = error.localizedDescription
//                showAlert = true
//            } else {
//                print("OTP Verified! Login Successful.")
//            }
//        }
//    }
//
//    // Resend OTP
//    private func resendOTP() {
//        // Your logic to resend OTP
//        alertMessage = "OTP has been resent!"
//        showAlert = true
//        timeRemaining = 180 // Reset the timer
//        startTimer()
//    }
//
//    // Timer
//    private func startTimer() {
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            if timeRemaining > 0 {
//                timeRemaining -= 1
//            } else {
//                timer.invalidate()
//            }
//        }
//    }
//
//    // Format time as MM:SS
//    private func timeString(from seconds: Int) -> String {
//        let minutes = seconds / 60
//        let seconds = seconds % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
//
//#Preview {
//    OTPVerificationView(verificationID: .constant("sampleVerificationID"))
//}

import SwiftUI
import FirebaseAuth

struct OTPVerification: View {
    @Binding var verificationID: String
    @State private var otpCode = Array(repeating: "", count: 6) // 6-digit OTP
    @State private var timeRemaining = 180 // Timer in seconds (3 minutes)
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            // Background Image
            Image("Login and SignUp")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                // Title and Subtitle
                Text("Check your email")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("We’ve sent this code to your message")
                    .foregroundColor(.white.opacity(0.8))

                // OTP Code Fields
                HStack(spacing: 8) {
                    ForEach(0..<6, id: \.self) { index in
                        TextField("", text: $otpCode[index])
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24))
                            .frame(width: 50, height: 50)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(index < otpCode.count && !otpCode[index].isEmpty ? Color.green : Color.gray, lineWidth: 1)
                            )
                            .onChange(of: otpCode[index]) { newValue, transaction in
                                if newValue.count > 1 {
                                    otpCode[index] = String(newValue.last!) // Keep only the last character
                                }
                                if newValue.count == 1 && index < 5 {
                                    // Automatically move to the next field
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                }
                            }
                    }
                }

                // Timer Countdown
                Text("Code expires in: \(timeString(from: timeRemaining))")
                    .font(.caption)
                    .foregroundColor(.red)

                // Next Button
                Button(action: verifyOTP) {
                    Text("Next")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)

                // Resend Button
                Button(action: resendOTP) {
                    Text("Send again")
                        .foregroundColor(.red)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)

                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .onAppear(perform: startTimer)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    // Verify OTP
    private func verifyOTP() {
        let otpString = otpCode.joined()
        guard otpString.count == 6 else {
            alertMessage = "Please enter a valid 6-digit OTP."
            showAlert = true
            return
        }

        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: otpString
        )

        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                alertMessage = error.localizedDescription
                showAlert = true
            } else {
                print("OTP Verified! Login Successful.")
            }
        }
    }

    // Resend OTP
    private func resendOTP() {
        // Your logic to resend OTP
        alertMessage = "OTP has been resent!"
        showAlert = true
        timeRemaining = 180 // Reset the timer
        startTimer()
    }

    // Timer
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
            }
        }
    }

    // Format time as MM:SS
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    OTPVerification(verificationID: .constant("sampleVerificationID"))
}
