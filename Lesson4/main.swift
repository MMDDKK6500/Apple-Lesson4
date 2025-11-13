//
//  Lesson4
//
//  Atividades lá no fundo, em sequencia do swift arena
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

//
//Dano
//
 
func calcDano(_ poder: Int, _ mult: Int) -> Int {
    return poder * mult
}

if let entrada1 = readLine(), let poder = Int(entrada1), let entrada2 = readLine(), let mult = Int(entrada2) {
    let danoTotal = calcDano(poder, mult)
    print("Dano causado: \(danoTotal)")
}


//
// Pós
//
 
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


//
// xp
//
 
func calcXP(_ inimigos: Int, _ xp: Int, _ bonus: Int) -> Int {
    return (inimigos * xp) + bonus
}

if let entrada1 = readLine(), let inimigos = Int(entrada1), let entrada2 = readLine(), let xp = Int(entrada2), let entrada3 = readLine(), let bonus = Int(entrada3) {
    let xpTotal = calcXP(inimigos, xp, bonus)
    print("Experiencia ganha: \(xpTotal)")
}


//
// stats
//
 
if let nome = readLine(), let stats = readLine() {
    let statsArray = stats.split(separator: " ")
    print("Heroi: \(nome) - Vida: \(statsArray[0]), Mana: \(statsArray[1]), Forca: \(statsArray[2])")
}

 
//
// Resultado
//
 
/*func calcXP(_ nivelInimigo: Int) -> Int {
    return nivelInimigo * 10
}

func calcMoedas(_ nivelInimigo: Int) -> Int {
    return nivelInimigo * 5
}*/

func calcRecompensas(_ nivelInimigo: Int) -> (totalXP: Int, totalModeas: Int) {
    (nivelInimigo * 10, nivelInimigo * 5)
}

if let nome = readLine(), let entrada2 = readLine(), let nivelInimigo = Int(entrada2) {
    /*let totalXP = calcXP(nivelInimigo)
    let totalMoedas = calcMoedas(nivelInimigo)
     */
    let (totalXP, totalMoedas) = calcRecompensas(nivelInimigo)
    print("Venceu \(nome)! Ganhou \(totalXP) XP e \(totalMoedas) moedas")
}

//
// level
//
 
func canLevelUp(_ nivelAtual: Int, _ xpAcumulado: Int) -> Bool {
    xpAcumulado >= nivelAtual * 100
}

func xpNecessaria(_ nivelAtual: Int, _ xpAcumulado: Int) -> Int {
    (nivelAtual * 100) - xpAcumulado
}

if let entrada1 = readLine(), let nivel = Int(entrada1), let entrada2 = readLine(), let xp = Int(entrada2) {
    if canLevelUp(nivel, xp) {
        print("Pode subir para o nivel \(nivel + 1)!")
    } else {
        print("Precisa de \(xpNecessaria(nivel, xp)) XP para subir de nivel")
    }
}


//
// Cura -  A dica dessa é interessante, mas pra ficar mais legível o código é melhor fazer direto, acredito
//

// Fix para um erro em um dos testes no swiftarena, que coloca um "\" no fim da ultima entrada, impedindo o readLine de funcionar e falhando o if. Pego de: https://stackoverflow.com/questions/36594179
if let entrada1 = readLine(), let vidaAtual = Int(entrada1.filter("0123456789.".contains)), let entrada2 = readLine(), let vidaMaxima = Int(entrada2.filter("0123456789.".contains)), let entrada3 = readLine(), let curaPocao = Int(entrada3.filter("0123456789.".contains)) {
    
    var novaVida: Int
    
    if curaPocao == 0 {
        novaVida = vidaAtual + 50
    } else {
        novaVida = vidaAtual + curaPocao
    }
    
    if novaVida > vidaMaxima {
        novaVida = vidaMaxima
    }
    
    print("Vida apos pocao: \(novaVida)")
}


//
// Equipamento -- Nesse poderia ter usado um error checking pelo retorno da função, pois a função em sí já se baseia em um if else if, mas realmente as vezes é bom ter um erro handling usando throw catch
//

enum EquipamentoErro: Error {
    case nivelInsuficiente, forcaInsuficiente
}

func checkEquipamento(_ personagem: Array<Int>, _ equipamento: Array<Int>) throws -> Bool {
    if (personagem[0] < equipamento[0]) {
        throw EquipamentoErro.nivelInsuficiente
    } else if (personagem[1] < equipamento[1]) {
        throw EquipamentoErro.forcaInsuficiente
    } else {
        return true
    }
}

if let entrada1 = readLine(), let entrada2 = readLine() {
    let personagem = entrada1.split(separator: " ").map { Int($0)! } // Tranformar em Int
    let equipamento = entrada2.split(separator: " ").map { Int($0)! } // ^
    
    do {
        let check = try checkEquipamento(personagem, equipamento)
        if check {
            print("Equipamento validado com sucesso")
        }
    } catch EquipamentoErro.nivelInsuficiente {
        print("Erro: Nivel insuficiente")
    } catch EquipamentoErro.forcaInsuficiente {
        print("Erro: Forca insuficiente")
    }
    
}


//
// Requisitos
//

enum missaoErro: Error {
    case nivelInsuficiente, experienciaInsuficiente, ouroInsuficiente
}

func checkInfo(_ info: Array<Int>) throws {
    if (info[0] < 20) {
        throw missaoErro.nivelInsuficiente
    } else if (info[1] < 5) {
        throw missaoErro.experienciaInsuficiente
    } else if (info[2] < 1000) {
        throw missaoErro.ouroInsuficiente
    }
}

if let entrada1 = readLine() {
    let aventureiroInfo = entrada1.split(separator: " ").map { Int($0)! } // Tranformar em Int
    
    do {
        try checkInfo(aventureiroInfo)
        print("Missao epica aceita! Boa sorte, heroi!")
    } catch missaoErro.experienciaInsuficiente{
        print("Erro: Experiencia insuficiente em missoes")
    } catch missaoErro.nivelInsuficiente {
        print("Erro: Nivel minimo nao atingido")
    } catch missaoErro.ouroInsuficiente {
        print("Erro: Ouro insuficiente")
    }
    
}


//
// Final -- nos exemplos tá mostrando 4 linhas separadas de input mas o exercisio pede 2 apenas, mas os exemplos mostram testes de 4, fiz as duas versões, a de 2 está embaixo dessa
//

enum erroHeroi: Error {
    case fraco
}

func validarBatalha(_ nivelHeroi: Int, _ nivelMonstro: Int) throws {
    if nivelHeroi < (nivelMonstro / 2) {
        throw erroHeroi.fraco
    }
}

func calcDmg(_ forcaHeroi: Int, _ forcaMonstro: Int) -> (danoCausado: Int, danoRecebido: Int) {
    (forcaHeroi * 2, forcaMonstro * 2)
}

func calcRewards(_ nivelMonstro: Int) -> (xp: Int, moedas: Int) {
    (nivelMonstro * 50, nivelMonstro * 20)
}

if let entrada1 = readLine(), let nivelHeroi = Int(entrada1), let entrada2 = readLine(), let forcaHeroi = Int(entrada2), let entrada3 = readLine(), let nivelMonstro = Int(entrada3), let entrada4 = readLine(), let forcaMonstro = Int(entrada4) {
    do {
        try validarBatalha(nivelHeroi, nivelMonstro)
        let (danoCausado, danoRecebido) = calcDmg(forcaHeroi, forcaMonstro)
        
        if danoCausado >= danoRecebido {
            let (xp, moedas) = calcRewards(nivelMonstro)
            
            print("Vitoria! Dano causado: \(danoCausado), Dano recebido: \(danoRecebido), Recompensas: \(xp) XP e \(moedas) moedas")
        } else {
            print("Derrota! Dano causado: \(danoCausado), Dano recebido: \(danoRecebido)")
        }
    } catch {
        print("Erro: Heroi muito fraco para esta batalha")
    }
}

// Versão que utiliza 2 linhas de input, como pedido pelo exercisio
/*
 enum erroHeroi: Error {
     case fraco
 }

 func validarBatalha(_ heroi: [Int], _ monstro: [Int]) throws {
     if heroi[0] < (monstro[0] / 2) {
         throw erroHeroi.fraco
     }
 }

 func calcDano(_ heroi: [Int], _ monstro: [Int]) -> (danoCausado: Int, danoRecebido: Int) {
     (heroi[1] * 2, monstro[1] * 2)
 }

 func calcRecompensas(_ heroi: [Int], _ monstro: [Int]) -> (xp: Int, moedas: Int) {
     (monstro[0] * 50, monstro[0] * 20)
 }

 if let entrada1 = readLine(), let entrada2 = readLine() {
     let heroi = entrada1.split(separator: " ").map { Int($0)! } // Tranformar em Int
     let monstro = entrada2.split(separator: " ").map { Int($0)! } // ^
     
     do {
         try validarBatalha(heroi, monstro)
         let (danoCausado, danoRecebido) = calcDano(heroi, monstro)
         
         if danoCausado >= danoRecebido {
             let (xp, moedas) = calcRecompensas(heroi, monstro)
             
             print("Vitoria! Dano causado: \(danoCausado), Dano recebido: \(danoRecebido), Recompensas: \(xp) XP e \(moedas) moedas")
         } else {
             print("Derrota! Dano causado: \(danoCausado), Dano recebido: \(danoRecebido)")
         }
     } catch {
         print("Erro: Heroi muito fraco para esta batalha")
     }
 }
*/
