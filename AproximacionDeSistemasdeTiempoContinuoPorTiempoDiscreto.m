%Grafica de la Soluci�n a la ecuaci�n diferncial de la Actividad 1 del
%Voltaje en el Capacitor en el Sistema de 2do Orden
%d^2Vc(t)/dt^2+(R/L)dVc(t)/dt+(1/LC)Vc(t)=(1/LC)Vg(t)
%R/L=1 1/LC=5

clear%Borra todo lo que est� en el espacio de trabajo (WORKSPACE)
clc%Borra todo lo que est� en la ventana de comandos (command window)

t=0:0.1:10;%declaraci�n del vector tiempo
Vct=1-exp(-0.5*t).*(cos(2.1794*t)+0.2294*sin(2.1794*t));%Declaraci�n de la soluci�n a la ecuaci�n diferencial
subplot(2,1,1)%La figura se divide en dos graficas subplot(#cuantos_reglones_quieres ,#cuantas_columnas_quieres ,#que_posici�n_quieres)
plot(t,Vct)%Haz la gr�fica
xlabel('t[s]')%Ponle etiqueta en x
ylabel('Vc(t) [V]')%Ponle etiqueta en y
title('Soluci�n Anal�tica')%Ponle t�tulo


%Soluci�n a la ecuaci�n diferencial con la funci�n "dsolve" de Matlab
eqn='D2Vc+DVc+5*Vc=5'%Declaraci�n de la funci�n por medio de variable simb�lica o caracteres a trav�s de las comillas simples "''"
Vct=dsolve(eqn)%Resuelve la ecuaci�n diferencial dejando las constantes C1 y C2 sin resolver porque no se dieron las condiciones iniciales
Vct=dsolve(eqn,'DVc(0)=0','Vc(0)=0')%Resuelve la ecuaci�n diferencial Con V'c(0)=0 y Vc(0)=0
pretty(Vct)% Muestra en pantalla la soluci�n de la ecuaci�n Diferencial de una manera m�s arreglada (entendible a la vista)
subplot(2,1,2)%Se da la 2da posici�n de la figura (recordar la definici�n anterior)
ezplot(Vct,[0,10])%Comando para graficar variables simb�licas inicializadas o dadas por las comillas simples (caracteres)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Funci�n de transferencia en tiempo discreto con los distintos tiempos de muestreo de la ecuaci�n diferencial
figure
R=1; L=1; C=1/5;%Parametros
num=[1/(L*C)];
den=[1 R/L 1/(L*C)];
Hs=tf(num,den) %Funci�n de Transferencia en tiempo continuo
step(Hs)%Respuesta al escal�n
hold on%dibuja en la misma gr�fica
%Obten la funci�n de transferencia en tiempo discreto para distintos
%Tiempos de muestreo
Ts=1;
    Hz=c2d(Hs,Ts,'zoh')%Obtiene la funci�n de transferencia en tiempo discreto por el m�todo de retenedor de orden cero (mencionado en el manual)
    step(Hz)

Ts=0.1;
    Hz=c2d(Hs,Ts,'zoh')
    step(Hz)
    
Ts=0.01;
    Hz=c2d(Hs,Ts,'zoh')
    step(Hz)
    
Ts=0.001;
    Hz=c2d(Hs,Ts,'zoh')
    step(Hz)

Ts=0.0001;
    Hz=c2d(Hs,Ts,'zoh')
    step(Hz)
