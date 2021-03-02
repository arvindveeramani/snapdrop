#/bin/bash

name=$1
path=$2
user=$3
apt update && apt install

apt install wget unzip docker.io docker-compose nano -y

  git clone https://github.com/RobinLinus/snapdrop.git
mv snapdrop fileshare

cd fileshare/

sed -i -e 's| user: "node"| user: "root"|g' docker-compose.yml

cd client/

sed -i -e 's|<title>Snapdrop</title>|<title>'$name'</title>|g' index.html
 sed -i -e 's| <h2>Open Snapdrop on other devices to send files</h2>| <h2>Open '$name' on other devices to send files</h2>|g' index.html

sed -i -e 's| <h1>Snapdrop</h1>| <h1>'$name'</h1>|g' index.html
sed -i -e 's|  <use xlink:href="#wifi-tethering" /> | <use xlink:href="#icon" />|g' index.html

 sed -i '71d' index.html
 sed -i '137d' index.html

cd images/

cp $path /home/$user/fileshare/client/images/android-chrome-192x192-maskable.png

cp $path /home/$user/fileshare/client/images/android-chrome-192x192.png

cp $path /home/$user/fileshare/client/images/android-chrome-512x512-maskable.png

cp $path /home/$user/fileshare/client/images/apple-touch-icon.png

cp $path /home/$user/fileshare/client/images/android-chrome-512x512.png

cp $path /home/$user/fileshare/client/images/favicon-96x96.png
cp $path /home/$user/fileshare/client/images/logo_blue_512x512.png

cp $path /home/$user/fileshare/client/images/logo_transparent_128x128.png
cp $path /home/$user/fileshare/client/images/logo_transparent_white_512x512.png
cp $path /home/$user/fileshare/client/images/logo_transparent_512x512.png

cp $path /home/$user/fileshare/client/images/logo_white_512x512.png
cp $path /home/$user/fileshare/client/images/safari-pinned-tab.svg

cp $path /home/$user/fileshare/client/images/snapdrop-graphics.sketch
cp $path /home/$user/fileshare/client/images/logo_white_512x512.png
cp $path /home/$user/fileshare/client/images/mstile-150x150.png
cp $path /home/$user/fileshare/client/images/twitter-stream.jpg


cd ..
cd ..
docker-compose up -d




