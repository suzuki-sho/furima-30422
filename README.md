# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| f_name_kana| string | null: false |
| l_name_kana| string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :purchases
- has_many :listings
- belongs_to :user_item

## users_items テーブル

| Column       | Type      | Options      |
| ------------ | ----------| ------------ |
| user_id      | references| null: false  |
| item_id      | references| null: false  |

## items テーブル

| Column     | Type               | Options      |
| ---------- | ------------------ | -------------|
| image      | ActiveStorageで実装 | null: false  |
| title      | string             | null: false  |
| price      | integer            | null: false  |
| description| text               | null: false  |
| seller     | string             | null: false  |
| category   | string             | null: false  |
| state      | string             | null: false  |
| shipping   | string             | null: false  |
| area       | string             | null: false  |
| days       | integer            | null: false  |
| soldout_is | boolean            | null: false  |


### Association

- belongs_to :user_item
- belongs_to :purchase

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| credit_card_id| references | null: false, foreign_key: true |
| delivery_id   | references | null: false, foreign_key: true |

### Association

- has_one :item
- has_one :delivery
- belongs_to :user

## deliveries テーブル

| Column       | Type    | Options      |
| ------------ | --------| ------------ |
| postal_code  | string  | null: false  |
| prefectures  | string  | null: false  |
| municipality | string  | null: false  |
| address      | string  | null: false  |
| building     | string  |              |
| phone_number | string  | null: false  |

### Association

- belongs_to :purchase
