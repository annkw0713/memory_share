# アプリケーション名

**Memory Share**

# アプリケーション概要

日々の思い出(写真や動画付き)を作成して、ユーザー同士で共有できるアプリケーション

# URL

https://memory-share.onrender.com

# テスト用アカウント

- Basic認証ID：memory
- Basic認証パスワード：share
- メールアドレス：test@com
- パスワード：testtest

# 利用方法

## 思い出投稿
1. トップページのヘッダーからユーザー新規登録もしくはテスト用アカウントでログインを行う
2. 新しく思い出を投稿するボタンから思い出の情報を入力し、投稿するボタンで投稿する

## コメント投稿
1. これまでに投稿した思い出ボタンからこれまでに投稿した思い出の一覧ページへ遷移する
2. 思い出のタイトルにカーソルを合わせクリックする
3. 思い出の詳細ページへ遷移したらページ下部のコメントフォームに内容を入力し、送信ボタンで投稿する

## フォロー機能
1. トップページのユーザーを検索するフォームにキーワードを入力し、検索ボタンで検索する(何も入力せずに検索ボタンを押すと登録されている全てのユーザーを表示する)
2. 表示されているユーザーの中でフォローしたいユーザーにカーソルを合わせクリックする
3. 該当のユーザーのマイページに遷移したらフォローするボタンを押してフォローする
4. フォローを外したい場合はトップページのフォローしているユーザーボタンから該当のユーザーのマイページへ遷移し、フォローを外すボタンを押す

# アプリケーションを作成した背景

妻に課題をヒアリングしたところ、家族と思い出を共有したいが両親が高齢のためスマホの操作が苦手で気軽に共有できないという課題を抱えていることが判明した。こちらの課題を解決するために、写真や動画付きの日々の思い出を作成してユーザー同士で気軽に共有できるアプリケーションを開発することにした。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1LTaf4_Yp09ttkUKZyMk2OvjKNnW2GZuZixkwVrXAofs/edit#gid=982722306)

# 実装予定の機能

現在、共有されている思い出ページを実装中。  
今後は思い出へのいいね機能や、画像ファイルを選択する際複数のファイルを同時に選択できる機能を実装予定。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/74e06a3734bb8a44b2418d849dafb1b0.png)](https://gyazo.com/74e06a3734bb8a44b2418d849dafb1b0)

# 開発環境

- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法

% git clone https://github.com/annkw0713/memory_share.git  
% cd memory_share  
% bundle install  
% yarn install

# 工夫したポイント

- 複数の画像を投稿できるようにしたこと
- 動画も投稿できるようにしたこと
- 画像と動画をそれぞれプレビューできるようにしたこと

---
※以下、開発用の記述

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :memories
- has_many :comments

- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following

## memoriesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| date              | date       | null: false                    |
| person            | string     | null: false                    |
| place             | string     | null: false                    |
| description       | text       | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| memory    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memory

## relationshipテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| following          | references |            |
| follower           | references |            |

### Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"