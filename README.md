# ios-magicalrecord-demo
iOS Magical Record を利用したCRUD操作のサンプルです。

## 1. PodFile

```
pod 'MagicalRecord'
```

## 2. CoreDataを使用するために設定する

https://github.com/k-moto/ios-coredata/wiki

## 3. Bridging-Headerを作成する
Bridging-Headerを作成して以下を記述する<br>
```
#import "MagicalRecord/MagicalRecord.h"
```

## 4. AppDelegateで初期化する

```
import MagicalRecord

...

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: "MagicalRecordDemo.sql")
    return true
}

...

func applicationWillTerminate(_ application: UIApplication) {
    MagicalRecord.cleanUp()
    self.saveContext()
}

```

## 5. 適当な箇所に実装する
以下主要メソッドを記載する
## 主要メソッド

|メソッド名|説明|サンプル|
|---|---|---|
|mr_createEntity | レコード追加用のEntityを生成する | NSManagedObject.mr_createEntity() |
|mr_findAll | Entityを配列で取得する | NSManagedObject.mr_findAll()|
|mr_findAll(with: NSPredicate) | 特定のEntityを取得する | NSManagedObject.mr_findAll(with: NSPredicate)|
|mr_deleteEntity | Entityを削除する | NSManagedObject.mr_deleteEntity()|
|mr_saveToPersistentStoreAndWait | Entityの変更を確定する | NSManagedObject.managedObjectContext?<br>.mr_saveToPersistentStoreAndWait()|
