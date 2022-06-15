#### Setup

#### Local Development

```shell
  touch .env.local

  PORT=4000
  API_URL=http://localhost:4000
```

##### Allowing all cors origins. Should be restricted

#### Deployment

```shell
  brew tap heroku/brew && brew install heroku
  heroku login
  heroku create ticketbud-backend
  git push heroku main
  heroku run rake db:migrate
  heroku ps:scale web=1
```

#### ENV setup

```shell
  heroku config:set API_URL=$(heroku info -s | grep web_url | cut -d= -f2)
```
