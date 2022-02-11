//
//  AutenticacaoLocal.swift
//  Alura Ponto
//
//  Created by Natanael Alves Pereira on 10/02/22.
//

import Foundation
import LocalAuthentication


class AutenticacaoLocal {
    
    private let authenticatorContext = LAContext()
    private var error: NSError?
    
    func autorizaUsuario(completion: @escaping(_ autenticao: Bool)-> Void){
        if authenticatorContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authenticatorContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "É necessárrio autenticação para apagar um recibo") {sucesso, error in
                
            completion(sucesso)
     }
   }
 }
}
