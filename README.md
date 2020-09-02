# テーブル設計

## Users テーブル
| Column                | type    |   Options    |
|-----------------------|---------|--------------|
| user_ID              | string  | null: false  |
| email                 | string  | null: false  |
| password              | string  | null: false  |
| password_confirmation | string  | null: false  |

### Association

- has_many :user_groups
- has_many :groups, through: user_groups
- has_many :candidates
- has_many :plans
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
- has_many :users, through: user_groups

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
| reason                   | text      |                               |
| transportation_id        | int       |                               |（ActiveHash）
| take_time                | int       |                               |
| trans_cost               | int       |                               |
| image                    |           |                               |(ActiveStorage)
| decision                 | boolean   | null: false, default: false   |
| user                     | references| null: false, foreign_key: true|
| group                    | references| null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :group
- has_one    :plan

## Plans テーブル
| Column            | type       |   Options                        |
|-------------------|------------|-------------------------------   |
| title             | str        | null: false                      |
| destination       | str        | null: false (candidateから引継ぎ)|
| departure_day     | date       | null: false                      |
| return_day        | date       | null: false                      |
| hotel             | str        |                                  |
| hotel_memo        | text       |                                  |
| transportation_id | int        | null: false (candidateから引継ぎ)|
| ticket            | text       |                                  |
| user              | references | null: false, foreign_key: true   |
| group             | references | null: false, foreign_key: true   |
| candidate         | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :group
- belongs_to :plans
- has_many   :brings
- has_many   :purposes
- has_many   :Schedules
- has_one    :memory

## Brings テーブル

| Column         | type       |   Options                      |
|----------------|------------|--------------------------------|
| thing          | string     | null: false                    |
| plan           | references | null: false, foreign_key: true |

### Association

- belongs_to :plan

## purpose テーブル
| Column         | type       |   Options                      |
|----------------|------------|--------------------------------|
| must           | string     | null: false                    |
| want           | string     | null: false                    |
| can            | string     | null: false                    |
| free           | string     | null: false                    |
| plan           | references | null: false, foreign_key: true |

### Association

- belongs_to :plan

## schedules テーブル
| Column         | type       |   Options                      |
|----------------|------------|--------------------------------|
| date           | datetime   |                                |
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
| image          | str        | null: false                    |(ActiveStorage)

### Association

- belongs_to :group
- belongs_to :user
