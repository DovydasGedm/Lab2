clear all;
clc;

% Aproksimuojama funkcija
x = 0:1/49:1;
h = (1 + 0.6*sin(2*pi*x/0.7)) + (0.3*sin(2*pi*x))/2;

% 5 neuronai pasleptajame sluoksnyje
w_11 = randn(1);
b_11 = randn(1);
w_12 = randn(1);
b_12 = randn(1);
w_13 = randn(1);
b_13 = randn(1);
w_14 = randn(1);
b_14 = randn(1);
w_15 = randn(1);
b_15 = randn(1);

% 1 isejimo neuronas 
w_21 = randn(1);
w_22 = randn(1);
w_23 = randn(1);
w_24 = randn(1);
w_25 = randn(1);
b_21 = randn(1);

% Mokymo zingsnis
n = 0.1;
y = zeros(1,50);

% Daugiasluoksnio perceptrono mokymas
for a = 1:100000
    for i = 1:50
    % Pasleptojo sluoksnio isejimo skaiciavimas
    y_1 = 1/(1+exp(-x(i)*w_11-b_11));
    y_2 = 1/(1+exp(-x(i)*w_12-b_12));
    y_3 = 1/(1+exp(-x(i)*w_13-b_13));
    y_4 = 1/(1+exp(-x(i)*w_14-b_14));
    y_5 = 1/(1+exp(-x(i)*w_15-b_15));
    % Isejimo skaiciavimas
    y(i) = y_1*w_21 + y_2*w_22 + y_3*w_23 + y_4*w_24 + y_5*w_25 + b_21;
    % Isejimo nuokrypis nuo realios vertes
    e(i) = h(i) - y(i);
    
    % Isejimo sluoksnio svoriu atnaujinimas
    w_21 = w_21 + n*e(i)*y_1;
    w_22 = w_22 + n*e(i)*y_2;
    w_23 = w_23 + n*e(i)*y_3;
    w_24 = w_24 + n*e(i)*y_4;
    w_25 = w_25 + n*e(i)*y_5;
    b_21 = b_21 + n*e(i);
    
    % Pastleptojo sluoksnio svoriu atnaujinimas
    d1 = (1/(1+exp(-x(i)*w_11-b_11))*(1-1/(1+exp(-x(i)*w_11-b_11)))*e(i)*w_21);
    w_11 = w_11 + n*d1*x(i);
    d2 = (1/(1+exp(-x(i)*w_12-b_12))*(1-1/(1+exp(-x(i)*w_12-b_12)))*e(i)*w_22);
    w_12 = w_12 + n*d2*x(i);
    d3 = (1/(1+exp(-x(i)*w_13-b_13))*(1-1/(1+exp(-x(i)*w_13-b_13)))*e(i)*w_23);
    w_13 = w_13 + n*d3*x(i);
    d4 = (1/(1+exp(-x(i)*w_14-b_14))*(1-1/(1+exp(-x(i)*w_14-b_14)))*e(i)*w_24);
    w_14 = w_14 + n*d4*x(i);
    d5 = (1/(1+exp(-x(i)*w_15-b_15))*(1-1/(1+exp(-x(i)*w_15-b_15)))*e(i)*w_25);
    w_15 = w_15 + n*d5*x(i);
    
    b_11 = b_11 + n*d1;
    b_12 = b_12 + n*d2;
    b_13 = b_13 + n*d3;
    b_14 = b_14 + n*d4;
    b_15 = b_15 + n*d5;
    end
end

% Duotos funkcijos aproksimavimas daugiasluoksniu perceptronu, apskaiciavus
% jo koeficientus
for i = 1:50
    y_1 = 1/(1+exp(-x(i)*w_11-b_11));
    y_2 = 1/(1+exp(-x(i)*w_12-b_12));
    y_3 = 1/(1+exp(-x(i)*w_13-b_13));
    y_4 = 1/(1+exp(-x(i)*w_14-b_14));
    y_5 = 1/(1+exp(-x(i)*w_15-b_15));
    
    y(i) = y_1*w_21 + y_2*w_22 + y_3*w_23 + y_4*w_24 + y_5*w_25 + b_21;
end
    
% Kreiviu palyginimas
plot(x,h);
hold on
plot(x,y);
hold off







