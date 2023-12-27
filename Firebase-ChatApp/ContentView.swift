//
//  ContentView.swift
//  Firebase-ChatApp
//
//  Created by Hmoo Myat Theingi on 27/12/2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @State private var isLoginMode=false
    @State private var email=""
    @State private var password=""
    @State private var loginStatusMessage = ""

    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack(spacing:20){
                    Picker("", selection: $isLoginMode) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                                        
                    
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(.white)
                      
                    
                    Button{
                        handleAction()
                    } label: {
                        
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .font(.system(size: 14,weight: .semibold))
                            Spacer()
                        }.background(.blue)
                    }
                    Text(self.loginStatusMessage)
                        .foregroundColor(.red)
                }
                .padding()
            }
            .navigationTitle(isLoginMode ? "Log In " : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05)))
        }
        .navigationViewStyle(StackNavigationViewStyle())
       

    }
    func handleAction(){
        if isLoginMode{
            loginUser()
        }else{
            createNewAccount()
        }
    }
    
    
    private func loginUser(){
        Auth.auth().signIn(withEmail: email, password: password){result,error in
            if let err = error {
                print("Failed to login user:",err)
                self.loginStatusMessage = "Failed to login user"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid)")
            self.loginStatusMessage = "Successfully logged in as user"
            
        }
    }
    
    
    private func createNewAccount(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let err = error{
                print("Failed to create user:",err)
                self.loginStatusMessage = "The email address is already in use by another account."
                return
            }
            
            print("successfully created user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully created user"
        }
    }
    
}

#Preview {
    ContentView()
}
