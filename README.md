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
- has_many :items


## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | -------------------------------|
| title       | string     | null: false                    |
| price       | integer    | null: false                    |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| shipping_id | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :purchase

## purchases テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

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
