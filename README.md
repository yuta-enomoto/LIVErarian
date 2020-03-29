# LIVErarian

## 概要(このアプリでできること)
- ユーザー登録、ログイン
- アーティスト登録
- 音楽ライブ情報の投稿
- ライブ情報の検索
- アーティストの検索
- アーティストのフォロー
- 投稿のお気に入り登録

## 本番環境


## 制作背景
私は音楽が好きで、よくライブを見に行きます。  
特にインディーズのライブに行くことが多いです。  
そんな中である問題に気付きました。  

音楽活動をしている友人やインディーズバンド達彼らの情報発信する場所が、  
**TwitterやInstagramなどのSNSしかない**という事です。  
それらは既存のフォロワーにしか情報が伝わりにくく、  
私自身も新しい音楽との出会いが口コミ程度でしか入ってきません。  
そこで、もっと能動的にアーティストを知れたり、  
アーティスト達がもっとたくさんの人に知ってもらえる方法を私なりに考えてみました。

そしてたどり着いたのが『LIVErarian』、  
**インディーズのライブ情報に特化した専用のプラットフォーム**を作るということです。

『LIVErarian』は二つの言葉からできた造語です。  
音楽のライブの「LIVE」と、  
英語で図書館員という意味の「librarian」です。  
『LIVErarian』は**LIVE情報**を管理する**図書館員的**な存在になれたらな
という思いでこの度制作しました。

## DEMO

## 工夫したポイント
投稿したLVIEの状況を「**開催前**」「**開催中**」「**開催済**」に分け、  
それらが時間になると自動で状況が変わるように工夫しました。

例えばLIVE開始時刻を18:00、LIVE予定時間を2時間とすると、  
その時刻になるまでは「開催前」、  
その時刻を過ぎると「開催中」、  
LIVE予定時間の2時間が経つと「開催済」に自動でLIVE状況が変わります。

これを実現するのに「**status**」カラムと「**now_on**」カラムを用意しました。  
開催前はstatusが1、now_onが1、  
開催中はstatusが1、now_onが0、  
開催済はstatusが0、now_onが1とし、区別しました。  

時間になると自動でレコードの中身を変更する方法に少してこずりましたが、  
なんとか自分なりの記述で実現できました。  
その記述は**application_controller.rb**にあります。

## 使用技術
- ruby 
- Java Script
- Jquery
- haml,sass記法

## 開発環境
- Rubyバージョン　2.5.1
- Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

## 課題や今後実装したい機能

### 課題
- LIVE検索フォームで検索する度にチェックボックスが外れてしまう。
- 2月31日など、存在しない日を選択できてしまう。
- 緯度、経度の座標取得が10mほどずれる場合がある。

### 実装したい機能
- ユーザーの位置情報から近いLIVEをgoogle mapに表示させる機能
- ライブチケットの決済機能
- SNSにシェアする機能
- 通知機能
- カレンダー機能
- 曲を試聴できる機能
- パンくず機能
- LIVEが中止になった場合に中止させる機能

# DB設計

<img width="906" alt="er" src="https://user-images.githubusercontent.com/59691815/77843162-684beb00-71d5-11ea-8e1e-cbdc4be081c8.png">

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|birthday|date|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_one :artist
- has_many :posts
- has_many :favorites, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :fav_artists, through: :likes, source: :artist
- has_many :like_posts, through: :likes, source: :post

--------------------------------------------------------------

## artistsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, uniqueness: true|
|image|string|null: false|
|active_place|string|null: false|
|introduction|text|null: false|
|fav_count|integer|
|user_id|references|null: false, foreign_key: true|

### Association
- has_many :posts
- has_many :favorites, dependent: :destroy
- has_many :fav_users, through: :likes, source: :user
- belongs_to :user

--------------------------------------------------------------

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|fee|integer|
|station|string|null: false|
|address|string|null: false|
|venue|string|null: false|
|date_time|datetime|null: false|
|status|boolean|null: false, default: true|
|now_on|boolean|null: false, default: true|
|form_id|integer|null: false, foreign_key: true|
|how_long_id|integer|null: false, foreign_key: true|
|likes_count|integer|
|latitude|float|
|longitude|float|
|user_id|references|null: false, foreign_key: true|
|artist_id|references|null: false, foreign_key: true|

### Association
- has_many :likes, dependent: :destroy
- has_many :like_users, through: :likes, source: :user
- belongs_to :user
- belongs_to :artist
- belongs_to_active_hash :form
- belongs_to_active_hash :how_long

--------------------------------------------------------------

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|artist_id|references|null: false, foreign_key: true|

### Association
- belongs_to :artist, counter_cache: :fav_count
- belongs_to :user

--------------------------------------------------------------

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :post, counter_cache: :likes_count
- belongs_to :user