# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birthday   | integer| null: false |

### Association

- has_many :purchases
- has_many :listings

## items テーブル

| Column     | Type               | Options                        |
| ---------- | ------------------ | ------------------------------ |
| image      | ActiveStorageで実装 | null: false                    |
| title      | string             | null: false                    |
| price      | integer            | null: false                    |
| soldout_is | boolean            |                                |


### Association

- belongs_to :listing
- belongs_to :purchase

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| credit_card_id| references | null: false, foreign_key: true |
| delivery_id   | references | null: false, foreign_key: true |

### Association

- has_one :item
- has_one :credit_card
- has_one :delivery

## credit_cards テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| number          | integer | null: false |
| expiration_date | integer | null: false |
| security_code   | integer | null: false |

### Association

- belongs_to :purchase

## deliveries テーブル

| Column       | Type    | Options                        |
| ------------ | --------| ------------------------------ |
| postal_code  | integer | null: false                    |
| prefectures  | string  | null: false                    |
| municipality | string  | null: false                    |
| address      | string  | null: false                    |
| building     | string  | null: false                    |
| phone_number | intger  | null: false                    |

### Association

- belongs_to :purchase

## listings テーブル

| Column     | Type   | Options     |
| ---------- | ------------------ | ------------------------------ |
| image      | ActiveStorageで実装 | null: false                    |
| title      | string             | null: false                    |
| text       | text               | null: false                    |
| category   | string             | null: false                    |
| state      | string             | null: false                    |
| shipping   | string             | null: false                    |
| area       | string             | null: false                    |
| days       | integer            | null: false                    |

### Association

- has_one :item
- belongs_to :user