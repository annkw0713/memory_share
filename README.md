# アプリケーション名

**Memory Share**

# アプリケーション概要

日々の思い出(写真や動画付き)を作成して、ユーザー同士で共有できるアプリケーション

# URL

https://memory-share.onrender.com

# テスト用アカウント
- Basic認証ID：memory
- Basic認証パスワード：share
- メールアドレス：
- パスワード：

# 利用方法

作成中

# アプリケーションを作成した背景

作成中

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/1LTaf4_Yp09ttkUKZyMk2OvjKNnW2GZuZixkwVrXAofs/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明

作成中

# 実装予定の機能

作成中

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/74e06a3734bb8a44b2418d849dafb1b0.png)](https://gyazo.com/74e06a3734bb8a44b2418d849dafb1b0)

# 画面遷移図

作成中

# 開発環境

・フロントエンド  
・バックエンド  
・インフラ  
・テスト  
・テキストエディタ  
・タスク管理

# ローカルでの動作方法

% git clone https://github.com/annkw0713/memory_share.git  
% cd memory_share  
% bundle install  
% yarn install

# 工夫したポイント

作成中

---
以下、開発用の記述

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

## memoriesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| date              | date       | null: false                    |
| person            | string     | null: false                    |
| place             | string     | null: false                    |
| description       | text       | null: false                    |
| user_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| memory_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memory

## relationshipテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| following_id       | references | null: false, foreign_key: true |
| follower_id        | references | null: false, foreign_key: true |

### Association

- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following