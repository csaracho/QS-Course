par(mfrow=c(2,4))

uno = predict(model2)[,1]
dos = predict(model2)[,2]

plot(EDO_CIVIL,uno,pch=16,xlab="Estado Civil",ylab="PC 1")
plot(EDO_CIVIL,dos,pch=16,xlab="Estado Civil",ylab="PC 2")

plot(EDAD,uno,pch=16,xlab="Edad",ylab="PC 1")
plot(EDAD,dos,pch=16,xlab="Edad",ylab="PC 2")

plot(No.MEDICAMENTOS,uno,pch=16,xlab="Medicamentos",ylab="PC 1")
plot(No.MEDICAMENTOS,dos,pch=16,xlab="Medicamentos",ylab="PC 2")


plot(ESCOLARIDAD,uno,pch=16,xlab="Escolaridad",ylab="PC 1")
plot(ESCOLARIDAD,dos,pch=16,xlab="Escolaridad",ylab="PC 2")


## PARA GRAFICAR boxplot finales
par(mfrow=c(2,2))
plot(COLESTEROL.0, xlab='Persona')
boxplot(COLESTEROL.0, xlab='Boxplot para COLESTEROL.0')
plot(COLESTEROL.1, xlab='Persona')
boxplot(COLESTEROL.1, xlab='Boxplot para COLESTEROL.1')

par(mfrow=c(2,2))
plot(TRIGLICERIDOS.0, xlab='Persona')
boxplot(TRIGLICERIDOS.0, xlab='Boxplot para TRIGLICERIDOS.0')
plot(TRIGLICERIDOS.1, xlab='Persona')
boxplot(TRIGLICERIDOS.1, xlab='Boxplot para TRIGLICERIDOS.1')


  