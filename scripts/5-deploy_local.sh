#Remove httpd docker, if exists
docker stop httpd
docker rm httpd

#Starts postgres docker, if stopped
docker start postgres

#Clean and build site
cd gatsby-postgres
gatsby clean
gatsby build

#Create local resources to upload (Testing)
#rm -rf /home/${USER}/Desktop/mysite
#mkdir /home/${USER}/Desktop/mysite
#cp -ra public/. /home/${USER}/Desktop/mysite/
#docker run -dit --name httpd -p 8080:80 \
#-v /home/${USER}/Desktop/mysite/:/usr/local/apache2/htdocs/ \
#httpd:latest

#Create docker httpd to deploy website
docker run -dit --name httpd -p 8080:80 \
-v $(pwd)/public/:/usr/local/apache2/htdocs/ \
httpd:latest

cd ..
