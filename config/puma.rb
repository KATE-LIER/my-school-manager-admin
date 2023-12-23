# プログラム処理の実行単位
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# puma起動時のport番号を指定
port        ENV.fetch("PORT") {8000 }

# pumaが起動する実行環境を指定
environment ENV.fetch("RAILS_ENV") { "development" }

# puma用プラグインの追加(tmp_restartはデフォルト)
plugin :tmp_restart

# Nginxとソケット通信させるために必要
bind "unix://tmp/sockets/puma.sock"