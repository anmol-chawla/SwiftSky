//
//  LexiconType.swift
//  SwiftAtProtoLexicon
//
//  Created by Anmol Chawla on 16/11/24.
//

enum LexiconType: String, Codable {
    // Lex Primitives
    case BOOLEAN            = "boolean"
    case INTEGER            = "integer"
    case STRING             = "string"
    case UNKOWN             = "unkown"

    case BLOB               = "blob"

    // Lex IP LD
    case BYTES              = "bytes"
    case CID_LINK           = "cid-link"

    case ARRAY              = "array"
    case OBJECT             = "object"

    // Lex Ref
    case REF                = "ref"
    case REF_UNION          = "union"

    case PARAMS             = "params"
    case PROCEDURE          = "prodcedure"
    case QUERY              = "query"
    case RECORD             = "record"
    case SUBSCRIPTION       = "subscription"
    case TOKEN              = "token"

    case NULL               = "null"
}
