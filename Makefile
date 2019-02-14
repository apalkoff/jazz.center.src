all: clean deploy

.PHONY: dev
dev:
	hugo serve -Dw --bind 0.0.0.0

.PHONY: clean
clean:
	$(RM) -r public

.PHONY: public
public:
	hugo

.PHONY: deploy
deploy: public
	s3deploy -source=public/ -region=eu-central-1 -bucket=jazz.center -key=$(AWS_ACCESS_KEY_ID_APALKOFF_RU) -secret=$(AWS_SECRET_ACCESS_KEY_APALKOFF_RU)