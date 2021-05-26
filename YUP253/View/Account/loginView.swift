//
//  loginView.swift
//  YUP253
//
//  Created by Anton Tran on 5/10/21.
//

import SwiftUI

let storedUsername = "John"
let storedpassword = "Cena"

struct loginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var createAccountPressed: Bool = false
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSuccess: Bool = false
    var body: some View {
        
        ZStack{
            (LinearGradient(gradient: Gradient(colors: [Color.black, (Color(red: 0.022, green: 0.24, blue: 0.561))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        VStack{
            
            
            TitleView()
            UserImage()
            UsernameTextField(username: $username)
            
            passwordTextField(password: $password)
            if authenticationDidFail{
                Text("Incorrect. Please try again")
                    .offset(y: -10)
                    .foregroundColor(.red)
                
            }
            
            
            
            Button(action: {
                if createAccountPressed == false {
                    self.createAccountPressed = true
                    
                    
                    
                }            }){
                createLoginContent()
            }

                    
            
            
            
            Button(action: {
                if self.username == storedUsername && self.password == storedpassword {
                    self.authenticationDidSuccess = true
                    self.authenticationDidFail = false
                    
                    
                } else {
                    self.authenticationDidFail = true
                    self.authenticationDidSuccess = false
                }            }){
                loginContent()
            }
            
            
            
            
            
        
            
        }
        .padding()
            if authenticationDidSuccess{
                Text("Login Successful")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
                ContentView()
                    .animation(.spring())
                    .transition(.slide)
            }
            
            if createAccountPressed{
                createAccountLoginView()
                    .animation(.spring())
                                        .transition(.slide)
            }
        
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        
        
            loginView()
            
        
        
    }
}

struct TitleView: View{
    var body: some View{
        Text("Hello User!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            .foregroundColor(.white)
    }
}

struct UserImage: View{
    var body: some View{
        Image("frisbee1")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct createLoginContent: View{
    var body: some View{
        Text("Create Account")
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.gray)
            .cornerRadius(35.0)
            
    }
}

struct loginContent: View{
    var body: some View{
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.gray)
            .cornerRadius(35.0)
            .navigationBarTitle("LOGIN", displayMode: .inline)
    }
    
    
}

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color.white)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            
    }
}

struct passwordTextField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color.white)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}


