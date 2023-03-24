# chat-training

## 開発環境
※ docker を使います。

### 事前準備
環境変数を設定してください。

* フロントエンド
`web/.env.development.sample` を参考に `web/.env.development` を作成してください。  
主に firebase 用の設定になります。

* バックエンド
`api/.env.sample` を参考に `api/.env` を作成してください。

### 起動
`docker compose up` してください。

http://localhost:8080/ でアプリケーション画面で管理画面が開けます。  
http://localhost:3000/admin/ で管理画面が開けます。

### 管理者
管理画面でログインするには、`docker compose exec app rails c` でバックエンドのコンソール画面を表示し、次のように AdminUser を作成してください。
```
AdminUser.create!(email: 'your_email@example.com', password: 'your_password')
```
※ 終了するときは `exit` 入力
