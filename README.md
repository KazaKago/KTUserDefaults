KTUserDefaults
===================

iOS標準のNSUserDefaultsを拡張し、synchronizeが呼ばれることで初めて保存されるよう加工したライブラリです。  
synchronizeを行わないことで事実上のロールバックを可能にし、簡易的なトランザクションを実現します。  
イメージとしてはAndroidのSharedPreferenceと同様の使い方をすることが可能です。  

※UserDefaultsのロック等の排他制御機能は提供しておりません。

##インストール##

###CocoaPods###

Podfile内に以下の一文を追記してpod installを行って下さい。

```
pod 'KTUserDefaults', :git => 'https://github.com/weathercock/KTUserDefaults.git'
```

###マニュアル###

ライブラリ内のKTUserDefaultsフォルダごとXcodeのプロジェクトに取り込んで下さい。

##使い方##

```objc
#import "KTUserDefaults.h"
```

使用するクラスで上記をインポートした後は通常のNSUserDefaultsと同様の使い方が可能です。

```objc
//KTUserDefaults初期化
KTUserDefaults *ktUserDefaults = [KTUserDefaults standardUserDefaults];
//文字列を追加
[ktUserDefaults setObject:"TestString" forKey:@"saved_string"];
//数字を追加
[ktUserDefaults setInteger:32 forKey:@"saved_integer"];

//ここでは未保存です。

//保存を実行
[ktUserDefaults synchronize];

//ここでは保存済みです。
```

##Tips##

保存される順番はKTUserDefaultsへ追加した順番通りとなります。
トランザクションの途中で一旦値を削除したい場合はremoveObjectForKeyメソッドを使用してください

```objc
[ktUserDefaults removeObjectForKey:"saved_key"];
```

##ライセンス##

本ライブラリはMIT Licenseで配布しております。  
詳しくは付属のLICENSEファイルを御覧ください。
