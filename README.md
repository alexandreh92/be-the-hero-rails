# README

This is the **Rocketseat's Semana OmniStack Be The Hero** app in Rails 5.2.

- Ruby version
  ```
    ruby '2.6.3'
    rails '5.2.3'
  ```
- System dependencies

  - [GraphViz](http://graphviz.org/)

    ```
    sudo apt-get install graphviz
    ```

  - [ImageMagick](https://imagemagick.org)
    ```
    sudo apt-get install imagemagick
    ```

- Configuration

  - Configuring Postgres

    **Installation**

    ```
    sudo apt-get install wget ca-certificates

    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

    sudo apt-get update

    sudo apt-get install postgresql postgresql-contrib

    ```

    **Postgres Configuration**

    ```
    ALTER USER postgres WITH SUPERUSER;
    ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres';
    ```

    **OR**

    ```
    sudo -u postgres psql -c "CREATE USER postgresql WITH SUPERUSER PASSWORD 'postgres';
    ```

    to create a new user named postgresql


    **config/database.yml**
    ```
    development:
    adapter: postgresql
    encoding: utf8
    database: be_the_hero_development
    pool: 80
    username: postgres
    password: postgres
    host: localhost
    template: template0
    ```

- Configuring **ENV** Variables:

  - JWT SECRET:

    ```
    touch ./config/local_env.yml
    ```

    then run:

    ```
    rake secret
    ```

    **config/local_env.yml**

    ```
    JWT_SECRET: 'secret'
    ```

* Database creation

  - Default Database: **Postgres**

    ```
      rake db:create
      rake db:migrate
      rake db:seed
    ```

  - Fake Data:
    ```
      rake fake:setup
    ```
