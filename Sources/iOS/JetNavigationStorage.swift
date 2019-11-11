//
// Project: JetNavigation
// File: JetNavigationStorage.swift
// Created by: Egor Boyko
// Date: 11.11.2019
//
// Status: #In progress | #Not decorated


internal struct JetNavigationStorage {
    
    ///View storage
    private var _storage: [JetNavigationViewWrapper] = []
    
    ///Add view
    mutating internal func append(_ view: JetNavigationViewWrapper){
        self._storage.append(view)
    }
    
    ///Remove all views
    mutating internal func removeAll() {
        self._storage.removeAll()
    }
    
    ///Remove last view
    mutating internal func removeLast() {
        if self._storage.count > 0 { self._storage.removeLast() }
    }
    
    ///Last view
    internal var last: JetNavigationViewWrapper? { self._storage.last }
    
    mutating internal func move(tag: String) {
        guard
            let index = self.getIndex(tag)
        else {
            self.removeLast()
            return
        }
        self._storage.append(self._storage.remove(at: index))
    }
    
    private func checkTag(tag: String) -> Bool {
        !(getIndex(tag) == nil)
    }
    
    private func getIndex(_ tag: String) -> Int? {
        self._storage.firstIndex(where: { $0.id == tag })
    }
}

