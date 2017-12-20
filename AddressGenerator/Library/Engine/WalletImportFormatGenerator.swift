import Foundation

// https://en.bitcoin.it/wiki/Wallet_import_format
class WalletImportFormatGenerator {

  func generate(privateKey: Data, prefix: UInt8) throws -> String {
    let extendedKey = privateKey
      .prepend(number: prefix)

    let checksum = try extendedKey
      .sha256()
      .sha256()
      .takeFirst(byteCount: 4)

    return extendedKey
      .append(data: checksum)
      .base58EncodedString()
  }
}
