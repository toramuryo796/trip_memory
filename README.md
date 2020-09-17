# Trip Memory

## アプリケーション概要
旅行などが好きで、想い出を記録したい人をターゲットにし、グループで旅行の行先候補から計画を共有でき、
思い出を記録する事ができるアプリです。

## デプロイ済みURL

## テスト用アカウント
- ユーザーID: ishida 
  email: ishida@gmail.com
  password: asd123

- ユーザーID: masuda
  email: masuda@gmail.com
  password: asd123

## 利用方法
グループを作成後、行先の候補をそれぞれ出していき、一覧で出します。
その際に、候補に挙げた理由や目的を記載する事で、プレゼンができるようになっています。
行先候補の中から、全員で旅行先を決定したら、「行きたい！」ボタンを押して計画を立てる事ができます。
(行先候補にないものでも、直接計画を立てる事ができます)
計画では出発日、交通機関情報、ホテル情報を記載し、いちいち交通機関やホテルの予約確定画面を確認せずとも、
このアプリだけでまとめて確認できるようになています。
また、日毎のスケジュールやその地域の言葉をメモできる単語帳といった機能もあります。
旅行後は、想い出を記録する事で、旅行での想い出をいつでも確認する事ができます。

## 目指した課題解決
友人・家族と旅行に行きたいけど、なかなか行先が決まらない、
旅行時の交通期間やホテルについて、毎度予約完了画面で確認するのがめんどくさい、
旅行の想い出を記録したい
上記のような悩みをまとめて解決ことを目指しました。

## 要件定義
### ユーザー機能
  ~ 目的 ~
  アプリ内でユーザーを特定する

  ~ 詳細 ~
  deviseを使用し、ユーザー機能を実装しました。

  ~ ストーリー ~
  - ユーザーidとメールアドレス、パスワードを入力すると新規登録できます。
  - ログイン時にはメールアドレスとパスワードが正しく入力できればログインできます。
  - ユーザーの詳細ページには、思い出に記録している写真や下記の各ページへのリンクが表示されており、押下するとページが遷移します。


## 機能
- ユーザー登録/ログイン機能
- グループ作成機能
- 行先候補機能
- 旅行計画機能
- 単語帳記録機能
- スケジュール作成機能
- 想い出記録機能

## 実装予定の機能
- いいね機能
- 日記機能
- 持ち物リスト機能

## ローカルでの動作方法
git clone https://github.com/toramuryo796/trip_memory.git


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
