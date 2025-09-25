-- 1. ログ全般の出力設定
ALTER SYSTEM SET logging_collector = 'on';        -- ログ収集を有効化
ALTER SYSTEM SET log_directory = 'log';        -- ログ出力先ディレクトリ（デフォルト data/log）
ALTER SYSTEM SET log_filename = 'postgresql-%d.log'; -- ログファイル名のフォーマット
ALTER SYSTEM SET log_truncate_on_rotation = 'on'; -- ログローテーション時に古いファイルを切り捨て
ALTER SYSTEM SET log_rotation_age = '1d';         -- ログローテーション間隔
ALTER SYSTEM SET log_rotation_size = '10MB';     -- ログローテーションのサイズ上限

-- 2. ログレベルの設定
ALTER SYSTEM SET log_min_messages = 'info';       -- info 以上を出力
ALTER SYSTEM SET log_min_error_statement = 'error'; -- エラー時の SQL も出力

-- 3. 遅いクエリログ（slow query）
ALTER SYSTEM SET log_min_duration_statement = 1000; -- 1000ms = 1秒以上のクエリをログ
ALTER SYSTEM SET log_checkpoints = 'on';           -- チェックポイント情報もログに出力（任意）
ALTER SYSTEM SET log_lock_waits = 'on';            -- ロック待ちが発生したSQLをログに出力
ALTER SYSTEM SET log_temp_files = 0;               -- 一時ファイルの生成を全てログ（サイズ制限なし）

-- 4. 設定を反映
SELECT pg_reload_conf();