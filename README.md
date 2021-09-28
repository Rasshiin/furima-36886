# README

# テーブル設計

## user テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| family_name        | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name         | string   | null: false               |
| first_name_kana    | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | datetime | null: false               |


### Association

 has_many :items
 has_many :purchase_histories

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| postage_load_id    | integer    | null: false                    |
| items_condition_id | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| shipment_day_id    | integer    | null: false                    |

### Association

 has_one :purchase_history
 belongs_to :user

## purchase_histories テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |


### Association

 belongs_to :items
 belongs_to :user
 has_one :residence

## residence テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone        | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

 belongs_to :purchase_history