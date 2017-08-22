# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

APIS

1. User Create

curl -X POST -H "Content-type: application/json" -d '{"user":{"email":"your_email_id","password":"your_password","password_confirmation":"your_password"}}' http://localhost:3000/api/create_user

2. Gallery Create

curl -X POST -H "Content-type: application/json" -d '{"gallery":{"name":"gallery_name","remote_image_url":"https://www.gstatic.com/webp/gallery3/1.sm.png"}}' http://localhost:3000/api/create_gallery

3. Contact Form

curl -X POST -H "Content-type: application/json" -d '{"name":"your_name","email":"your_email_id","mobile":"your_mobile","description":"description"}' http://localhost:3000/api/contact_form

4. Get Gallery

curl -X GET -H "Content-type: application/json" http://localhost:3000/api/gallery/:id