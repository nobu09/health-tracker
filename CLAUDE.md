# CLAUDE.md

このファイルは、Claude Code (claude.ai/code) がこのリポジトリで作業する際のガイダンスを提供します。

## 開発コマンド

### セットアップと起動
```bash
bin/setup                        # 依存関係のインストールとデータベースの準備
bin/dev                          # Railsサーバーを起動
docker-compose up                # バックエンド(ポート3000)とフロントエンド(ポート5173)を起動
```

### バックエンド (Rails)
```bash
bin/rails server                 # 開発サーバーを起動
bin/rails db:prepare             # データベースの作成/マイグレーション
bin/rails test                   # ユニット/インテグレーションテストを実行
bin/rails test:system            # システムテストを実行 (Capybara + Selenium)
bin/rails test test/models/user_test.rb              # 単一のテストファイルを実行
bin/rails test test/models/user_test.rb:10           # 特定の行のテストを実行
```

### フロントエンド (React)
```bash
cd frontend && npm install       # 依存関係のインストール
npm run dev                      # Vite開発サーバーを起動
npm run build                    # 本番用ビルド
npm run lint                     # ESLintを実行
```

### 品質とセキュリティ
```bash
bin/rubocop                      # Rubyコードのリント
bin/brakeman                     # セキュリティ分析
bin/bundler-audit                # gemの脆弱性監査
bin/ci                           # CIパイプラインをローカルで実行
```

## アーキテクチャ

### 技術スタック
- **バックエンド**: Rails 8.1, Ruby 4.0, SQLite3
- **API**: GraphQLのみ (graphql-ruby + Dataloader)
- **フロントエンド**: React 19 + TypeScript + Vite + Tailwind CSS (`/frontend`に配置)
- **バックグラウンドジョブ**: Solid Queue, Solid Cache, Solid Cable

### API設計
- 単一の `/graphql` エンドポイント (POST)
- 開発環境では `/graphiql` でGraphiQLが利用可能
- GlobalIDを使用したRelay形式のオブジェクト識別
- N+1問題防止のためのDataloader

### プロジェクト構成
- `/app/graphql/` - GraphQLスキーマ、型、ミューテーション、リゾルバ
- `/frontend/` - 独立したReact SPA (GraphQL経由で通信)
- `/config/ci.rb` - CIパイプライン設定

### 主要ファイル
- `app/graphql/health_tracker_schema.rb` - GraphQLスキーマ定義
- `app/graphql/types/query_type.rb` - クエリ型
- `app/graphql/types/mutation_type.rb` - ミューテーション
- `config/routes.rb` - ルーティング (最小限: GraphQLエンドポイント + ヘルスチェック)
