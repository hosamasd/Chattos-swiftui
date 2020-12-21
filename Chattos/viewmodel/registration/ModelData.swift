//
//  ModelData.swift
//  Chattos
//
//  Created by hosam on 12/17/20.
//

import SwiftUI
import Firebase

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var isLinkSend = false
    // AlertView With TextFields....
    
    // Error Alerts...
    
    @Published var alert = false
    @Published var alertMsg = ""
    
    // User Status....
    @AppStorage("email") var emails = ""
    @AppStorage("password") var passwords = ""

    @AppStorage("log_Status") var status = false
    
    // User choose bio and type name
    
    @AppStorage("after_log_signuup") var logOrSignup = false
    @AppStorage("log_Status") var logins = false

    
    // Loading ...
    
    @Published var isLoading = false
    
    
    func checkEmailAndPassword() -> Bool {
        
        if email.isValidEmail && password.count >= 8 {
           return true
        }
        return false
        
    }
    
    func checkEmailAndPasswordAndRepeat() -> Bool {
        
        if email_SignUp.isValidEmail && password_SignUp.count >= 8 && reEnterPassword == password_SignUp{
           return true
        }
        return false
        
    }
    
    func resetPassword(){
        
        let alert = UIAlertController(title: "Reset Password", message: "Enter Your E-Mail ID To Reset Your Password", preferredStyle: .alert)
        
        alert.addTextField { (password) in
            password.placeholder = "Email"
        }
        
        let proceed = UIAlertAction(title: "Reset", style: .default) { (_) in
            
            // Sending Password Link...
            
            if alert.textFields![0].text! != ""{
                
                withAnimation{
                    
                    self.isLoading.toggle()
                }
                
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!) { (err) in

                    withAnimation{

                        self.isLoading.toggle()
                    }

                    if err != nil{
                        self.alertMsg = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }

                    // ALerting User...
                    self.alertMsg = "Password Reset Link Has Been Sent !!!"
                    self.alert.toggle()
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
        // Presenting...
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    
    // Login...
    
    func login(){
        
        // checking all fields are inputted correctly...
        
        if email == "" || password == ""{
            
            self.alertMsg = "Fill the contents properly !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in

            withAnimation{

                self.isLoading.toggle()
            }

            if err != nil{

                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }

            // checking if user is verifed or not...
            // if not verified means lgging out...

            let user = Auth.auth().currentUser

            if !user!.isEmailVerified{

                self.alertMsg = "Please Verify Email Address!!!"
                self.alert.toggle()
                // logging out...
                try! Auth.auth().signOut()

                return
            }
//
//            // setting user status as true....
//
            withAnimation{
//                self.emails=self.email
//                self.passwords=self.password
                self.logOrSignup = true
                self.logins = true
            }
        }
    }
    
    // SignUp..
    
    func signUp(){
        
        // checking....
        
        if email_SignUp == "" || password_SignUp == "" || reEnterPassword == ""{
            
            self.alertMsg = "Fill contents proprely!!!"
            self.alert.toggle()
            return
        }
        
        if password_SignUp != reEnterPassword{
            
            self.alertMsg = "Password Mismatch !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            
            
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: email_SignUp, password: password_SignUp) { (result, err) in

            withAnimation{

                self.isLoading.toggle()
            }

            if err != nil{
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }

            // sending Verifcation Link....

//            result?.user.sendEmailVerification(completion: { (err) in
//
//                if err != nil{
//                    self.alertMsg = err!.localizedDescription
//                    self.alert.toggle()
//                    return
//                }
//
//                // Alerting User To Verify Email...
//
//                self.alertMsg = "Email Verification Has Been Sent !!! Verify Your Email ID !!!"
//                self.alert.toggle()
//            })
        
        withAnimation{
//            self.emails=self.email
//            self.passwords=self.password
            self.logOrSignup = true
        }
        }
    }
    
    // log Out...
    
    func logOut(){
        
        try! Auth.auth().signOut()
        
        withAnimation{
//            self.emails=""
//            self.passwords=""
            self.status = false
            self.logOrSignup = false
        }
        
        // clearing all data...
        
        email = ""
        password = ""
        email_SignUp = ""
        password_SignUp = ""
        reEnterPassword = ""
    }
    
}
