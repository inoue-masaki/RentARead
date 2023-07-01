# このアプリについて

「ReatARead」は共有スペースなどで貸出している書籍の管理アプリです。

どのような本が貸出されているか検索したり、自分が貸借した本を管理できます。

アプリはRalsAPI + NuxtのSPA構成です。
Dockerを使用し、AWSにてインフラ構築 → CloudFormaitonにてIaC化しました。

#### URL
http://rentaread.link
(ゲストログインあります)

#### トップページ
https://github.com/inoue-masaki/RentARead/assets/62523279/f7950aa5-2422-48d5-b3dc-737212501820

#### 本出品
https://github.com/inoue-masaki/RentARead/assets/62523279/4c58b48e-2e73-4f07-834d-4c3703030e01

#### レビュー
https://github.com/inoue-masaki/RentARead/assets/62523279/3348988f-1d46-4ce2-9e68-b574edbf1bec

#### レビュー投稿
https://github.com/inoue-masaki/RentARead/assets/62523279/079f2bac-638b-42ba-8b1a-b4e20cf3b6f8

#### インフラ構成図
https://github.com/inoue-masaki/RentARead/assets/62523279/2ec87586-ab55-4bf2-9683-0a097799bfb8


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