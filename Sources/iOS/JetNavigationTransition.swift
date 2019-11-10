//
//  Проект: JetNavigation
//  Файл: JetNavigationTransition.swift
//  Создал: Егор Бойко
//  Дата: 10.11.2019
//
//  Статус: #В процессе | #Не оформлен
//
import SwiftUI

///Переходы между представлениями
public enum JetNavigationTransition {
    
    public typealias Transitions = (
        backward: AnyTransition,
        forward: AnyTransition,
        opacity: AnyTransition,
        identity: AnyTransition
    )
    
    case none, `default`
    case single(AnyTransition)
    case full(AnyTransition, AnyTransition)
    
    static internal var transitions: Self.Transitions =
    (
        .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)),
        .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)),
        .opacity,
        .identity
    )
}
