//
//  LexArray.swift
//  SwiftAtProtoLexicon
//

enum LexArrayItem: Codable {
    // Lex Primitive
    case BOOLEAN(LexBoolean)
    case INTEGER(LexInteger)
    case STRING(LexString)
    case UNKNOWN(LexUnknown)
    
    // Lex Ipld
    case BYTES(LexBytes)
    case CID_LINK(LexCidLink)
    
    // Lex Ref Variant
    case REF(LexRef)
    case REF_UNION(LexRefUnion)
    
    // Other
    case BLOB(LexBlob)
    
    private enum CodingKeys: String, CodingKey {
        case type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        guard let type = try LexiconType(rawValue: container.decode(String.self, forKey: .type)) else {
            throw DecodingError.typeMismatch(
                LexArrayItem.self,
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Expected a single key, found multiple")
            )
        }
        
        switch type {
            case .BOOLEAN : self = try .BOOLEAN(LexBoolean(from: decoder))
            case .INTEGER : self = try .INTEGER(LexInteger(from: decoder))
            case .STRING : self = try .STRING(LexString(from: decoder))
            case .UNKOWN : self = try .UNKNOWN(LexUnknown(from: decoder))
            case .BYTES : self = try .BYTES(LexBytes(from: decoder))
            case .CID_LINK : self = try .CID_LINK(LexCidLink(from: decoder))
            case .REF : self = try .REF(LexRef(from: decoder))
            case .REF_UNION : self = try .REF_UNION(LexRefUnion(from: decoder))
            case .BLOB : self = try .BLOB(LexBlob(from: decoder))
            default: throw DecodingError.typeMismatch(
                LexArrayItem.self,
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Unknown type \(type)")
            )
        }
    }
    
    func encode (to encoder: Encoder) throws {
        switch self {
            case let .BOOLEAN(def): try def.encode(to: encoder)
            case let .INTEGER(def): try def.encode(to: encoder)
            case let .STRING(def): try def.encode(to: encoder)
            case let .UNKNOWN(def): try def.encode(to: encoder)
            case let .BYTES(def): try def.encode(to: encoder)
            case let .CID_LINK(def): try def.encode(to: encoder)
            case let .REF(def): try def.encode(to: encoder)
            case let .REF_UNION(def): try def.encode(to: encoder)
            case let .BLOB(def): try def.encode(to: encoder)
        }
    }
}

struct LexArray: BaseLexiconType, Codable {
    private let _items: Any
    
    var type: LexiconType { .ARRAY }
    var items: LexArrayItem {
        _items as! LexArrayItem
    }
    
    let description: String?
    let minLength: Int?
    let maxLength: Int?
    
    private enum CodingKeys: String, CodingKey {
        case type
        case items
        case description
        case minLength
        case maxLength
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        description = try container.decodeIfPresent(String.self, forKey: .description)
        _items = try container.decode(LexArrayItem.self, forKey: .type)
        minLength = try container.decodeIfPresent(Int.self, forKey: .minLength)
        maxLength = try container.decodeIfPresent(Int.self, forKey: .maxLength)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(items, forKey: .items)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(minLength, forKey: .minLength)
        try container.encodeIfPresent(maxLength, forKey: .maxLength)
    }
}
