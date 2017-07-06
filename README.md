# ios-magicalrecord-demo
iOS Magical Record を利用したCRUD操作のサンプルです。
MagicalRecordはActive Recordパターンを採用したCoreDataのラッパーです。

## 1. PodFile

```
pod 'MagicalRecord'
```

## 2. CoreDataデータモデルの定義と作成
詳しくは
- https://github.com/k-moto/ios-coredata/wiki
- http://slowquery.hatenablog.com/entry/2014/03/12/212630
<br>を参照。

## 3. Bridging-Headerを作成する
Bridging-Headerを作成して以下を記述する<br>

```
#import "MagicalRecord/MagicalRecord.h"
```

## 4. MagicalRecordの起動・終了処理
AppDelegateに起動・終了処理を追記します。

```
import MagicalRecord

...

func application(_ application: UIApplication, 
didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	//ローカルのSQLiteの初期化
    MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: "MagicalRecordDemo.sql")
    return true
}

...

func applicationWillTerminate(_ application: UIApplication) {
   	//終了処理
    MagicalRecord.cleanUp()
    self.saveContext()
}

```

初期化メソッドはローカルのSQLite用、iCloud用に用意されています。


## 5. データの保存、ロード処理
以下主要メソッドを記載する

## 主要メソッド

|メソッド名|説明|サンプル|
|---|---|---|
|`mr_createEntity` | レコード追加用のEntityを生成する | `nsManagedObject.mr_createEntity()` |
|`mr_findAll` | Entity全てを配列で取得する | `NSManagedObject.mr_findAll()`|
|`mr_findAll(with: NSPredicate)` | 特定のEntityを取得する | `nsManagedObject.mr_findAll(with: NSPredicate)`|
|`mr_numberOfEntities()` | Entity数を取得する | `DemoEntity.mr_numberOfEntities()`|
|`mr_deleteEntity` | Entityを削除する | `nsManagedObject.mr_deleteEntity()`|
|`mr_saveToPersistentStoreAndWait` | Entityの変更を確定する<br>MagicalRecordでデータの保存、更新、削除を反映する際は必ず実行 | `NSManagedObject.managedObjectContext?`<br>`.mr_saveToPersistentStoreAndWait()`|

## 参考
https://github.com/magicalpanda/MagicalRecord
http://slowquery.hatenablog.com/entry/2014/03/12/212630