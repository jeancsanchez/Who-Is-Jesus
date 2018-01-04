//
//  phrases.swift
//  WhoIsJesus
//
//  Created by Jean  Carlos on 03/01/18.
//  Copyright © 2018 Jean  Carlos. All rights reserved.
//

import Foundation
import Alamofire

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
    var handler: (_ venda: Verse) -> ()
    
    init(randomNumber: Int, handler:@escaping (_ venda: Verse) -> ()) {
        self.randomNumber = randomNumber
        self.handler = handler
        
        Alamofire.request("https://gist.githubusercontent.com/jeancsanchez/40d649298aa4f4735982078adc442845/raw/5adf9c40189a56da706bd4ef334dc6ee823e83ee/Jesus.json").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let value = response.result.value {
                let phrases = value as! [String]
                
                for (index, value) in self.gospels  {
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
                            handler(self)
                        }
                    }
                }
            }
        }
    }
}
