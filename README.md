# README

# テーブル設計

## users テーブル

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
 has_one :purchase_history
 has_one :residence

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| seller             | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| postage_load_id    | integer    | null: false                    |
| items_condition_id | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| shipment_day_id    | integer    | null: false                    |

### Association

 has_one :purchase_history
 has_one :residence
 belongs_to :user

## purchase_history テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase_date | datetime   | null: false                    |
| user          | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |

### Association

 belongs_to :items
 belongs_to :users

## residence テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

 belongs_to :users