//
//  LoginView.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 31/3/23.
//

import SwiftUI


struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        //        Text("LoginViwew. No se implementa para este ejercio")
        //        Text("instalo la libreria Keychain para el almacenamiento seguro de las passwords etc. con set y get")
        
        ZStack {
            
            //            Background image
            Image(decorative: "background")
                .resizable()
                .opacity(1)
            
            
            Image(decorative: "")
                .resizable()
                .background(Color.black)
                .opacity(0.2)
            
            VStack{
                
                //        Text("LoginViwew. No se implementa para este ejercio")
                //        Text("instalo la libreria Keychain para el almacenamiento seguro de las passwords etc. con set y get")
                Image(decorative: "title")
                    .resizable()
                    .frame(width: 300)
                    .scaledToFit()
                    .padding(.top, 170)
                Spacer()
                
                VStack{
                    TextField("Email", text:$email)
                        .padding(10)
                        .background(.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10.0)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                        .id(1)// id sirve para el testing UI
                    
                    SecureField("Password", text:$password)
                        .padding(10)
                        .background(.white)
                        .foregroundColor(.blue)
                        .cornerRadius(10.0)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                        .id(2)// id sirve para el testing UI
                    
                    
                    //                    Boton
                    Button{
                        //TODO: Login here to ViewModel
                        
                    }  label:  {
                        Text("Entrar")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top)
                            .frame(width: 300, height: 300)
                            .background(Color.red)
                            .cornerRadius(15.0)
                            .shadow(radius: 10.0, x:20, y:10)
                        
                    }
                    .padding(.top, 50)
                    .opacity(0.8)
                    .id(3)
                    
                }
                
                       .padding([.leading, .trailing], 20)
                           
                           
                           
                           Spacer()
                           
                       }
                       
                   }
                   .ignoresSafeArea()
               
                   
               }
           }
    
        struct LoginView_Previews: PreviewProvider {
            static var previews: some View {
                LoginView()
                    .environment(\.locale, .init(identifier:"es"))
                /* LoginView()
                 .environment(\.locale, .init(identifier:"en"))
                 */
            }
        }
        
        
        
        
