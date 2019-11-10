//
//  Проект: JetNavigation
//  Файл: JetNavigationViewWrapper.swift
//  Создал: Егор Бойко
//  Дата: 10.11.2019
//
//  Статус: #Закончен | #Не оформлен
//

import SwiftUI

///Обертка над представлением, для последующего хранения
internal struct JetNavigationViewWrapper: Equatable, Identifiable {
    
    static internal func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    ///id для доступа к представлению + возможность итерации Identifiable
    internal let id: String
    ///хранимое представление
    internal let view: AnyView
    
    internal init(id: String, view: AnyView){
        self.id = id
        self.view = view
    }

}
