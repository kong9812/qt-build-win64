# Qt Windows Build & Sample Project
[English](./README_ENG.md)  
このプロジェクトは **Windows 上で Qt をソースからビルド**し、簡単な **Qt サンプルアプリ**を作成・起動するためのテンプレートです。  
Visual Studio + CMake を使用しています。

---

## 📦 特徴

- Qt (qtbase) のソースビルドを自動化  
- Visual Studio 用の CMake プロジェクト生成  
- Qt プラットフォームプラグイン（`qwindows.dll`）を自動コピー  
- CMake による簡単な Qt アプリ開発のベースプロジェクト  

---

## 📁 最終的なディレクトリ構成

```
project-root/
├── .qt/                        # Qt のソースコード（クローンされる）
├── qt/                         # ビルドされた Qt ライブラリ
├── bin/                        # サンプルアプリのビルド出力
├── buildQtAndCreateSampleProject.bat  # Qt のビルド + CMake ビルド自動化
├── cmakeBuild.bat             # CMake ビルド用スクリプト
├── CMakeLists.txt             # CMake プロジェクトファイル
├── main.cpp                   # Qt サンプルアプリのエントリポイント
├── README.md                  # このファイル
└── .gitignore                 # Git 用除外リスト
```

---

## 🛠️ 必要環境

- Windows 10 / 11  
- Visual Studio（2022 / 2019 / その他対応バージョン）  
- Git  
- CMake >= 3.22  

---

## 🚀 ビルド方法

### 1. Qt のビルド + サンプルアプリ作成

以下のバッチファイルを実行するだけでOKです：

```bat
buildQtAndCreateSampleProject.bat
```

このスクリプトは以下を自動で実行します：

- `.qt/` に Qt v6.9.0 をクローン  
- `qt/` に `qtbase` モジュールをビルド  
- `bin/` にサンプルアプリのビルド出力を作成  
- Qt プラットフォームプラグイン（`qwindows.dll`）を `platforms/` フォルダにコピー  

---

## 🔧 Visual Studio バージョンの変更方法

### デフォルト設定

```bat
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
cmake -G "Visual Studio 17 2022"
```

### 他のバージョンを使いたい場合

- **Visual Studio 2019:**

```bat
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
cmake -G "Visual Studio 16 2019"
```

- **Enterprise / Professional エディションを使う場合：**  
  `Community` の部分を `Enterprise` や `Professional` に変更してください。

---

## ⚠️ 注意点

- Qt の他モジュール（Widgets 以外）を使いたい場合は `configure.bat` の引数を調整してください。
- `qwindows.dll` は `./bin/platforms/` に自動コピーされます。  
  `QT_QPA_PLATFORM_PLUGIN_PATH` 環境変数の設定は不要です。

---

## 📄 ライセンス

このプロジェクトは [MIT License](./LICENSE) です。  
ただし、Qt 自体は **LGPL または GPL** ライセンスです。Qt の再配布・商用利用については公式サイトをご確認ください。
