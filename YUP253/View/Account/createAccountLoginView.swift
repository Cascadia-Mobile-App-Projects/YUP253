//
//  createAccountLoginView.swift
//  YUP253
//
//  Created by Anton Tran on 5/19/21.
//

import SwiftUI



struct createAccountLoginView: View {
    let storedUsername = ""
    let storedpassword = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var backPressed: Bool = false
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSuccess: Bool = false
    var body: some View {
        
        ZStack{
            Color(red: 0.022, green: 0.24, blue: 0.561)
                .ignoresSafeArea()
        VStack{
            newTitleView()
            newUserImage()
            UsernameText(username: $username)
            
            passwordText(password: $password)
            if authenticationDidFail{
                Text("Please enter input")
                    .offset(y: -10)
                    .foregroundColor(.red)
                
            }
            
            Button(action: {}){
                createAccountLoginContent()
            }
            
            Button(action: {
                if backPressed == false {
                    self.backPressed = true
                    
                    
                    
                }            }){
                backButtonView()
            }
            
            
            
        
            
        }
        .padding()
            if authenticationDidSuccess{
                Text("Account has been Created")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
                
            }
            if backPressed{
                loginView()
                    .animation(.spring())
                                        .transition(.slide)
            }
        
        }
    }
}

struct createAccountLoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        
            createAccountLoginView()
            
        
        
    }
}

struct newTitleView: View{
    var body: some View{
        Text("Create User Account!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct newUserImage: View{
    var body: some View{
        Image(systemName: "person.circle.fill")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct createAccountLoginContent: View{
    var body: some View{
        Text("Create Account")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 50)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct backButtonView: View{
    var body: some View{
        Text("back")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 50)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}



struct UsernameText: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color.gray)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
            
    }
}

struct passwordText: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color.gray)
            .cornerRadius(5.0)
            .padding(.bottom, 10)
        
    }
}
