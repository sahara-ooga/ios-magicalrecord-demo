//
//  ViewController.swift
//  ios-magicalrecord-demo
//
//  Created by k_motoyama on 2017/03/14.
//  Copyright © 2017年 k_moto. All rights reserved.
//

import UIKit
import MagicalRecord

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        insertData()
        selectData()
    }

    // データの追加
    private func insertData(){
        
        if DemoEntity.mr_findAll()!.count < 3 {
            let demoEntity = DemoEntity.mr_createEntity()! as DemoEntity
            demoEntity.demoID = DemoEntity.mr_findAll()!.count + 1
            demoEntity.demoItem = "demoItem:\(demoEntity.demoID)"
            demoEntity.managedObjectContext?.mr_saveToPersistentStoreAndWait()
        }
    }
    
    // データの検索
    private func selectData(){
        let demoEntity = DemoEntity.mr_findAll()!
        
        for demo in demoEntity {
            let demo = demo as! DemoEntity
            print("get_demoID_data = \(demo.demoID)")
            print("get_demoItem_data = \(demo.demoItem!)")
            
        }
        
    }
    
    // データの検索
    private func selectLikeData(){
        
        let predicate = NSPredicate(format: "demoItem CONTAINS % @", "2")
        
        let demoEntity = DemoEntity.mr_findAll(with: predicate)
        
        for demo in demoEntity! {
            let demo = demo as! DemoEntity
            print("get_demoID_data = \(demo.demoID)")
            print("get_demoItem_data = \(demo.demoItem!)")
            
        }
        
    }

    // データの更新
    private func updateData(){
        
        let demoEntityCount = DemoEntity.mr_findAll()!.count
        
        if demoEntityCount  > 0 {
            let demoEntity = DemoEntity.mr_findAll()![0] as! DemoEntity
            demoEntity.demoItem = "update_demoItem:\(demoEntity.demoID)"
            demoEntity.managedObjectContext?.mr_saveToPersistentStoreAndWait()
        }
    }
    
    // データの削除
    private func daleteData(){
        
        let demoEntityCount = DemoEntity.mr_findAll()!.count
        
        if demoEntityCount  > 0 {
            let demoEntity = DemoEntity.mr_findAll()![demoEntityCount - 1] as! DemoEntity
            demoEntity.mr_deleteEntity()
            demoEntity.managedObjectContext?.mr_saveToPersistentStoreAndWait()
        }
    }
}

