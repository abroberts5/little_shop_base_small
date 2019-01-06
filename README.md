# README

These instructions will get you a copy of the project extensions up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

Prerequisites:
Install Ruby (Version 2.4.5)
Install Rails (Version 5.1)
Installing:
To run this application locally, clone this repo and follow the steps below:

Install gems:
$ bundle
Create, migrate, & seed database:
$ rake db:{create,migrate,seed}
Start your rails server:
$ rails s
Open browser and navigate to:
localhost:3000
Running the RSpec Test Suite
Little Shop has a full RSpec suite of feature and model tests for every piece of functionality in the app.

Running the Full Test Suite:
From the root of directory, type the below command to run the full test suite:

$ rspec
Running only Feature Tests:
Type this command from the root of thisp directory.

$ rspec ./spec/features
Running only Model Tests:
Type this command from the root of the directory.

$ rspec ./spec/models

# Little Shop Extensions

## Merchant Stats, Part 1

Build a Merchant leaderboard available on "/merchants" that all users can see:

- Top 10 Merchants who sold the most items this month
- Top 10 Merchants who sold the most items last month
- Top 10 Merchants who fulfilled non-cancelled orders this month
- Top 10 Merchants who fulfilled non-cancelled orders last month

When logged in as a user:

- Also see top 5 merchants who have fulfilled items the fastest to my state
- Also see top 5 merchants who have fulfilled items the fastest to my city

#### Mod 2 Learning Goals reflected:

- Advanced ActiveRecord
- Software Testing
- HTML/CSS layout and styling

---

## Users can Rate Items

Users will have the ability to leave ratings for items they have successfully purchased.

Users cannot rate items from orders which have been canceled by the user or an admin.

Users can write one rating per item per order. If the user orders an item (in any quantity) they can leave one rating. If they order the item again in a different order, the user can leave another rating.

Build all CRUD functionality for users to add a rating through their order show page.

Users can disable any rating they created. Admins can enable or disable any rating.

Disabled ratings should not factor into total counts of ratings, nor averages of ratings.

Ratings will include a title, a description, and a rating from 1 to 5.

#### General Goal

Users will have the ability to leave ratings for items they have successfully purchased.

#### Completion Criteria

1. Reviews can only be left for items in "completed" orders.
1. Users can write one review for each ordered item.
1. If a user orders the same item in a different order, they get to leave an additional review. (if they order the same item in 4 different orders, they get to leave 4 ratings)
1. An average review rating should be shown on both the Item Catalog page as well as the Item Show page.

#### Implementation Guidelines

1. Build all CRUD functionality for users to add a rating through their order show page. The user should be able to navigate to a reviews index page from their profile page, and from there they can add, edit, show, or delete any review.
1. Ratings will include a title, a description, and an integer rating from 1 to 5.

#### Mod 2 Learning Goals reflected:

- Database relationships
- Rails development (including routing)
- Software Testing
- HTML/CSS styling and layout
