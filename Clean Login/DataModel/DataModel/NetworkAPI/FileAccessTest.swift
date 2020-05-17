//
//  FileAccessTest.swift
//  DataModel
//
//  Created by Ali Jawad on 11/05/2020.
//  Copyright © 2020 Ali Jawad. All rights reserved.
//

import Foundation

fileprivate var tem2: Int = 0

class FileAccessTest {
    private var tem1: Int = 0
}


/*
 Following code shows extended class cannot user private properties/ methods of parent class
 
 class ExtendedAccessTest:  FileAccessTest{
    func temFunc() {
        tem1 //'tem1' is inaccessible due to 'private' protection level
    }
}
*/

/*
 Following code shows fileprivate property of FileAccessTest is not resolved in class of the same file, FileAccessTest2, but fileprivate tem2 is accessable for FileAccessTest2 because the variable and the function are in the same file
 
 class FileAccessTest2 {
    
    func temFunc() {
        tem1 //Use of unresolved identifier 'tem1'
        tem2 = 1
    }
}*/
