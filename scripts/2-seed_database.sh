#!/usr/bin/env bash

#Create Database store
sudo docker exec -it postgres psql -U postgres -c "create database store"

#Create Database schema
sudo docker cp gatsby-postgres/db/schema.sql postgres:/tmp/schema.sql
sudo docker exec -it postgres psql -U postgres -d store -f /tmp/schema.sql

#Add Database data
sudo docker cp gatsby-postgres/db/data.sql postgres:/tmp/data.sql
sudo docker exec -it postgres psql -U postgres -d store -f /tmp/data.sql
