//
//  LexiconFieldTypeDefinition.swift
//  SwiftAtProtoLexicon
//

protocol LexiconFieldTypeDefinition {
    init(from decoder: Decoder) throws
    
    func encode(to encoder: Encoder) throws
}

