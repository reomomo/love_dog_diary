# loveドッグダイアリー

## サイト概要
### サイトテーマ
愛犬との日々のお散歩記録、健康管理をしたり、お散歩中に撮った写真を場所ごとに整理して保存ができるサイト

### テーマを選んだ理由
愛犬とのお散歩目標距離を歩くため、また毎日お散歩距離やお散歩ルートを記録に残したいと思い、このアプリケーションを作成しました。
散歩時間は同じでも、愛犬の調子によっても歩ける距離は異なります。また、クンクンする時間が長くて時間内に一定距離を歩けなかったりもすると思います。
そんな時でもお散歩距離を測って残しておければ、次のお散歩で調整できます！
散歩以外にもこのアプリケーションでは、愛犬の食欲や排せつの状態を記録できます。
愛犬の人間年齢も日記に表示されるので、小型犬・中型犬は人間の4倍、大型犬だと7倍のスピードで年を取る愛犬をより愛おしく感じられると思います。
また、お散歩中に愛犬や花、鳥の写真を撮ったり、遠出のお散歩に行った時の風景写真も、日記と一緒に残せます。
愛犬の健康管理、楽しい思い出を残すために活用していただけたら嬉しいです。

### ターゲットユーザー
* 愛犬とのお散歩時間、ルートや距離を記録に残したい方
* 愛犬といろんな道を歩きたいけれど、同じ程度の距離をお散歩させたい方
* 愛犬の健康記録を残したい方
* 愛犬と遠出した思い出を残したい方
* 愛犬の様子を日記に残したい方
* 愛犬との写真を管理したい方

### 主な利用シーン
* 愛犬の健康状態を日記に残したいとき
* 愛犬との散歩記録を残したいとき
* 新しい散歩コースで距離を事前に確認しておきたいとき
* お散歩で撮った写真を日記と共に残したいとき

## 設計書
* ER図：https://drive.google.com/file/d/1XjYAIZCCYJpxp3aSQWt24m3Wx_f-BiGB/view?usp=sharing
* 実装機能リスト：https://docs.google.com/spreadsheets/d/1Uu54PDruZRNPFdUX5Lt5zYxZukwgKFAuE6r07UR5jYs/edit?usp=sharing


## 開発環境
* 言語：HTML,CSS,JavaScript,Ruby,SQL
* フレームワーク：Ruby on Rails
* IDE：Cloud9

## 使用素材
* Maps Javascript API
* 犬の年齢を人年齢に換算する計算式（引用：京都中央動物病院HP）
 (https://fukufukuyama-petsougi.com/wp-content/uploads/2016/03/inu_nenrei.jpg)
* https://www.ac-illust.com/
* https://icooon-mono.com/
* https://www.pakutaso.com/
* gem 'rspec-rails'
* gem 'devise'
* gem "enum_help"
* gem "simple_calendar", "~> 2.4"
* gem 'dotenv-rails'
* gem 'kaminari','~> 1.2.1'
* gem 'rails-i18n'

