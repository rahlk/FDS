# Read CSV
ad = read.csv("~/git/FDS/HW3/data.csv")
# TV
reg1 <- lm(ad[,5]~ad[,2])
print(coefficients(reg1))
mse <- sum(resid(reg1)^2)
plot(ad[,2], ad[,5], ylab = 'Sales', xlab = 'TV')
abline(reg=reg1)
print(mse)

# Radio
reg1 <- lm(ad[,5]~ad[,3])
print(coefficients(reg1))
mse <- sum(resid(reg1)^2)
plot(ad[,3], ad[,5], ylab = 'Sales', xlab = 'Radio')
abline(reg=reg1)
print(mse)

# Newspaper
reg1 <- lm(ad[,5]~ad[,4])
print(coefficients(reg1))
mse <- sum(resid(reg1)^2)
plot(ad[,4], ad[,5], ylab = 'Sales', xlab = 'Newspaper')
abline(reg=reg1)
print(mse)

# Multregress
reg1 <- lm(ad[,5]~ad[,2]+ad[,3]+ad[,4])
print(coefficients(reg1))
mse <- sum(resid(reg1)^2)
print(mse)

