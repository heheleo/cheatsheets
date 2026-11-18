#import "../template.typ": *

#show: conf.with(
  header: "Data Analysis Cheatsheet",
  column_count: 2,
  font_size: 7.2pt,
)

#show heading.where(level: 1): set text(size: 1.1em)
#show heading.where(level: 2): set text(size: 0.9em)
#show heading.where(level: 3): set text(size: 0.8em)
#set table(
  inset: (x: 4pt, y: 3pt),
  stroke: 0.4pt + black,
  
)

= Definitions
- *Random sample* of size $n$ from a population with distribution $F$ is a collection of random variables $X_1,...,X_n$ such that the random variables are independent and identically distributed (i.i.d.) with distribution $F$.
- *Statistic* is a function of the sample, $T(X_1,...,X_n)$, that does not depend on any unknown parameters.
- *Estimator* is a statistic used to estimate a parameter. e.g. $overline(X), S^2, hat(p)$ are estimators of $mu, sigma^2, p$ respectively.
- *Point estimate* is a single value used to estimate a parameter.
- *Interval estimate* is a range of values used to estimate a parameter. e.g. confidence intervals. It gives a range of values that is likely to contain the true parameter value with a certain level of confidence.
- *Prediction interval vs confidence interval*: A prediction interval is an estimate of an interval in which a future observation will fall, with a certain level of confidence. A confidence interval is an estimate of an interval in which a population parameter will fall, with a certain level of confidence.
- *Standard deviation vs standard error*: Standard deviation is a measure of the amount of variation or dispersion in a dataset. Standard error is the standard deviation of the sampling distribution of a statistic - across repeated random samples.

== Testing definitions
#grid(
  columns: 2,
  gutter: 1em,
  [
    - *Type I error* is rejecting $H_0$ when it is true. $P("Type I Error") = alpha$.
    - *Type II error* is failing to reject $H_0$ when it is false. It is denoted $beta$.
  ],
  [
    #image("../assets/type_i_ii_errors.png")
  ],
)

- *Power* is the probability of correctly rejecting $H_0$ when it is false. Power = $1 - beta$. Monotonic relationship with significance level $alpha$ and sample size $n$. 
- *p-value* is the probability of observing a test statistic as extreme or more extreme than the one observed, assuming $H_0$ is true. Small p-value $->$ the observed data is unlikely under $H_0$ $->$ reject $H_0$.

== CI definitions
- *Confidence level* is the probability that the confidence interval procedure produces an interval containing the true population parameter. e.g. a 95% confidence level means that if we were to take many samples and construct a confidence interval from each sample, we would expect 95% of those intervals to contain the true population parameter.
- *Confidence interval* is an interval estimate of a population parameter that is likely to contain the true parameter value with a certain level of confidence. Interpretation: "We are 95% confident that the true population mean $mu$ lies within the interval $(a, b)$."

= Hypothesis testing

== Which hypothesis test?
#grid(
  columns: 2,
  [
    - Categorical (counts/proportions)
      - Proportions (2 categories)
        - 1 sample: 1-prop z-test
        - 2 samples: 2-prop z-test
      - Counts in 2+ categories (table)
        - 1 sample vs claimed: $chi^2$ goodness-of-fit
        - 2 samples/several groups: $chi^2$ independence

  ],
  [
    - Quantitative (means)
      - How many groups?
        - 1 group: t-test (df $n-1$) / z-test (if $sigma$ known)
        - 2 groups, paired: t-test on differences, df $n-1$
        - 2 groups, independent: 2-sample t-test with pooled/Welch t
        - 3+ groups: ANOVA $F(k-1, N-k)$
      - Predicting y from quantitative x
        - Slope test with t-test, df $n-2$
  ],
)

- *Paired testing* is for comparing two related sets of measurements from the same subjects, items, or matched pairs. Two groups are dependent on each other. e.g. before-and-after measurements.
- *Independent testing* is for comparing two unrelated sets of measurements from different subjects, items, or groups. Two groups are independent of each other. 

== Hypothesis testing process
1. *Hypotheses*: Name the parameter ($p$, $mu$, $p_1 - p_2$, $mu_1 - mu_2$, ...) and state the null and alternative hypotheses $H_0$ and $H_A$. Sides come from the question, not the data. Also state the significance level $alpha$.
2. *Conditions*: Check the conditions for the test (e.g., independence, normality, sample size, etc.).
3. *Test statistic*: Calculate the test statistic.
4. Calculate *p-value or critical value*.
5. *Decision*: Compare p-value to $alpha$ (or test statistic to critical value) and decide whether to reject or fail to reject $H_0$.
  - If p-value $< alpha$, reject $H_0$; otherwise, fail to reject $H_0$.
  - If the test statistic is in the critical region, reject $H_0$; otherwise, fail to reject $H_0$.
  - For a two-sided test, if the null value is not in the $(1 - alpha)$ confidence interval, reject $H_0$; otherwise, fail to reject $H_0$. 

= Exploratory data analysis

== Summary of graphical displays
#table(
  columns: (.2fr, .2fr, 1fr, 1fr),
  "Num", "Cat", "What you are exploring", "Recommended displays",
  "1", "0", "Distribution of a single numerical variable", "Histogram, boxplot, dotplot, stem-and-leaf plot",
  "0", "1", "Frequency of categories", "Bar chart, table",
  "2", "0", "Relationship between two numerical variables", "Scatterplot",
  "1", "1", "Comparison of a numerical variable across categories", "Comparative dotplots, boxplots, histogram",
  "0", "2", "Relationship between two categorical variables", "Contingency table, comparative bar charts",
)

== Formulas/Theorems
- *Sample mean*: $overline(x) = 1/n sum_(i=1)^n x_i$
- *Sample variance*: $s^2 = 1/(n-1) sum_(i=1)^n (x_i - overline(x))^2$
- *Correlation coefficient*: $ r = (sum_(i=1)^n (x_i - overline(x))(y_i - overline(y))) / sqrt(sum_(i=1)^n (x_i - overline(x))^2 times sum_(i=1)^n (y_i - overline(y))^2) = 1/(n-1) sum_(i=1)^n ((x_i - overline(x)) / s_x) ((y_i - overline(y)) / s_y) $
where $s_x = sqrt(1/(n-1) sum_(i=1)^n (x_i - overline(x))^2)$ is the sample standard deviation of $x$.
- *Population correlation coefficient*: $rho = (op("Cov")(X, Y)) / (sigma_X sigma_Y)$
- *Law of large numbers*: If $X_1,...,X_n$ are i.i.d. with mean $mu$, then as $n -> oo$, the sample mean $overline(X) = 1/n sum_(i=1)^n X_i$ converges to $mu$.
- *Central limit theorem*: If $X_1,...,X_n$ are i.i.d. with mean $mu$ and variance $sigma^2$, then as $n -> oo$, the sum of the random variables $S_n = sum_(i=1)^n X_i$ is approximately normally distributed with mean $n mu$ and variance $n sigma^2$. Equivalently, the sample mean $overline(X) = S_n / n$ is approximately normally distributed with mean $mu$ and variance $sigma^2 / n$.
- *Distribution of $overline(X)$*: $E(overline(X)) = mu$, $"Var"(overline(X)) = sigma^2 / n$, $overline(X) ~ N(mu, sigma^2 / n)$ for large $n$.
- *Distribution of $hat(p)$*: $E(hat(p)) = p$, $"Var"(hat(p)) = p(1-p)/n$, $hat(p) ~ N(p, p(1-p)/n)$ for large $n$.
- For normal distributions, if $X ~ N(mu_X, sigma_X^2)$ and $Y ~ N(mu_Y, sigma_Y^2)$ are independent, then $Z = X + Y ~ N(mu_X + mu_Y, sigma_X^2 + sigma_Y^2)$.
- For binomial random variables, if $X ~ Bin(n_X, p)$ and $Y ~ Bin(n_Y, p)$ are independent, then $Z = X + Y ~ Bin(n_X + n_Y, p)$. If probabilities differ, the sum is discrete but not binomial.
- *Continuity correction*: Used when you approximate a binomial distribution with a normal distribution: $P(X <= k) = P(X <= k + 0.5)$, $P(X >= k) = P(X >= k - 0.5)$, $P(a <= X <= b) = P(a - 0.5 <= X <= b + 0.5)$.

== Calculating Type 7 quantiles
1. Sort the data in ascending order: $x_((1)), ..., x_((n))$
2. Compute fractional position $h = (n-1)q + 1$ where $n$ is the number of data points and $q$ is the desired quantile (e.g., for the median, $q=0.5$).
3. Let $j = floor(h)$ and $gamma = h - j$.
4. The quantile is $(1 - gamma) times x_((j)) + gamma times x_((j+1))$.



= One sample tests
General structure of a test statistic: $"test statistic" = ("estimator" - "null value") / "null standard error"$
#table(
  columns: 3,
  "Test", "Assumptions", "Test statistic",

  [$1$-prop z-test],
  [Random sample, $n p_0 >= 5$, $n (1 - p_0) >= 5$. $p_0$ is the claimed value. $hat(p)$ is the sample proportion.],
  [$z = (hat(p) - p_0) / sqrt((p_0 (1 - p_0)) / n)$],

  [$1$-mean t-test],
  [Random sample, $X$ is normal or $n >= 30$, unknown variance],
  [$t = (overline(x) - mu_0) / (S / sqrt(n))$, df $= n - 1$],

  [$1$-mean z-test],
  [Random sample, $X$ is normal or $n >= 30$, $sigma$ known],
  [$z = (overline(x) - mu_0) / (sigma / sqrt(n))$],
)


= Two sample tests
Tests where the null hypothesis is $H_0 : mu_1 - mu_2 = Delta_0$ (for proportions, $H_0 : p_1 - p_2 = 0$).

#table(
  columns: 3,
  "Test", "Assumptions", "Test statistic",

  [$2$-mean z-test],
  [Random samples, variances known],
  [$z = (overline(x) - overline(y) - Delta_0) / sqrt(sigma_1^2 / n_1 + sigma_2^2 / n_2)$],

  [$2$-mean t-test, pooled],
  [Random samples, variances unknown but equal],
  [$t = (overline(x) - overline(y) - Delta_0) / (S_p sqrt(1/n_1 + 1/n_2))$,
    $S_p^2 = ((n_1 - 1) S_1^2 + (n_2 - 1) S_2^2) / (n_1 + n_2 - 2)$, df $= n_1 + n_2 - 2$],

  [$2$-mean t-test, Welch],
  [Random samples, variances unknown and unequal],
  [$t = (overline(x) - overline(y) - Delta_0) / sqrt(S_1^2 / n_1 + S_2^2 / n_2)$, df $= nu$],

  [Paired sample t-test],
  [Random sample of paired differences, differences are normal or $n$ large],
  [$t = (overline(x)_Delta - Delta_0) / (S_d / sqrt(n))$, df $= n - 1$],

  [$2$-prop z-test],
  [Random samples, $n_1 hat(p)_1 >= 5$, $n_1 (1 - hat(p)_1) >= 5$, $n_2 hat(p)_2 >= 5$, $n_2 (1 - hat(p)_2) >= 5$; $Delta_0 = 0$],
  [$z = (hat(p)_1 - hat(p)_2) / sqrt(hat(p) (1 - hat(p)) (1/n_1 + 1/n_2))$, $hat(p) = (x_1 + x_2) / (n_1 + n_2)$ (pooled)],
)

$ "Welch df:" nu = (S_1^2 \/ n_1 + S_2^2 \/ n_2)^2 / ((S_1^2 \/ n_1)^2 / (n_1 - 1) + (S_2^2 \/ n_2)^2 / (n_2 - 1)) $

= Confidence intervals
#table(
  columns: 4,
  [$X_i$], [$n$], [$sigma^2$], [$1-alpha$ CI],

  [$X_i ~ N(mu, sigma^2)$], [any], [known], [$overline(x) pm z_(1-alpha/2) sigma/sqrt(n)$],

  [$X_i ~ "any"$], [large], [known], [$overline(x) pm z_(1-alpha/2) sigma/sqrt(n)$],

  [$X_i ~ "any"$], [large], [unknown], [$overline(x) pm t_(n-1, 1-alpha/2) S/sqrt(n)$],

  [$hat(P) ~ Bin(n, p)$], [large], [N/A], [$hat(p) pm z_(1-alpha/2) sqrt((hat(p)(1-hat(p)))/n)$],
)

== Confidence intervals for two samples
#text(size: 6.5pt)[
  #table(
    columns: (auto, 0.9fr, 1.6fr),
    "Parameter", "Assumptions", [$1 - alpha$ CI],

    [$mu_1 - mu_2$],
    [Known variances],
    [$(overline(x) - overline(y)) pm z_(1-alpha/2) sqrt(sigma_1^2/n_1 + sigma_2^2/n_2)$],

    [$mu_1 - mu_2$],
    [Unknown, equal],
    [$(overline(x) - overline(y)) pm t_(n_1+n_2-2, 1-alpha/2) S_p sqrt(1/n_1 + 1/n_2)$],

    [$mu_1 - mu_2$],
    [Welch],
    [$(overline(x) - overline(y)) pm t_(nu, 1-alpha/2) sqrt(S_1^2/n_1 + S_2^2/n_2)$],

    [$mu_d = mu_1 - mu_2$],
    [Paired],
    [$overline(d) pm t_(n-1, 1-alpha/2) S_d/sqrt(n)$],

    [$p_1 - p_2$],
    [Large samples],
    [$(hat(p)_1 - hat(p)_2) pm z_(1-alpha/2) sqrt((hat(p)_1 (1-hat(p)_1))/n_1 + (hat(p)_2(1-hat(p)_2))/n_2)$],
  )
]

= ANOVA
- *Purpose*: determine existence of a statistically significant difference among several group means by using variances. The test compares the variance between group means with the variance within groups; under $H_0$, both estimate the same population variance $sigma^2$.

== Assumptions
- *Normality*: each population from which a sample is taken is assumed to be normal
- *Independence*: all samples are randomly selected and independent
- *Equal variances*: the populations are assumed to have equal standard deviations
- *Variable types*: the explanatory variable is a categorical variable, the response variable is a numerical variable

== Process
- *Null hypothesis* $H_0$: All population means are equal, $mu_1 = mu_2 = ... = mu_k$
- *Alternative hypothesis* $H_A$: at least two of the group means are different, $mu_i != mu_j$ for some $i != j$

Assuming $k$ groups with sizes $n_1, n_2, ..., n_k$ and total sample size $N = sum_(i=1)^k n_i$:
+ Calculate the group means and grand mean
  - Group mean = $overline(y_(i .)) = 1/n_i sum_(j=1)^n_i y_(i j)$
  - Grand mean = $overline(y_(..)) = 1/N sum_(i=1)^k sum_(j=1)^n_i y_(i j)$
+ Calculate the sum of squares between groups (SSB) and sum of squares within groups (SSW)
  - $"SSB" = sum_(i=1)^k n_i (overline(y_(i .)) - overline(y_(..)))^2$
  - $"SSW" = sum_(i=1)^k sum_(j=1)^n_i (y_(i j) - overline(y_(i .)))^2$
+ Calculate the mean square between groups (MSB) and mean square within groups (MSW)
  - $"MSB" = "SSB" / (k - 1)$
  - $"MSW" = "SSW" / (N - k)$
+ Calculate the F-statistic: $F = "MSB" / "MSW"$ where $F$ follows $F_(k-1, N-k)$
+ If $F_"obs" > F_"crit"$, reject $H_0$; otherwise, fail to reject $H_0$.

#table(
  columns: 5,
  "Source", "SS (Sum of Squares)", "df (degrees of freedom)", "MS = SS/df (Mean Square)", "F-statistic = MSB/MSW",
  "Between groups", "SSB", $k-1$, "MSB", "F",
  "Within groups", "SSW", $N-k$, "MSW", "",
  "Total", "SST = SSB + SSW", $N-1$, "", "",
)

== Post hoc test
If result is significant (reject $H_0$, or p-value $< alpha$), perform a post hoc test to determine which group means are different. Tukey's HSD (honestly significant difference) is a common post hoc test.
In R, it calculates all pairwise comparisons of the categories along with their mean differences and adjusted p-values.
If the adjusted p-value is less than $alpha$, the difference between the two group means is statistically significant.

// == ANOVA Example
// #grid(
//   columns: 2,
//   gutter: 1em,
//   [
//     - Group 1: 6, 8, 10
//     - Group 2: 4, 5, 7, 6
//     - Group 3: 9, 11, 10
//   ],
//   [
//     - Group means: $overline(y_(1 .)) = 8$, $overline(y_(2 .)) = 5.5$, $overline(y_(3 .)) = 10$
//     - Grand mean: $overline(y_(..)) = 7.6$
//     - SSB = $3(8 - 7.6)^2 + 4(5.5 - 7.6)^2 + 3(10 - 7.6)^2 = 35.4$
//     - SSW:
//       - Group 1: $(6 - 8)^2 + (8 - 8)^2 + (10 - 8)^2 = 8$
//       - Group 2: $(4 - 5.5)^2 + (5 - 5.5)^2 + (7 - 5.5)^2 + (6 - 5.5)^2 = 5$
//       - Group 3: $(9 - 10)^2 + (11 - 10)^2 + (10 - 10)^2 = 2$
//       - SSW = $8 + 5 + 2 = 15$
//   ],
// )


= Simple linear regression
$ y_i = beta_0 + beta_1 x_i + epsilon_i $ where $epsilon_i ~ N(0, sigma^2)$ are i.i.d. random errors.

- $hat(beta_1) = (sum_(i=1)^n (x_i - overline(x))(y_i - overline(y))) / sum_(i=1)^n (x_i - overline(x))^2$
- $hat(beta_0) = overline(y) - hat(beta_1) overline(x)$
- $hat(sigma)^2 = 1/(n-2) sum_(i=1)^n (y_i - hat(y)_i)^2$. $hat(sigma)$ is the residual standard error (RSE)

== Interpretations
- *Slope* ($hat(beta_1)$): (RV) increases/decreases by ($hat(beta_1)$) (units of RV) for each one (unit of EV) increase in (EV).
- *Intercept* ($hat(beta_0)$): When the (EV) is 0 (units of EV), the predicted (RV) is $hat(beta)_0$ (units of RV).
- *Coefficient of determination* ($R^2$): $r^2 times 100\%$ of the variation in the (RV) can be explained by the variation in the (EV).
  - How to calculate $R^2$: $R^2 = 1 - ("SS"_"residual" / "SS"_"total")$ where $"SS"_"residual" = sum_(i=1)^n (y_i - hat(y)_i)^2$ and $"SS"_"total" = sum_(i=1)^n (y_i - overline(y))^2$.
  - From ANOVA, $R^2 = "SSB" / "SST"$
- *Residual standard error* ($hat(sigma)$): typical deviation of observed (RV) from the regression line.
  - Formula: $hat(sigma) = sqrt(1/(n-2) sum_(i=1)^n (y_i - hat(y)_i)^2)=sqrt("SSE"/"df")=sqrt("MSE")$
== Assumptions
- *Independence*: $e_i$ are independent (from experimental design)
- *Normality*: $e_i$ are normal variables (QQ plot)
- *Constant variance*: variance is constant, roughly even spread for all fitted values in the resids vs fits plot
- *Linearity*: residual plot should have no patterns.

== Slope test
- *Purpose*: Tests whether there is a significant linear relationship between the explanatory and response variables.
- *Hypotheses* $H_0$: $beta_1 = 0$ (no linear relationship), $H_A$: $beta_1 != 0$ (existence of  linear relationship)
- *Test statistic*: $ t = (hat(beta_1) - 0) / (hat(sigma) / sqrt(sum_(i=1)^n (x_i - overline(x))^2)) $ with $n - 2$ degrees of freedom.
- *p-value*: $2 times P(T > |t|)$ where $T ~ t_(n-2)$
- *Decision*: If p-value $< alpha$, reject $H_0$; otherwise, fail to reject $H_0$.
- *Confidence interval interpretation*: "We are $(1-alpha)$% confident that for each one (unit of EV) increase in (EV), the (RV) increases/decreases by between $(a, b)$ (units of RV) on average."
- *Confidence interval for mean response*
$ hat(y)_0 pm t_(n-2, 1-alpha/2) hat(sigma) sqrt(1/n + (x_0 - overline(x))^2 / (sum_(i=1)^n (x_i - overline(x))^2)) $
- *Prediction interval for new response*
$
  hat(y)_0 pm t_(n-2, 1-alpha/2) hat(sigma) sqrt(1 + 1/n + (x_0 - overline(x))^2 / (sum_(i=1)^n (x_i - overline(x))^2))
$

= Chi-squared distribution
Random variable of a chi-square distribution with $k$ degrees of freedom is the sum of $k$ independent, squared standard normal variables: $chi^2 = (Z_1)^2 + ... + (Z_k)^2$ where $Z_i ~ N(0, 1)$

== Independence test
- *Purpose*: Tests whether two categorical variables are independent. Let $p_(i j)$ denote the probability of an observation falling in row $i$ and column $j$ of a contingency table.
- *Hypotheses*: $H_0: p_(i j) = p_i p_j$. $H_A$: $p_(i j) != p_i p_j$ for some $i, j$.
  - Alternatively: $H_0$: the two categorical variables are independent. $H_A$: the two categorical variables are not independent.
- *Expected counts*: $E_(i j) = ("row total"_i times "column total"_j) / "grand total"$.
- *Test statistic*: $chi^2 = sum sum (O_(i j) - E_(i j))^2 / E_(i j)$ where $O_(i j)$ are the observed counts and $E_(i j)$ are the expected counts. The test statistic follows a chi-square distribution with $(r-1)(c-1)$ degrees of freedom. Large values of $chi^2$ indicate greater deviation between observed and expected → evidence against $H_0$
- *Condition for rejection*: If $chi^2_"obs" > chi^2_(1-alpha, (r-1)(c-1))$, reject $H_0$; otherwise, fail to reject $H_0$. If rejected, interpret the result in context: "There is sufficient evidence to suggest that the two categorical variables are not independent." or in terms of association: "There is sufficient evidence to suggest that there is an association between the two categorical variables."
- *Assumptions*
  - Categories are mutually exclusive. A subject can only belong to one category in each variable
  - The sample data consists of frequency counts for different categories of the two categorical variables.
  - Observations are independent (no subject is counted more than once)
  - All expected counts $> 1$.
  - At least 80% of expected counts $>= 5$.
  - Not satisfied → combine categories (columns/rows) and/or collect more data.

== Goodness-of-fit test
- *Purpose*: Tests whether a categorical variable follows a specified distribution. e.g. Do candy colours follow the manufacturer's stated proportions? Are the outcomes of a die uniform?
- *Hypotheses*: $H_0: P(X=i) = p_(i)^((0))$ for all categories $i = 1, ..., k$. $H_A$: at least one $P(X=i) != p_(i)^((0))$.
- *Expected counts*: $E_i = n p_(i)^((0))$.
- *Test statistic*: $chi^2 = sum (O_i - E_i)^2 / E_i$ where $O_i$ are the observed counts and $E_i$ are the expected counts. The test statistic follows a chi-square distribution with $k-1$ degrees of freedom. Large values of $chi^2$ indicate greater deviation between observed and expected → evidence against $H_0$
- *Degrees of freedom*: with $q$ parameters estimated from the data, the degrees of freedom is $k - 1 - q$.
- *P-value*: $P(chi^2_(k-1-q) > chi^2_"obs")$. Not double sided.
- *Condition for rejection*: If $chi^2_"obs" > chi^2_(1-alpha, k-1-q)$, reject $H_0$; otherwise, fail to reject $H_0$. If rejected, interpret the result in context: "There is sufficient evidence to suggest that the categorical variable does not follow the specified distribution."

// = Classic F-test
// - *Purpose*: For comparing two sample variances. Useful to determine which test to use for two-sample t-tests (pooled vs Welch).
// - *Hypotheses*: $H_0: sigma_1^2 = sigma_2^2$. $H_A$: $sigma_1^2 != sigma_2^2$. (comparing if population variances are equal)
// - *Test statistic*: $F = S_1^2 / S_2^2$ where $S_1^2$ is the larger sample variance. The test statistic follows an F-distribution with $"df"_1 = n_1 - 1$ and $"df"_2 = n_2 - 1$ degrees of freedom. Large values of $F$ indicate greater deviation between the two sample variances → evidence against $H_0$.
// - *Condition for rejection*: If $F_"obs" > F_(1-alpha, "df"_1, "df"_2)$, reject $H_0$; otherwise, fail to reject $H_0$. If rejected, interpret the result in context: "There is sufficient evidence to suggest that the two population variances are not equal." As a rough rule of thumb, if the ratio of the two sample variances is greater than 2, it is likely that the population variances are *not equal* (use Welch t-test).
= R
== Distribution functions
#table(
  columns: 3,
  [Distribution], [CDF $P(X <= q)$], [Quantile $x$: $P(X <= x) = p$],
  [Normal], [`pnorm(q, mean, sd)`], [`qnorm(p, mean, sd)`],
  [Binomial], [`pbinom(q, size, prob)`], [`qbinom(p, size, prob)`],
  [$t$], [`pt(q, df)`], [`qt(p, df)`],
  [$chi^2$], [`pchisq(q, df)`], [`qchisq(p, df)`],
)
- *Default*: `lower.tail = TRUE` gives $P(X <= x)$; `lower.tail = FALSE` gives $P(X > x) = 1 - P(X <= x)$.
- *Continuous*: `pnorm(x, lower.tail = FALSE)` equals `1 - pnorm(x)`; `qnorm(p, lower.tail = FALSE)` equals `qnorm(1 - p)`.
- *Discrete*: `pbinom(x, size, prob, lower.tail = FALSE)` is $P(X > x)$, not $P(X >= x)$; for $P(X >= x)$ use `pbinom(x - 1, size, prob, lower.tail = FALSE)`.
- *Quantile*: `qbinom(p, size, prob)` is the smallest $x$ with $P(X <= x) >= p$.

== Critical values and p-values
#table(
  columns: 2,
  [Want], [R],
  [95% $z$ critical value], [`qnorm(0.975)` = 1.96],
  [95% $t$ critical value, df 10], [`qt(0.975, 10)` = 2.23],
  [95% $chi^2$ critical value, df 3], [`qchisq(0.95, 3)` = 7.81],
)

- For critical values, make sure you are using the correct distribution and degrees of freedom. For example, for a 95% confidence interval, use `qnorm(0.975)`, not `qnorm(0.95)`. 