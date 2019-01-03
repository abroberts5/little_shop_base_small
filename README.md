# README

This README would normally document whatever steps are necessary to get the
application up and running.

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

#### Mod 2 Learning Goals reflected:

- Database relationships
- Rails development (including routing)
- Software Testing
- HTML/CSS styling and layout
