//
//  CryptoViewModel.swift
//  CryptoCrazyMVVM
//
//  Created by MAKAN on 6.09.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import Foundation

struct CryptoListViewModel {
    //Burada servisten cekilenlerin komplesini liste halinde gostericek.
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int { //Toplam kac tane cryptocurrency olacagini vericek.
        
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel { //Iki struct i bu sekilde birbirine baglamis oluruz.
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
        
    }
    
}
/*
extension CryptoListViewModel {
    
    func numberOfRowsInSection() -> Int { //Toplam kac tane cryptocurrency olacagini vericek.
        
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel { //Iki struct i bu sekilde birbirine baglamis oluruz.
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
        
    }
    
}*/

struct CryptoViewModel {
    //Burada servisten cekil verileri tek olarak ele alicak.
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
}

/*
extension CryptoViewModel {

var name : String {
       return self.cryptoCurrency.currency
   }
   
   var price : String {
       return self.cryptoCurrency.price
   }

}
*/
