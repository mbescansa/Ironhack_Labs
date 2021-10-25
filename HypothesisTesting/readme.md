![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Inferential statistics - T-test & P-value

### Instructions

1. *One tailed t-test* - In a packing plant, a machine packs cartons with jars. It is supposed that a new machine will pack faster on the average than the machine currently used. To test that hypothesis, the times it takes each machine to pack ten cartons are recorded. The results, in seconds, are shown in the tables in the file `files_for_lab/machine.txt`.
   Assume that there is sufficient evidence to conduct the t test, does the data provide sufficient evidence to show if one machine is better than the other?

2. *Matched Pairs Test* - In this challenge we will compare dependent samples of data describing our Pokemon (file `files_for_lab/pokemon.csv`). Our goal is to see whether there is a significant difference between each Pokemon's defense and attack scores. Our hypothesis is that the defense and attack scores are equal. Compare the two columns to see if there is a statistically significant difference between them and comment your result.


# OPTIONAL PART | Inferential statistics - ANOVA

Note: The following lab is divided in 2 sections which represent activities 3 and 4.

## Part 1

In this activity, we will look at another example. Your task is to understand the problem and write down all the steps to set up ANOVA. After the next lesson, we will ask you to solve this problem using Python. Here are the steps that you would need to work on:
    - Null hypothesis
    - Alternate hypothesis
    - Level of significance
    - Test statistic
    - P-value
    - F table

### Context

Suppose you are working as an analyst in a microprocessor chip manufacturing plant. You have been given the task of analyzing a plasma etching process with respect to changing Power (in Watts) of the plasma beam. Data was collected and provided to you to conduct statistical analysis and check if changing the power of the plasma beam has any effect on the etching rate by the machine. You will conduct ANOVA and check if there is any difference in the mean etching rate for different levels of power. You can find the data `anova_lab_data.xlsx` file in the `files_for_lab` folder  

- State the null hypothesis
- State the alternate hypothesis
- What is the significance level
- What are the degrees of freedom of model, error terms, and total DoF

Data was collected randomly and provided to you in the table as shown: [link to the image - Data](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/7.05/7.05-lab_data.png)


## Part 2

- In this section, use the Python to conduct ANOVA.
- What conclusions can you draw from the experiment and why?
