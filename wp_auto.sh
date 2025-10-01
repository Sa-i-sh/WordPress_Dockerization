#!/bin/bash

GREEN='\033[32m'
RED='\033[31m'
BLUE='\033[33m'
RESET='\033[0m'

case $1 in
	up)
		echo -e "${GREEN}Starting Wordpress project...${RESET}"
		docker compose up -d
		;;
	down)
		echo -e "${RED}Stopping Wordpress project...${RESET}"
		docker compose down
		;;
	rebuild)
		echo -e "${BLUE}Rebuilding containers...${RESET}"
		docker compose down -v
		docker compose build --no-cache
		docker compose up -d
		;;
	logs)
		docker compose logs -f
		;;
	reset-db)
		echo -e "${RED}Resetting MYSQL database...${RESET}"
		docker compose down -v
		docker volume rm $(docker volume ls -q | grep db_data)
		docker compose up -d
		;;
	*)
		echo "Commands: ./wp_auto.sh {up|down|rebuild|logs|reset-db}"
		;;
esac
