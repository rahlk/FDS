dat = read.table("~/git/FDS/HW3/q4c.txt", sep = "\t")
lfit <- glm(cbind(dat$V1)~dat$V2+dat$V3+dat$V4, family=binomial, data=dat)
print(summary(lfit))
