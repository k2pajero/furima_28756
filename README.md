# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| real_name    | string | null: false |
| reading_name | string | null: false |

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| user              | string | null: false |
| image             | string | null: false |
| item_name         | string | null: false |
| content           | text   | null: false |
| condition         | string | null: false |
| delivery_fee      | string | null: false |
| delivery_origin   | string | null: false |
| delivery_days     | string | null: false |
| price             | string | null: false |

### Association

- has_one  :orders
- belongs_to : users
- has_many :tags, through: item_tags
- has_many :comments

## item_tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :tags

## tags テーブル

| Column  | Type       | Options  |
| ------- | ---------- | -------- |
| content | string     |          |

### Association

- belongs_to :items, through: item_tags

## comments テーブル

| Column  | Type       | Options  |
| ------- | ---------- | -------- |
| content | string     |          |

### Association

- belongs_to :items

## orders テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user         | string | null: false |
| item         | string | null: false |
| delivery     | string | null: false |
| buy_date     | date   | null: false |

### Association

- belongs_to :items
- belongs_to :users
- has_one  :deliveries

## deliveries テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| order         | string | null: false |
| postal_code   | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string | null: false |
| tell          | string | null: false |

### Association

- belongs_to :orders