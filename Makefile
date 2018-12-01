docker-pg-init:
	docker-compose exec postgres createuser -s "${USER}" -U discourse

setup:
	bundle exec rake db:create db:migrate
	RAILS_ENV=test bundle exec rake db:create db:migrate
	bundle exec rake autospec
	RAILS_ENV=development bundle exec rake admin:create

mc:
	mailcatcher --http-ip 0.0.0.0

start:
	bundle exec rails server --binding=0.0.0.0
