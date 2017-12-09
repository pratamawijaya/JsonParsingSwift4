//
//  ViewController.swift
//  JsonParsing
//
//  Created by Pratama Nur Wijaya on 10/12/17.
//  Copyright © 2017 Pratama Nur Wijaya. All rights reserved.
//

import UIKit

struct VipBitcoin: Decodable {
    public let ticker: Ticker
}

struct Ticker: Decodable {
    let high :String
    let low :String
    let last: String
    let buy: String
    let sell: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURL = "https://vip.bitcoin.co.id/api/ltc_idr/ticker"
        
        guard let url = URL(string: jsonURL) else
          { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check err
            // check response 200
            guard let data = data else {return}
            do{
                let data = try JSONDecoder().decode(VipBitcoin.self, from: data)
                print(data.ticker.high)
                print(data.ticker.low)
                print(data.ticker.last)
            }catch let jsonErr {
                print(jsonErr.localizedDescription)
            }
           
        }.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

