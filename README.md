# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| address            | string | null: false |

### Association

 has_many :items
 has_many :comments

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| category | string     | null: false                    |
| price    | int        | null: false                    |
| seller   | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

 has_many :comments
 belongs_to :user

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     |                                |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

 belongs_to :room
 belongs_to :user