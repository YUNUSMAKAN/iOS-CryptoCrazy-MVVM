//
//  Webservice.swift
//  CryptoCrazyMVVM
//
//  Created by MAKAN on 4.09.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping([CryptoCurrency]?) -> ()) { //? Optional yapmak mantikli belki internet kesilir gelir gelmez veri sorun olmamasi acisindan.
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) //Herhangi bir hata varsa data yok dedik.CryptoCurrency dizisi gelmedi diyebiliriz.
                
            }else if let data = data {
                
              let cryptoList = try?  JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                if let cryptoList = cryptoList { //Burdada optionaldan cikardik cryptolisti.
                completion(cryptoList)//Herhangi bir hata yoksa alinan cryptolistdeki veriyi veriyoruz.
                }
            }
        }.resume()//Islemi baslatmamiza olanak sagliyor.
        
    }
    
    
}
