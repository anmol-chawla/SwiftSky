//
//  LexXRPCBody.swift
//  SwiftAtProtoLexicon
//

enum LexXRPCBodySchema: Codable, LexiconFieldTypeDefinition {
        // Lex Ref Variant
    case REF(LexRef)
    case REF_UNION(LexRefUnion)
    
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
            case .REF : self = try .REF(LexRef(from: decoder))
            case .REF_UNION : self = try .REF_UNION(LexRefUnion(from: decoder))
            default: throw DecodingError.typeMismatch(
                LexArrayItem.self,
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Unknown type \(type)")
            )
        }
    }
    
    func encode(to encoder: Encoder) throws {
        switch self {
            case let .REF(def): try def.encode(to: encoder)
            case let .REF_UNION(def): try def.encode(to: encoder)
        }
    }
}

struct LexXRPCBody: Codable {
    private let _schema: Any?

    let description: String?
    let encoding: String?
    var schema: LexXRPCBodySchema? {
        _schema as? LexXRPCBodySchema
    }
    
    private enum CodingKeys: String, CodingKey {
        case description
        case encoding
        case schema
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        description = try container.decodeIfPresent(String.self, forKey: .description)
        _schema = try container.decodeIfPresent(LexXRPCBodySchema.self, forKey: .schema)
        encoding = try container.decodeIfPresent(String.self, forKey: .encoding)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(encoding, forKey: .encoding)
        try container.encodeIfPresent(schema, forKey: .schema)
    }
}
