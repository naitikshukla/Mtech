All files for CA2b includes.<br>

* Classification(NaiveBayes - R)<br>
* Fuzzy model and rules.(jfuzzy - java)
<br><br>


--------------------------------------------------------------------------
## ___Workshop 2B: Problem Scenario___ <br>
* Sentosa Bank has two new investment products – A & B
* They conduct a trial mailing - 1000 customers are selected randomly and offered both products
* They plan a second mailing campaign in which:
  * The trial promotion results are used to help select 400 customers likely to buy one of the new products
  * A trained bank officer will visit each selected customer to try to sell them one or other product. To save costs, some staff are trained to sell product A and others product B.
 * __GOAL__ = Build a hybrid system to select 400 customers that maximize the expected campaign profit.
 
 ### __Estimating Expected Profit__
* Estimate the expected profit from the campaign by summing the expected
profit from each individual customer-
```
    Expected profit for campaign = ∑ customers Expected profit for customer(i)
```
* The profit for a customer depends on the product bought (A or B) and the expected amount of money they will invest, but there is no formula to estimate the amount of money a customer will invest. There are guidelines developed by experienced staff to calculate an investment potential score for each customer (a number between 0 and 10)
```
    Expected profit for customer(i) = customer investment score * 0.6 if product purchased = A
                                    = customer investment score       if product purchased = B
                                    = 0                               if no product purchased
```

### __Estimating Investment Potential__
* The bank uses the following guidelines to assign a score between 0 and 10
  * Investment potential is related to the customer’s account activity as well as their personal attributes, account activity is considered more important than personal attributes.
  * __Account activity__ is measured by examining the customers average monthly transactions and average monthly balance. A customer with high values for both has more investment potential.
  * __Personal factors__ relating to investment potential:
    * Gender - males have more potential than females, this is less true for unmarried women
    * Income – higher is better
    * Age - investment potential peaks around middle-age
    * Occupation - retirees have low potential, professionals (doctors, lawyers etc) have the highest
    * Education – a higher level is better. Education is more important for middle-aged customers. For older customers income is more important than education-level.
    
### Expectation
* Generate a prospect list of 400 customers drawn from the database of 4000 customers (excluding customers in the trial promotion already) that maximises the expected profit.
  * the trial promotion results are in the file _trialPromoResults.csv_
  * the database of 4000 customers is in the file _custdatabase.csv_
