# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_one  :profile
- has_one  :card
- has_one  :address


## profiles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_year      | date       | null: false                    |
| birth_month     | date       | null: false                    |
| birth_day       | date       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## cards テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| card_number | integer    | null: false                    |
| valid_manth | integer    | null: false                    |
| valid_year  | integer    | null: false                    |
| cvc         | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | integer    | null: false                    |
| prefecture_code | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| trading_status  | boolean    | null: false                    |
| item            | references | null: false, foreign_key: true |
| user            | references | foreign_key: true              |

### Association

- belongs_to :item
- belongs_to :user


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           |            | null: false                    |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | references | null: false, foreign_key: true |
| condition       | references | null: false, foreign_key: true |
| charge          | references | null: false, foreign_key: true |
| prefecture_code | integer    | null: false                    |
| preparation_day | references | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one    :order
- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :charge
- belongs_to :preparation_day


## categories テーブル

| Column   | Type   | Options     |
| ---------| ------ | ----------- |
| categoly | string | null: false |

### Association

- has_many :items


## conditions テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| condition | string | null: false |

### Association

- has_many :items


## charges テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| charge | string | null: false |

### Association

- has_many :items


## preparation_days テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| preparation_day | string | null: false |

### Association

- has_many :items
