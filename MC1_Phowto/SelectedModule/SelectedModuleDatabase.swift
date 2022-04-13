//
//  SelectedModuleDatabase.swift
//  MC1_Phowto
//
//  Created by Ricky on 12/04/22.
//




struct Database{
    private var database: Content?
    private var subModuleDatabase : SubModuleContent?
    
    
    
    init(content: Content, subModuleDatabase: SubModuleContent ){
    
        self.database = content
        self.subModuleDatabase = subModuleDatabase
        
    }
    
    
}

