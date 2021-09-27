# README

# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | datetime | null: false               |


### Association

 has_many :items
 has_many :comments

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| category        | string     | null: false                    |
| price           | int        | null: false                    |
| seller          | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| items_status    | string     | null: false                    |
| explanation     | text       | null: false                    |
| shipment_source | string     | null: false                    |
| postage         | string     | null: false                    |
| shipment        | datetime   | null: false                    |

### Association

 has_many :comments
 belongs_to :user

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       |                                |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

 belongs_to :room
 belongs_to :user