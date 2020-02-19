#!/usr/bin/env bash

sh scripts/0-install_gatsby.sh
sh scripts/1-setup_postgres_dbeaver.sh
sh scripts/4-gatsby_first_run.sh
sh scripts/2-seed_database.sh
sh scripts/5-deploy_local.sh
sh scripts/3-install_dotnetcore.sh