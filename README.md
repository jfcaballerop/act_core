# README

```
rvm list

rvm use ruby-2.4.1

rails new demo_app

mkdir -p sga_core

cd sga_core/

cp ../demo_app/Gemfile* .
```

 ## Create dockerfile y docker-compose.yml


_Cuidado con estos ficheros para generarlos con los volumes de las GEMAS enlazados al SO_

```
docker-compose build
docker-compose run web rails new . --force --skip-bundle --skip-active-record --skip-test --skip-system-test --api -T
docker-compose run --rm web bundle install
```
```
docker-compose down
docker-compose up
```

Para mongo
```
docker-compose run --rm web rails g mongoid:config
```

Modificarlo para que coja las variables del .env-app-config

Generar scaffold:
```
docker-compose run --rm web rails g scaffold api/v1/user name email

```