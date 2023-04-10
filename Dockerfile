# ベースのイメージ
FROM ruby:2.7

# directory どこで作業するかを指定(自分のベースメントの作業場を指定)
WORKDIR /var/www

# srcディレクトリ内に全てコピーしていく
# アプリケーションコードをコピー
COPY ./src /var/www

# ベースイメージ上でコマンドが実行される
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

# Dockerコンテナ起動時に、これらのwebサーバーが自動的に立ち上がる
# CMDの書き方は、スペースはカンマで区切る
CMD ["bundle", "exec", "ruby", "app.rb"]