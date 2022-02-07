# Login機能の作成
Swift,Firebaseでのログイン機能実装

### 目的
* swiftとFirebaseを使用してログイン機能を作成し、復習も兼ねて基礎を学び直しました。

### 使用技術
* Swift
* Firebase

### 機能の説明
> 機能はメールアドレスとパスワードでのログインのみです。今回はGoogleアカウントでのログインやfacebookアカウントでのログイン等々は含まれていません。
アカウントがない時の処理や、ログイン時の処理などを主に作成をしました。

## Firebaseの使用方法
1. Podfileに下記を追加
```html
pod 'Firebase/Core'
pod 'Firebase/Auth'
```

2. podをインストールする
```html
pod install
```

3. Firebaseで新しいプロジェクトを作成

4. GoogleService-Info.plist をダウンロードして指定の場所に挿入

5. AppDelegate.swiftにfirebaseをimportする
```html
import Firebase
```

6. AppDelegate.swiftのfunctionの中身を下記にする
```html
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()
      return true
 }
```

## Installation
podをインストールします
```html
pod install
```
##### 後は、ビルドをするだけで使用できます。Firebaseの設定は自分自身の環境に合わせて行ってください。
