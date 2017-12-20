import Foundation

/// Initial data from https://github.com/MichaelMure/WalletGenerator.net/blob/master/src/janin.currency.js
struct CoinList {

  static let firstCoins: [CoinAware] = [
    Bitcoin(name: "Bitcoin", publicKeyPrefix: 0x00, privateKeyPrefix: 0x80, wifStart: "5", cwifStart: "[LK]"),
    Ethereum(name: "Ethereum")
  ]

  static let coins: [CoinAware] = [
    Bitcoin(name: "", publicKeyPrefix: 0x0, privateKeyPrefix: 0x0, wifStart: "", cwifStart: "")
  ]
}
