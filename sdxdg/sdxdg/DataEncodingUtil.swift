//
//  DataEncodingUtil.swift
//  sdxdg
//
//  Created by lotusprize on 17/4/13.
//  Copyright © 2017年 geekTeam. All rights reserved.
//

import CryptoSwift

class DataEncodingUtil: NSObject {
    
    static let key: Array<UInt8> = [0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00]
    static let iv: Array<UInt8> = AES.randomIV(AES.blockSize)
    
    static func Endcode_AES_ECB(strToEncode:String)->String
    {
        do {
            let encrypted = try AES(key: key, iv: iv, blockMode: .ECB, padding: .pkcs7).encrypt(Array(strToEncode.utf8))
            let encoded = Data(bytes: encrypted)
            return encoded.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        } catch {
            return error as! String
        }
    }
    
    //AES-ECB128解密
    static func Decode_AES_ECB(strToDecode:String)->String?
    {
        let data = Data.init(base64Encoded: strToDecode, options: Data.Base64DecodingOptions.init(rawValue: 0))
        let encrypted = data?.bytes
        do {
            let decrypted = try AES(key: key, iv: iv, blockMode: .ECB, padding:.pkcs7).decrypt(encrypted!)
            return String.init(data: Data.init(bytes: decrypted), encoding: String.Encoding.utf8)
        } catch {
            print(error)
            return ""
        }
        
    }

}
