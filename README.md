# 指導者と受講希望者を繋ぐSNS
https://teachme-original.herokuapp.com/

## アカウント
email: tester@gmail.com

password: 111111


## コンセプト
何かを学びたい人と教えられる何かを持っている人を繋いで、技術の向上を目指すことを目的としています。


例えば、サッカー経験者とサッカーのドリブルを教えて欲しい人を繋いだり、私服に自信が無いから買い物に一緒に付き合ってくれる人と服が好きで自信のある人を繋ぐアプリです。

## 実装した機能
#### ○ ユーザー機能

　・ deviseを用いた新規登録機能
    （登録の際に名前、メールアドレス、パスワード、ユーザータイプ、都道府県を登録）

　・ ユーザーログイン機能

　・ ユーザーはマイページにある歯車マークを押すとユーザー情報を編集できる



#### ○ 投稿機能

　・ 受講希望者が指導者に教えてもらいたい事を投稿

　・ 指導者が受講希望者に教えられる事を投稿

　・ 全投稿、指導者投稿、受講者投稿の投稿一覧を見ることができる


#### ○ トークルーム作成機能

　・ ユーザーはやり取りしたい相手のマイページにある「メッセージを送る」ボタンを押すとその人とのトークルームが作成される


#### ○ メッセージ機能

　・ TwitterのDMのように、ユーザーは1対1のメッセージのやり取りが出来る

　・ 受講者同士、指導者同士のやり取りも可能

　・ LINEのように自分が送ったメッセージは緑色になる


## 使用技術

#### 本番環境
　・ Heroku

#### 開発環境
　・ MacOS

#### テストフレームワーク
　・ RSpec

#### DB
　・ MySQL

#### フロントエンド
　・ scss

　・ JavaScript(jQuery)

#### バックエンド
　・ Ruby

　・ Rails

#### ユーザー管理機能
　・ devise

#### ページネーション
　・ kaminari

#### その他
　・ レスポンシブ対応をして768px以上がPC用、767px以下がスマホ用として設定しました。

　・ PC用ではサイドバーから操作ができ、スマホ用ではハンバーガーメニューを作りそこから各種操作ができるようにしました。
