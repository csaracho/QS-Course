## Comparacion ANTES DESPUES

trats = as.factor(No.MEDICAMENTOS) ## trats como factores del No. de meds
trats
[1] 3 5 2 3 5 2 5 6 1 4 1 1 4 3 5 1 4 2 5 3 6 2 6 5
[25] 5 3 4 6 1 2 1
Levels: 1 2 3 4 5 6

par(mfrow=c(2,2))
plot(trats, COLESTEROL.0, xlab = 'No. Medicamentos',ylab = 'COLESTEROL.0', ylim=c(130,260), col = 'yellow')
grid(col = "lightgray", lty = "dotted",     lwd = par("lwd"), equilogs = TRUE)
plot(trats, TRIGLICERIDOS.0, xlab = 'No. Medicamentos',ylab = 'TRIGLICERIDOS.0', ylim = c(70, 220), col = 'orange')
grid(col = "lightgray", lty = "dotted",     lwd = par("lwd"), equilogs = TRUE)
plot(trats, COLESTEROL.1, xlab = 'No. Medicamentos',ylab = 'COLESTEROL.1', ylim=c(130,260), col = 'yellow')
grid(col = "lightgray", lty = "dotted",     lwd = par("lwd"), equilogs = TRUE)
plot(trats, TRIGLICERIDOS.1, xlab = 'No. Medicamentos',ylab = 'TRIGLICERIDOS.1', ylim = c(70, 220), col = 'orange')
grid(col = "lightgray", lty = "dotted",     lwd = par("lwd"), equilogs = TRUE)
