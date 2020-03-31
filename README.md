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
- URL: http://18.177.204.238/
- テスト用アカウント
  * メールアドレス: test@test.com
  * パスワード: qq111111

## 制作背景
私は音楽が好きで、よくライブを見に行きます。  
特にインディーズのライブに行くことが多いです。  
そんな中である問題に気付きました。  

音楽活動をしている友人やインディーズバンド彼らの情報発信する場所が、  
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

- **トップページ**  
 新着アーティストと、その日に行われるライブ情報が表示されます。
 ![18 177 204 238_](https://user-images.githubusercontent.com/59691815/77846101-840fbb00-71ee-11ea-8529-321a75b1e3f3.png)


- **LIVE情報の投稿機能**  
 必須項目を全て記入しページ下部にある投稿ボタンを押すと投稿できます。  
 記入した住所から位置情報の緯度経度を取得してgoogle mapで表示します。  
 投稿はアーティスト登録をしたユーザーのみが行えます。
[![Image from Gyazo](https://i.gyazo.com/1727d99d38791f774502a2f58c92471d.gif)](https://gyazo.com/1727d99d38791f774502a2f58c92471d)


- **投稿の削除機能**  
 削除ボタンを押すと画面上部にスクロールされ、  
 確認画面が表示されます。  
 削除が完了するまで一部の画面の操作は無効化され画面が暗くなります。  
 投稿の削除はその投稿をしたユーザーのみが行えます。
![be345884607dbf7ff65edaf117e644a3](https://user-images.githubusercontent.com/59691815/77846075-604c7500-71ee-11ea-888a-3f5b81f42cd0.gif)


- **フォロー機能**  
 アーティスト詳細画面にてそのアーティストをフォローすることができます。  
 フォローしたアーティストは、マイページのお気に入りアーティストから確認できます。
![26c4d39517ff947b9e03ac5e80b556e7](https://user-images.githubusercontent.com/59691815/77987340-8b50d900-7354-11ea-89cf-6e9dadd9800a.gif)


- **投稿のお気に入り機能**
 ライブ情報画面にてそのライブ情報をお気に入り登録することができます。  
 お気に入り登録したライブ情報は、マイページのMy LIVEから確認できます。
![11f2a74c283456a76c436de26fc1f990](https://user-images.githubusercontent.com/59691815/77987789-b851bb80-7355-11ea-94ff-045444e3feca.gif)


- **検索機能**  
 アーティスト名、駅名、会場名、住所からキーワード検索が行えます。  
  また、日付での絞り込みやライブ状況での絞り込み等が行えます。
![18 177 204 238_searches_post_search_utf8=%E2%9C%93 q%5Bartist_name_or_station_or_venue_or_address_cont%5D=%E6%96%B0%E5%AE%BF](https://user-images.githubusercontent.com/59691815/77846131-d3ee8200-71ee-11ea-99d9-00c11b4b6b06.png)



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
- 投稿時に現在時刻より前の時間を選択できてしまう。
（バリデーションをかけることでこちらの問題は解決できたが、  
時刻によって自動でライブ状況を変更するメソッドが動かなくなってしまってので今はバリデーションを外している。）

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