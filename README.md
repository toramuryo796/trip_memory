# テーブル設計

## Users テーブル
| Column                | type    |   Options    |
|-----------------------|---------|--------------|
| nickname              | string  | null: false  |
| email                 | string  | null: false  |
| password              | string  | null: false  |
| password_confirmation | string  | null: false  |

### Association

- has_many :groups
- has_many :candidates
- has_many :plans
- has_many :user_groups
- has_many :memories

##  Groupsテーブル
| Column | type    |   Options    |
|--------|---------|--------------|
| name   | string  | null: false  |

### Association

- has_many :candidates
- has_many :plans
- has_many :memories
- has_many :user_groups

##  User_groupsテーブル
| Column           | type        |   Options                       |
|------------------|-------------|---------------------------------|
| user             | references  | null: false, foreign_key: true  |
| group            | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :group

###  Candidates テーブル
| Column                   | type      |   Options                     |
|--------------------------|-----------|-------------------------------|
| budget                   | int       | null: false                   |
| night                    | str       | null: false                   |
| destination              | str       | null: false                   |
| reason                   | text      | null: false                   |
| transportation_id        | int       | null: false                   |
| take_time                | int       | null: false                   |
| trans_cost               | int       | null: false                   |
| decision                 | boolean   | null: false, default: false   |
| user                     | references| null: false, foreign_key: true|
| group                    | references| null: false, foreign_key: true|
| plan                     | references| null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :group
- belongs_to :plan

## Plans テーブル
| Column            | type       |   Options                      |
|-------------------|------------|------------------------------- |
| title             | str        | null: false                    |
| destination       | str        | null: false                    |
| departure_day_id  | date       | null: false                    |
| return_day_id     | date       | null: false                    |
| hotel             | str        | null: false                    |
| hotel_memo        | str        | null: false                    |
| transportation_id | int        | null: false                    |
| ticket            | text       | null: false                    |
| user              | references | null: false, foreign_key: true |
| group             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group
- has_many   :plans
- has_many   :brings
- has_many   :purposes
- has_many   :Schedules

## Brings テーブル

| Column         | type       |   Options                      |
|----------------|------------|--------------------------------|
| things         | string     | null: false                    |
| plan           | references | null: false                    |

### Association

-belongs_to :plan

## purpose テーブル
| Column         | type       |   Options                      |
|----------------|------------|--------------------------------|
| title          | string     | null: false                    |
| must           | string     | null: false                    |
| want           | string     | null: false                    |
| can            | string     | null: false                    |
| free           | string     | null: false                    |
| plan           | references | null: false                    |

### Association

-belongs_to :plan

## schedules テーブル
| Column         | type       |   Options                      |
|----------------|------------|--------------------------------|
| date           | datetime   | null: false                    |
| program        | string     | null: false                    |
| plan           | references | null: false, foreign_key: true |

### Association

-belongs_to :plan

## memories テーブル

| Column         | type       |   Options                      |
|----------------|------------|--------------------------------|
| record         | text       | null: false                    |
| plan           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| group          | references | null: false, foreign_key: true |
| photo          | str        | null: false                    |

### Association

- belongs_to :group
- belongs_to :user
