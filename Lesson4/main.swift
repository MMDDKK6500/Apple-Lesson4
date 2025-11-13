//
//  main.swift
//  Lesson4
//
//  Created by JOAO DUQUE NARDELLI WANDERMUREN on 13/11/25.
//

import Foundation

// Funções!!!
/*
func minhaFuncao() {
    print("Uma função")
}

func funcaoParametrada(numero: Int, texto: String) {
    
}

minhaFuncao()
funcaoParametrada(numero: 2, texto: "Meu Texto")


// Função retornada

func rolarDado() -> Int {
    return Int.random(in: 1...6)
}

print(rolarDado())


// Função retornando tuplas

func getUser() -> (primeiroNome: String, ultimoNome: String) {
    (primeiroNome: "Taylor", ultimoNome: "Swift")
}

let user = getUser()
print("Name: \(user.primeiroNome) \(user.ultimoNome)")

// OU

let (primeiroNome, ultimoNome) = getUser()
print("Nome: \(primeiroNome) \(ultimoNome)")


// Ignorar retornos

let (primeironome, _) = getUser()
//Quando deve-se utilziar Array, Set ou Tupla no Swift?


// Customizar labels

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let retorno = isUppercase("aaa")


// Default values

func printTabelaMult(vezes number: Int, fim: Int = 12) {
    for i in 1...fim {
        print("\(i) * \(number) é \(i * number)")
    }
}

printTabelaMult(vezes: 8)
printTabelaMult(vezes: 8, fim: 20)


// Error Handling

enum PasswordError: Error {
    case short, obvious
}

func verificarSenha(_ senha: String) throws -> String {
    if senha.count < 5 {
        throw PasswordError.short
    }
    
    if senha == "12345" {
        throw PasswordError.obvious
    }
    
    if senha.count < 8 {
        return "Ok"
    } else if senha.count < 10 {
        return "Bom"
    } else {
        return "Ótimo"
    }
}

let texto = "12345"
do {
    let result = try verificarSenha(texto)
    print("Nota da senha: \(result)")
} catch {
    print("Erro ao verificar senha")
}

*/
// Atividades!


//Dano
func calcDano(_ poder: Int, _ mult: Int) -> Int {
    return poder * mult
}

if let entrada1 = readLine(), let poder = Int(entrada1), let entrada2 = readLine(), let mult = Int(entrada2) {
    let danoTotal = calcDano(poder, mult)
    print("Dano causado: \(danoTotal)")
}


// Pós

func calcVida(_ atual: Int, _ dano: Int) -> Int {
    return atual - dano
}

if let entrada1 = readLine(), let vida = Int(entrada1), let entrada2 = readLine(), let dano = Int(entrada2) {
    let vidaRest = calcVida(vida, dano)
    if vidaRest <= 0 {
        print("Personagem derrotado")
    } else {
        print("Vida restante: \(vidaRest)")
    }
}

