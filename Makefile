build: clean
	@mkdir -p ./mysql/data
	@docker-compose build --no-cache

superuser:
	@docker-compose run --rm web ./manage.py createsuperuser

dev:
	# you may get timeouts here occasionally
	# see https://github.com/docker-library/docs/tree/master/mysql#no-connections-until-mysql-init-completes
	@docker-compose up

test:
	@docker-compose run --rm web \
		python3 manage.py test --configuration=Test

bash:
	@docker-compose exec web /bin/bash

shell:
	@docker-compose run --rm web ./manage.py shell

dbshell:
	@docker-compose run --rm web ./manage.py dbshell

stop:
	@docker-compose stop

clean:
	@docker-compose down
	@rm -rf ./mysql/data

coverage:
	@docker-compose run --rm web coverage run --source='.' manage.py test --configuration=Test
	@docker-compose run --rm web coverage report

coverage-html: coverage
	@docker-compose run --rm web coverage html
	@open web/impact/htmlcov/index.html

demo:
	@docker-compose run --rm web ./manage.py make_demo_users
	@docker-compose run --rm web ./manage.py make_demo_apps

lint:
	@docker-compose run --rm web pylint impact
