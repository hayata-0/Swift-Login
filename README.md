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

## 技術メモ
##### 後は、ビルドをするだけで使用できます。Firebaseの設定は自分自身の環境に合わせて行ってください。

### 英字入力で最初の文字を大文字から小文字にする方法
```html
textField.autocapitalizationType = .none
textView.autocorrectionType = .none
```

### UITextFieldの左側にViewを配置する
```html
textField.leftViewMode = .always
textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
```

> ViewModeには下記の値が設定できます
```html
textField.ViewMode = .never // 出さない
textField.ViewMode = .whileEditing // 編集中のみ出す
textField.ViewMode = .unlessEditing // 編集中意外に出す
textField.ViewMode = .always // 常時出す
```

### UITextField のキーボードの表示・非表示
```html
// UITextFieldを表示
textField.becomeFirstResponder()
// UITextFieldを非表示
textField.resignFirstResponder()
```

### do-catch文について
> エラーが発生する可能性がある処理をdo節内に記述し、エラーが発生するとcatch節に移動します。

* エラーの詳細情報にもアクセスできる
* catch節でエラーを分けることができる(パターンマッチを使用して)
* 優秀な構文

### privateメソッドをSelectorとして指定する場合は@objcが必要
今回の記述の中の例

```html
button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
```
に対して、didTapButtonは下記の様になっています
```html
@objc private func didTapButton() {}
```

このようにprivateメソッドをSelectorに指定する場合は、@objcを忘れてはいけない。
