//
//  LexiconFieldTypeDefinition.swift
//  SwiftAtProtoLexicon
//
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

protocol LexiconFieldTypeDefinition {
    init(from decoder: Decoder) throws

    func encode(to encoder: Encoder) throws

    func variable(name: String, typeName: String) -> VariableDeclSyntax
}

extension LexiconFieldTypeDefinition {
    func variable(name: String, typeName: String) -> VariableDeclSyntax {
        VariableDeclSyntax(
            modifiers: [
                DeclModifierSyntax(name: .keyword(.public))
            ],
            bindingSpecifier: .keyword(.var)
        ) {
            PatternBindingSyntax(
                pattern: PatternSyntax(stringLiteral: name),
                typeAnnotation: TypeAnnotationSyntax(type: TypeSyntax(stringLiteral: typeName))
            )
        }
    }
}
