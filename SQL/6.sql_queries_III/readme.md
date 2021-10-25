![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | SQL Queries 9

In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals. You have been using this database for a couple labs already, but if you need to get the data again, refer to the official [installation link](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).

The database is structured as follows:
![DB schema](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/database-sakila-schema.png)

### Instructions

Create a Python connection with SQL database and retrieve the results of the following queries as dataframes:

1. How many distinct (different) actors' last names are there?
2. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
3. Get all films with ARMAGEDDON in the title.
4. Get 10 the longest films.
5. How many films include Behind the Scenes content?
6.  Which kind of movies (rating) have a mean duration of more than two hours?
7.  Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
