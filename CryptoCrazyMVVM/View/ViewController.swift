//
//  ViewController.swift
//  CryptoCrazyMVVM
//
//  Created by MAKAN on 27.07.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colorArray = [UIColor]()
    
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 75/255, green: 57/255, blue: 240/255, alpha: 1.0),
            UIColor(red: 15/255, green: 147/255, blue: 173/255, alpha: 1.0),
            UIColor(red: 104/255, green: 169/255, blue: 24/255, alpha: 1.0),
            UIColor(red: 104/255, green: 127/255, blue: 10/255, alpha: 1.0),
            UIColor(red: 19/255, green: 57/255, blue: 67/255, alpha: 1.0),
            UIColor(red: 90/255, green: 67/255, blue: 80/255, alpha: 1.0),
        ]
        
        
        getData()
    }
    
    func getData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {  //Optional olmaktan cikardik.
                
            
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection() //nil olup olmadigini kontrol ettik.
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        
        //ARKA PLAN RENKLENDIRME ISLEMI.
        
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        
        
        return cell
        
    }
}

