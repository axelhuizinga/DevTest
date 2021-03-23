# DevTest
client only

This project is build as a Haxe-JavaScript modular project leveraging Webpack for bundling (code and assets) and lazy loading.

run 

cd client

yarn install

haxelib newrepo

haxelib install build.hxml

yarn start

open in your browser: 
http://localhost:8000/DevTest

watch the dev console - after a minute you should see the first Uncaught TypeError: _gthis.setState is not a function