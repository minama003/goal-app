# goal-app-30325

## 概要

目標を見やすく保存できるアプリです。
目標、ToDo、メモ

## URL

https://goal-app-30325.herokuapp.com/

## テスト用アカウント

email:dedede@sample
pass:a111111

## 利用方法

今年の目標、達成することを登録しいつでも自分の目に
着くようにするためのアプリです。

## 目指した課題解決

シンプルで見やすい目標設定できるアプリがなかったので、
２０代から３０代の自分の目標が明確にある方の、目標達成に繋がって欲しいです。
（目標が見えるところにあると、見ないより30%達成できると言われています。）

## 要件定義

| 優先順位 | 機能          | 目的       |  詳細           |  ストーリー    |
| ------ | ----------    | -----------|--------------  | ---------- |
| 3      | ユーザー管理機能 | ユーザー登録 | ユーザー登録         | ・ニックネーム、アドレス、パスワードで登録できる |
| 3      | 目標投稿機能    | 目標投稿    | 目標を投稿、削除できる  | ・投稿が分かりやすく、見やすい　・常に現在の時間が表示されている　|
| 2      | TODO投稿機能   | TODO投稿    | TODOを投稿、削除できる | ・チェックボックスと期限を表示することで、見落としをなくす      |        
| 1      | メモ投稿機能    | メモ投稿     |  メモを投稿、削除できる | ・シンプルなメモ（良かったことや、反省点を書けるよう）       |

## 機能

## 実装予定の機能

・日付を逆算しあと何日で今年が終わるかをカウントする機能
・ユーザー同志のスタンプ、コメント機能（グループ作成）

## データベース設計

<img width="760" alt="スクリーンショット 2021-03-12 10 38 43" src="https://user-images.githubusercontent.com/73687141/110878887-5b110900-831f-11eb-82a8-3f8242d88bb4.png">

## 動作方法

Rails 6.0.3.5
Gem 3.2.14

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password | string | null: false |

### Association

* has_many :goals
* has_many :comments
* has_many :lists
* has_many :memos

## goals テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | text   | null: false |
| user   | references | null: false, foreign_key: true |

### Association

* has_many :details
- belongs_to :user


## lists テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| task   | text       | null: false |
| limit  | date       | null: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## details テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| goal    | references | null: false, foreign_key: true |

### Association

- belongs_to :goal

## memos テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| date    | date       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
* has_many :comments

## comments テーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| memo        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memo
