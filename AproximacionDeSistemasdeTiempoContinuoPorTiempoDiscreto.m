%Grafica de la Solución a la ecuación diferncial de la Actividad 1 del
%Voltaje en el Capacitor en el Sistema de 2do Orden
%d^2Vc(t)/dt^2+(R/L)dVc(t)/dt+(1/LC)Vc(t)=(1/LC)Vg(t)
%R/L=1 1/LC=5

clear%Borra todo lo que esté en el espacio de trabajo (WORKSPACE)
clc%Borra todo lo que esté en la ventana de comandos (command window)

t=0:0.1:10;%declaración del vector tiempo
Vct=1-exp(-0.5*t).*(cos(2.1794*t)+0.2294*sin(2.1794*t));%Declaración de la solución a la ecuación diferencial
subplot(2,1,1)%La figura se divide en dos graficas subplot(#cuantos_reglones_quieres ,#cuantas_columnas_quieres ,#que_posición_quieres)
plot(t,Vct)%Haz la gráfica
xlabel('t[s]')%Ponle etiqueta en x
ylabel('Vc(t) [V]')%Ponle etiqueta en y
title('Solución Analítica')%Ponle título


%Solución a la ecuación diferencial con la función "dsolve" de Matlab
eqn='D2Vc+DVc+5*Vc=5'%Declaración de la función por medio de variable simbólica o caracteres a través de las comillas simples "''"
Vct=dsolve(eqn)%Resuelve la ecuación diferencial dejando las constantes C1 y C2 sin resolver porque no se dieron las condiciones iniciales
Vct=dsolve(eqn,'DVc(0)=0','Vc(0)=0')%Resuelve la ecuación diferencial Con V'c(0)=0 y Vc(0)=0
pretty(Vct)% Muestra en pantalla la solución de la ecuación Diferencial de una manera más arreglada (entendible a la vista)
subplot(2,1,2)%Se da la 2da posición de la figura (recordar la definición anterior)
ezplot(Vct,[0,10])%Comando para graficar variables simbólicas inicializadas o dadas por las comillas simples (caracteres)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Función de transferencia en tiempo discreto con los distintos tiempos de muestreo de la ecuación diferencial
figure
R=1; L=1; C=1/5;%Parametros
num=[1/(L*C)];
den=[1 R/L 1/(L*C)];
Hs=tf(num,den) %Función de Transferencia en tiempo continuo
step(Hs)%Respuesta al escalón
hold on%dibuja en la misma gráfica
%Obten la función de transferencia en tiempo discreto para distintos
%Tiempos de muestreo
Ts=1;
    Hz=c2d(Hs,Ts,'zoh')%Obtiene la función de transferencia en tiempo discreto por el método de retenedor de orden cero (mencionado en el manual)
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
