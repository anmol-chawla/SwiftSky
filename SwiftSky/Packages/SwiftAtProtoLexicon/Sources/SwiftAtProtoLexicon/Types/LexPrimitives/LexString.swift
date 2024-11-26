//
//  LexString.swift
//  SwiftAtProtoLexicon
//
//

enum StringFormat: String, Codable {
    case DATETIME           = "datetime"
    case URI                = "uri"
    case AT_URI             = "at-uri"
    case DID                = "did"
    case HANDLE             = "handle"
    case AT_IDENTIFIER      = "at-identifier"
    case NSID               = "nsid"
    case CID                = "cid"
    case LANGUAGE           = "language"
    case TID                = "tid"
    case RECORD_KEY         = "record-key"
}

struct LexString: BaseLexiconType, Codable {
    var type: LexiconType { .STRING }
    let format: StringFormat?
    let description: String?
    let `default`: String?
    let minLenght: Int?
    let maxLength: Int?
    let minGraphemes: Int?
    let maxGraphemes: Int?
    let `enum`: [String]?
    let const: String?
    let knownValues: [String]?

    private enum TypedCodingKeys: String, CodingKey {
        case type
        case format
        case description
        case `default`
        case minLenght
        case maxLength
        case minGraphemes
        case maxGraphemes
        case `enum`
        case const
    }
}
