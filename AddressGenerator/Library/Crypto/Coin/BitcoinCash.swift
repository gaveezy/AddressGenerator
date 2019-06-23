//
//  BitcoinCash.swift
//  AddressGenerator
//
//  Created by Hai Nguyen on 5/20/19.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

class BitcoinCash {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension BitcoinCash: CoinAware {
    func generate() throws -> Account {
        let pair = try KeyPairGenerator().generate()
        let address = try Pay2PubKeyHashGenerator().generate(publicKey: pair.publicKey, prefix: 0x00)
        let wif = try WalletImportFormatGenerator().generate(privateKey: pair.privateKey, prefix: 0x80)
        let qAddress = try BitcoinCashGenerator().toQAddress(address: address)
        
        return try Account(
            rawPrivateKey: pair.privateKey.hexDump().toString(),
            rawPublicKey: pair.publicKey.hexDump().toString(),
            address: address,
            alternativeAddress: qAddress,
            walletImportFormat: wif
        )
    }
}
