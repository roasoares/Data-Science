#CURSO GRÁFICOS COM ESTILO USANDO 'R'
#ON-LINE PELA DAMY
#PROFESSOR: ISAÍAS LIRA


#Pacotes 
library(plotly)
library(magrittr)



### testes para gerar gráficos
## Grafico
## faz o grafico da funcao Qui-quadrado com 4 graus de liberdade,
## veja ajuda funcao curve
curve(dchisq(x, df=4),0,70, xlab="Qui-quadrado, 4 g.l.", ylab="Densidade probabilística")
## Sobrepoe uma linha vermelha a partir do ponto Chi2=56,93
curve(dchisq(x, df=4), 56.93, 70, add=T, col="blue", lwd=2)

#GRÁFICOS
# PACOTE (PACKAGES) plotly
library(plotly)
plot_ly(y = ~db_comarca$total, type = "box", boxpoints = "all", jitter = 0.5,
        pointpos = -1.8)

# Plotar frequencia de distribuição por classes processuais
plot_ly(db_classes_demandas_comarca, x = ~total)# histrograma

plot_ly(db_classes_demandas_comarca, x = ~total, type = "scatter") # gráfico de dispersão

plot_ly(db_classes_demandas_comarca, y = ~total, type = "box", name = "Classes judiciais") # gráfico boxplot



#transformar campo caracter em "Factor"
db_perc_sistema[,3]<-as.factor(db_perc_sistema$str_sistema)

#sumarizar campo factor
summary(db_perc_sistema$str_sistema)

#plotar variável "Factor"

barplot(summary(db_perc_sistema$str_sistema),col= c("green","red","yellow","blue"),xlab="SISTEMAS", ylab="Quantidade", main = "DISTRIBUIÇÃO DE PROCESSOS POR SISTEMA")

# Gráfios com o plotly
library(plotly)
plot_ly(y = ~db_comarca$total, type = "box", boxpoints = "all", jitter = 0.5,
        pointpos = -1.8)

# Plotar frequencia de distribuição por classes processuais
plot_ly(db_perc_sistema, x = ~total)# histrograma

plot_ly(db_perc_sistema, x = ~total, type = "scatter") # gráfico de dispersão

plot_ly(db_perc_sistema, x = ~total, type = "box", name = "Classes judiciais") # gráfico boxplot

# Exemplos Gráficos interativos
library(plotly)
library(magrittr)

plot_ly(x = c("PJe","Projudi","Themis"), y = c(20,15,90),name = "Número de casos novos", type="bar")%>% layout(title ='DISTRIBUIÇÃO POR SISTEMA')

plot_ly(x = c("PJe","Projudi","Themis"), y = c(20,15,90),name = "Número de casos novos", type="bar")%>% layout(title ='Distribuição por Sistema')

# Exemplos
sistemas<-c("PJe","ThemisPG")
casosnovos<-c(200,150)
julgados<-c(150,100)
resumo<-data.frame(sistemas,casosnovos,julgados)

plot_ly(resumo,x = ~resumo$sistemas, y=~resumo$casosnovos, type = 'bar',  name = 'Casos novos')%>%
  add_trace(y= ~resumo$julgados, name = 'Julgados')%>%
  layout(title = "RESUMO", xaxis = list(title = "sistemas"), yaxis = list(title = "Quantitativo",barmode = 'group'))

plot_ly(resumo,x = ~resumo$sistemas, y=~resumo$casosnovos, type = 'bar', name = 'Casos novos',text = ~resumo$casosnovos, textposition = 'auto')%>%
  add_trace(y= ~resumo$julgados, name = 'Julgados',text = ~resumo$julgados, textposition = 'auto')%>%
  layout(title = "RESUMO", xaxis = list(title = "sistemas"), yaxis = list(title = "Quantitativo",barmode = 'group'))



plot_ly(resumo,x = ~resumo$sistemas, y=~resumo$casosnovos, type = 'bar',text = ~resumo$casosnovos, textposition = 'auto',
        marker = list(color = 'rgb(158,202,225)',
        line = list(color = 'red', width = 1.5)))%>%
  layout(title = "Casos Novos Distribuidos",
  xaxis = list(title = "Casos novos"),
  yaxis = list(title = "quantitativo"))
