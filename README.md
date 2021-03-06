# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| real_family_name    | string | null: false |
| real_first_name     | string | null: false |
| reading_family_name | string | null: false |
| reading_first_name  | string | null: false |
| birthday            | date   | null: false |


- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| name              | string     | null: false                    |
| content           | text       | null: false                    |
| condition_id      | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| delivery_days_id  | integer    | null: false                    |
| price             | integer    | null: false                    |

### Association

- has_one  :order
- belongs_to : user
- has_many :comments
- belongs_to_active_hash  ：condition
- belongs_to_active_hash  ：prefecture
- belongs_to_active_hash  ：category
- belongs_to_active_hash  ：delivery_fee
- belongs_to_active_hash  ：delivery_days

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| comment      | text       |                                |

### Association

- belongs_to :item
- belongs_to :user

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one  :delivery

## deliveries テーブル
 
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true | 
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| tell          | string     | null: false                    |

### Association

- belongs_to :order
- belongs_to_active_hash  ：prefecture