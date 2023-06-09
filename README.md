# テーブル設計

## usersテーブル

| Column             | Type   | Options    |
| ------------------ | ------ | ---------- |
| name               | string | null: false|
| email              | string | null: false|
| encrypted_password | string | null: false|

## Association
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## roomテーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null: false|

## Association
- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages


## room_usersテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null: false, foreign_key:true |
| room    | references | null: false, foreign_key:true |

## Association

- belong_to :rooms
- belong_to :users


## messagesテーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| content | string     |                               |
| user    | references | null: false, foreign_key:true |
| room    | references | null: false, foreign_key:true |

## Association

- belong_to :rooms
- belong_to :users