//
//  keyChain.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 31/3/23.
//

import Foundation
import KeychainSwift

//creamos funciones globales
//para no tener problemas de persistencia de datos los convertimos a utf8
//si queremos guardar un valor en el keychain

func saveKC(key:String, value:String) -> Bool{
    
    if let data = value.data(using: .utf8){
        let keychain = KeychainSwift()
        keychain.set(data,forKey: key)
        return true
    }else{
        return false
    }
}
/// cargar una clavedel keychain
/// - Parameter key: clave única en el keychain de un valor.
func loadKC(key: String) -> String? {
    
    let keychain = KeychainSwift()
    if let data = keychain.get(key){
        return data
    }else{
        return ""
    }
    
}

/// Eliminacion de una clave del keychain
/// - Parameter key: clave única en el keychain de un valor.
func deleteKC(key: String){
    
    let keychain = KeychainSwift()
    keychain.delete(key)
}
