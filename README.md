# このアプリについて

「ReatARead」は共有スペースなどで貸出している書籍の管理アプリです。

どのような本が貸出されているか検索したり、自分が貸借した本を管理できます。

アプリはRalsAPI + NuxtのSPA構成です。
Dockerを使用し、AWSにてインフラ構築 → CloudFormaitonにてIaC化しました。

#### URL
http://rentaread.link
(ゲストログインあります)

#### トップページ
https://github.com/inoue-masaki/rentaread/assets/62523279/c28a0fef-d156-4093-8cd4-b8341236432b

#### 本投稿
https://github.com/inoue-masaki/rentaread/assets/62523279/c28a0fef-d156-4093-8cd4-b8341236432b

#### レビュー
https://github.com/inoue-masaki/rentaread/assets/62523279/6dc06720-d5e7-45e0-ad2f-513fc01996dc

#### レビュー投稿
https://github.com/inoue-masaki/rentaread/assets/62523279/5373ca15-4cc7-434f-a3cd-a188ad188c22

#### インフラ構成図



# 主な使用技術:

#### インフラ
- AWS ECS Fargate(バックエンド・フロントエンド)
- AWS RDS(PostgreSQL)
- AWS CloudFormation
- AWS Route53
- AWS S3
- Docker
- Docker-compose(検証)

バックエンド
- Ruby2.7.1
- Rails6.0.3(apiモード)
- PostgreSQL
- CarrierWave2.0
- Rspec

フロントエンド
- Nuxt2
- Vuex
- Veutify1.12.3
- Axios


# 当アプリは以下の機能を持っています:
### ユーザー機能
新規登録 ログイン ログアウト

### 商品機能
新規出品 画像登録 お気に入り登録 レンタル 返却 星評価平均 検索

### レビュー機能
コメント 星5段階評価