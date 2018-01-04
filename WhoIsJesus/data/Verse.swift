//
//  phrases.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 03/01/18.
//  Copyright © 2018 Jean  Carlos. All rights reserved.
//

import Foundation

class Verse {
    
    private var randomNumber: Int = 0
    private let gospels = [
        0: "Mt",
        1: "Lc"
    ]
    
    var verse: String = ""
    var book: String = ""
    var chapterNumber: Int = 0
    var verseBeginNumber: Int = 0
    var verseEndNumber: Int = 0
    
    init(randomNumber: Int) {
        self.randomNumber = randomNumber
        
        let phrases =  [
            "Está escrito: Não só de pão vive o homem, mas de toda a palavra que procede da boca de Deus.+Mt+4+4,0",
            "Está escrito: Não botarás à prova o Senhor teu Deus.+Mt+4+7,0",
            "Está escrito: Adorarás o Senhor teu Deus, e só a ele servirás.+Mt+4+10,0",
            "Se arrependa, pois o Reino dos céus está próximo.+Mt+4+17,0",
            "Vinde após mim e vos farei pescadores de homens.+Mt+4+19,0",
            "Bem-aventurados os que têm um coração de pobre, porque deles e o Reino dos céus.+Mt+5+3,0",
            "Bem-aventurados os que choram, porque serão consolados!+Mt+5+4,0",
            "Bem-aventurados os mansos, porque possuirao a terra!+Mt+5+5,0",
            "Bem-aventurados os que têm fome, porque serão saciados!+Mt+5+6,0",
            "Bem-aventurados os que misericordiosos, porque alcançarão misericórdia.+Mt+5+7,0",
            "Bem-aventurados os puros de coração, porque verão Deus!.+Mt+5+8,0",
            "Bem-aventurados os pacíficos, porque serão chamados filhos de Deus!.+Mt+5+9,0",
            "Bem-aventurados os os que são perseguidos por causa da justiça, porque deles é o Reino de Deus!.+Mt+5+10,0",
            "Bem-aventurados sereis quando vos caluniarem, quando vos perseguirem e disserem falsamente todo o mal contra vós por causa de mim. Alegrai-vos, porque será grande a vossa recompensa nos céus, pois assim perseguiram os profetas que vieram antes de vós.+Mt+5+11,12",
            "Vós sois o sal da terra. Se o sal perde o sabor, como poderá restaurar-lhe o sabor? Para nada mais serve senão para ser lançado fora e pisado pelos homens.+Mt+5+13,0",
            "Vós sois a luz do mundo. Não se pode esconder uma cidade situada sobre uma montanha nem se acende uma luz para colocá-la debaixo de um recipiente, mas sim para colocá-la na lamparina, a fim de que brilhe a todos os que estão em casa. Assim, brilhe vossa luz diante dos homens, para que vejam as vossas boas obras e glorifiquem vosso Pai que está nos céus.+Mt+5+14,16",
            ]
        
        
        for (index, value) in gospels  {
            if (index == self.randomNumber) {
                
                // Filter book
                let filtered = phrases.filter { $0.contains("+" + value + "+") }
                
                // Select a random based filtered list size.
                let randomNumber = arc4random_uniform(UInt32(phrases.count))
                
                if filtered.count > 0 {
                    let result = filtered[Int(randomNumber)].split(separator: "+")
                    
                    self.verse = String(result[0])
                    self.book = String(result[1])
                    self.chapterNumber = Int(result[2])!
                    
                    // Extracts the begin and the end of the verse.
                    let range = result[3].split(separator: ",")
                    self.verseBeginNumber = Int(range[0])!
                    self.verseEndNumber = Int(range[1])!
                }
            }
        }
    }
}
