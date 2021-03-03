## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password | string | null: false |

### Association

* has_many :goals
* has_many :comments
* has_many :lists
* has_many :memos

## goals テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | text   | null: false |
| user   | references | null: false, foreign_key: true |

### Association

* has_many :details
- belongs_to :user


## lists テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| task   | text       | null: false |
| limit  | date       | null: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## details テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| goal    | references | null: false, foreign_key: true |

### Association

- belongs_to :goal

## memos テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| date    | date       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
* has_many :comments

## comments テーブル

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| memo        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memo