# elixir-docker-nondb

Docker を用いて Elixir/Phoenix アプリケーションの開発・学習を始めるための設定ファイル等のセット

このセットではDBは使用できません。

## 構築される環境

* Debian 10 (Buster)
* Erlang/OTP 23
* Elixir 1.11.3
* Phoenix 1.5.7

## 必要なソフトウェア

* Docker 20 以上
* Docker Compose 1.27 以上
* Git 2.25 以上

## 動作確認済みのOS

* Windows11

## 構築方法

1. windoows11上にwsl/Ubuntu22.04をインストールする。

参考>
[Ubuntu 22.04でElixirの最短手順](https://qiita.com/piacerex/items/01e89435af0f7a454ad2)


2. docker-desktopをインストールする。

従業員250人以上かつ年間売上高1000万ドル以上の企業利用の場合、
有料となるため注意

参考>
[Docker Desktop インストール手順](https://qiita.com/R_R/items/a09fab09ce9fa9e905c5)


3. vscodeのインストールを行い、wsl2内のUbuntuコンソールを開く

以下のサイトを参考に、vscodeのインストール/Ubuntuコンソールを開く。

参考>
[WSL2 + Ubuntu + VSCodeでの開発環境構築](https://qiita.com/zaburo/items/27b5b819fae2bde97a3b)


4. gitインストールを行う。

```bash
sudo apt-get install git
```

5. dockerコンテナ入手、デプロイ、立ち上げ

```bash
curl -L -o temp.zip https://github.com/naritomo08/elixir-docker-nondb/archive/refs/heads/main.zip
unzip temp.zip
rm temp.zip
mv elixir-docker-nondb-main elixir-docker-nondb
cd elixir-docker-nondb
sudo bin/setup.sh
sudo bin/start.sh
sudo bin/login.sh
```

6. Webサイト作成

```bash
mix phx.new testsite --no-ecto
→yを選択する。
cd testsite
```

7. サイト立ち上げ

```bash
mix phx.server
```

8. サイト参照

ブラウザで以下のURLを参照してサイト参照できることを確認する。

```bash
http://localhost:4000
```

9. コンテナ停止

```bash
Ctrl+c を2回
exit
sudo bin/stop.sh
```
