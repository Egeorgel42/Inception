build:
	docker-compose -f srcs/docker-compose.yml build
up:
	docker-compose -f srcs/docker-compose.yml up -d
down:
	docker-compose -f srcs/docker-compose.yml down
prune:
	docker system prune -a -f
fclean:
	docker-compose -f srcs/docker-compose.yml down && docker system prune -a -f
logs:
	docker-compose -f srcs/docker-compose.yml logs -f -t
help:
	@printf "build:\tbuild inception\nup:\tlaunch docker\ndown:\tstop docker and rm\nprune:\trm all dockers\nfclean:\tdown & prune\nlogs:\tself explanatory\n"