What makes a popular Reddit post?
================
InterstellR
May 2, 2018

Load packages and data
----------------------

Introduction
------------

"Reddit is an American social news aggregation, web content rating, and discussion website" (from [Wikipedia](https://en.wikipedia.org/wiki/Reddit)). People who are members of Reddit upload their posts and other people vote and comment on said posts, the posts with the most likes appear more towards the top. They are divided by thematic categories called subreddits, as well as overall categories of top posts, new posts, controversial posts, among others.

TODO: Expand intro

### Data Set

The data set is comprised of Reddit posts from December 2017, since it was the latest data set we could find and wanted to keep up with the most recent trends. Also, it will be interesting to explore themes related to Christmas. We retrieved it from the Google BigQuery API. The data set contains 33 variables and 10567492 observations.

TODO: Describe dataset and variables

### Research Question

TODO: Explain research question and motivation

Cleaning
--------

The dataset we acquired is mostly clean; however, there is one thing we need to clean up before we began our analysis. The variable `created_utc` gives the date that the post was created as the difference in milliseconds from January 1st, 1970. This quantity is not very easy to read or interpret, so we convert it to a combination of day, hour, and minute. We do not need to store the month and year since these values are the same for all entries in the dataset.

To check whether our conversion is correct, we can look at the range of the new date variable. We see that the first post in the dataset was on and the latest one was on -. Since this range is exactly the month of December 2017, we can be confident that the conversion was successful.

Word Frequencies
----------------

As infrequent Reddit users, we do not know much about the various subreddits yet. Hence, we want to start by finding out what the most popular ones are and gain insights into what the posts in each one are about. As a measure of a subreddit's popularity, we decide to use the cumulative score of all of its posts. The plot below shows the nine subreddits with the highest resulting totals.

![](project_files/figure-markdown_github/active-subreddits-1.png)

We find that the nine most popular subreddits in descending order are `The_Donald`, `funny`, `politics`, `aww`, `pics`, `gaming`, `gifs`, `todayilearned`, and `me_irl`. We may be able to intuit what most of these subreddits are about from their name alone, but we wanted to know more about the content and central topics in each of them. Therefore, we decided to analyze the most frequent terms in each of these subreddits with the help of the `tidytext` package. We want to focus on the text contained in the title of the posts since it is the first thing that is visible to the users. Furthermore, we decided to filter out stop words such as "the" and "a" because they naturally appear very frequently and do not convey much about the content of any one particular subreddit.

![](project_files/figure-markdown_github/tf-analysis-1.png)

TODO: Discuss results for this visualization

Sentiment Analysis
------------------

One of the major questions we want to explore is whether positive or negative posts are more likely to become popular. Our hypothesis is that negative posts are generally more popular, as psychologists claim that humans have an innate "negativity bias" which draws them toward bad news moreso than good ones (Ito et al. 1998).

Cats vs. Dogs
-------------

Conclusion
----------

Ito, Tiffany A., Jeff T. Larsen, N. Kyle Smith, and John T. Cacioppo. 1998. “Negative Information Weighs More Heavily on the Brain: The Negativity Bias in Evaluative Categorizations.” *Journal of Personality and Social Psychology* 75 (4): 887–900. <https://search.ebscohost.com/login.aspx?direct=true&db=pdh&AN=1998-12834-004&site=ehost-live&scope=site>.
