# アプリケーション名
SimKar

# アプリケーション概要
中傷規模病医療施設用の患者情報管理システム

# URL
https://ekar.onrender.com

# テスト用ログインアカウント
管理者
  ID:12345
  Password:12345

一般使用者
  ID:11111
  Password:11111


# 利用方法
管理者　使用者を登録する
1.ログイン画面からログインする
2.左下にある新規使用者登録から、使用者を登録する
3.ログアウトする
4.作成した使用者のID ,Passwordでログインし、使用者が登録されたかの確認をする
5.ログアウトする

使用者　患者の新規登録、入退院処理を行う
1.ログインする
2.自身の所属先である病棟(ward)の患者リストを確認する
3.左にある新規患者登録から、患者情報を登録する
4.患者の情報が登録されると、病棟（外来）に登録されるので、新規患者が登録されたのか確認する
5.患者の詳細画面に移動し、入院準備処理を行う
6.入院待機中リストに入ったことを確認する
7.入院待機リストの患者リストから、患者を選択する
8.入院処理を行う
9.患者が病棟に移動するので、上部の病棟を、患者リストを該当病棟にし、患者を検索する
10.患者が病棟のリストに現れることを確認する
11.退院対象の患者を病棟患者のリストから選び選択、詳細画面に移動する
12.退院処理を実行する
13.患者が病棟リストになく、外来患者リストに移動したことを確認する
14.ログアウトする


# db設計設計

# テーブル設計

# users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false               |
| employee_id        | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| full_name          | string  | null: false               |
| department_id      | integer | null: false               |
| occupation_id      | integer | null: false               |
| group_id           | integer | null: false               |
| ward_id            | integer | null: false               |

    remove_index :users, column: :email, unique: true
    add_index :users, :employee_id, unique: true

# Association
- belongs_to :department
- belongs_to :ward
- belongs_to :group
- belongs_to :occupation



# patients テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| fa_patient_id  | integer    | null: false, unique: true      |
| full_name      | string     | null: false                    |
| full_name_kana | string     | null: false                    |
| gender_id      | integer    | null: false                    |
| blood_abo_id   | integer    | null: false                    |
| blood_rh_id    | integer    | null: false                    |
| date_of_birth  | date       | null: false                    |
| transfer_id    | integer    | null: false                    |
| description    | text       | null: false                    |

# Association
- belongs_to :gender
- belongs_to :blood_abo
- belongs_to :blood_rh
- belongs_to :transfer
- has_one_attached :image
- has_many :admissions



# admissions テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| patient        | references | null: false, foreign_key: true |
| ward_id        | integer    | null: false                    |
| roombed_id     | integer    | null: false                    |
| admission_date | date       | null: false                    |

# Association
- belongs_to :patient
- belongs_to :ward
- belongs_to :roombed



# 開発環境
・フロントエンド
  HTML
  CSS
  JavaScript
・バックエンド
  Ruby on Rails v 6.0.0
  ruby v 2.6.5
  mySql2
・インフラ
  Render deploy
・テスト
  Rspec
・テキストエディタ 
  VsCode





# 工夫したポイント
・データベース設計
　ユーザがどのように使用するのかを考え、データベース設計を行なった。
　例）新規患者が入院する場合、外来看護師が最初に患者を登録し、そして患者を入院待ち状態にする。<br>
     次に病棟看護師が患者を選択し、病棟への入院処理を行う。<br>
     入院中は、病棟間で転棟することもありえるため病棟内に待機室を設ける、等
     








