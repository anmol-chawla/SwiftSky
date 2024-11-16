//
//  LexiconType.swift
//  SwiftAtProtoLexicon
//
//  Created by Anmol Chawla on 16/11/24.
//

enum LexiconType: String, Codable {
    case BOOLEAN            = "boolean"
    case INTEGER            = "integer"
    case STRING             = "string"
    
    case BLOB               = "blob"
    case BYTES              = "bytes"
    
    case ARRAY              = "array"
    case OBJECT             = "object"
    case UNION              = "union"
    
    case PROCEDURE          = "prodcedure"
    case QUERY              = "query"
    case RECORD             = "record"
    case REF                = "ref"
    case SUBSCRIPTION       = "subscription"
    case TOKEN              = "token"

    case NULL               = "null"
    case UNKOWN             = "unkown"
}
