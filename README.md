# Broccoli Blog

## Summary
This program is part of an assignment completed during my time at Dev Bootcamp programming school. The focus of this assignment is to build an application that demonstrated user authentication and restrict users to view only pages that they are authorized to view. The logic for user authentication is hosted on the back end to prevent manipulation of false information from the client side browser. This program utilizes HTTP cookies to set user sessions for authentication.

## Authentication and Authorization
This program utilizes HTTP cookies to set user sessions for authentication. The logic that checks the users authentication ID is hosted at the routing level and will reroute the user to a community page if user ID information is manipulated or does not match the session ID. Users are only permitted to view their profile page and will be redirected if they try and access someone else's profile page. Users are also only permitted to edit or delete blog posts that they have created and if a destructive script attempts to delete another users, the changes will not be saved to the database and the user will be redirected.


## Programming Languages
* Ruby
* Sinatra
* HTML
* CSS

## Visual Overview
![alt text](https://github.com/ed13f/Broccoli-Blog/blob/master/blog.png?raw=true "Blog")
