clc;
clear all;

% Aproksimuojamas pavirsius
x = -1:0.25:1;
[X,Y] = meshgrid(x);
Z = X.*exp(-X.^2-Y.^2);

% 5 neuronai pasleptajame sluoksnyje
w_11 = randn(1);
w_12 = randn(1);
w_13 = randn(1);
w_14 = randn(1);
w_15 = randn(1);
w_21 = randn(1);
w_22 = randn(1);
w_23 = randn(1);
w_24 = randn(1);
w_25 = randn(1);

b_11 = randn(1);
b_12 = randn(1);
b_13 = randn(1);
b_14 = randn(1);
b_15 = randn(1);

% 1 isejimo neuronas 
w_out1 = randn(1);
w_out2 = randn(1);
w_out3 = randn(1);
w_out4 = randn(1);
w_out5 = randn(1);
b_out1 = randn(1);

% Mokymo zingsnis
n = 0.1;
y = zeros(9,9);

% Daugiasluoksnio perceptrono mokymas
for a = 1:80000
    j = 0;
    k = 1;
    for i = 1:81
    j = j+1;
    % Pasleptojo sluoksnio isejimo skaiciavimas
    y_1 = 1/(1+exp(-X(i)*w_11-Y(i)*w_21-b_11));
    y_2 = 1/(1+exp(-X(i)*w_12-Y(i)*w_22-b_12));
    y_3 = 1/(1+exp(-X(i)*w_13-Y(i)*w_23-b_13));
    y_4 = 1/(1+exp(-X(i)*w_14-Y(i)*w_24-b_14));
    y_5 = 1/(1+exp(-X(i)*w_15-Y(i)*w_25-b_15));
    % Isejimo skaiciavimas
    if j > 9
    k = k+1;
    j = 1;
    end
    H(j,k) = y_1*w_out1 + y_2*w_out2 + y_3*w_out3 + y_4*w_out4 + y_5*w_out5 + b_out1;
    % Isejimo nuokrypis nuo realios vertes
    e(i) = Z(i) - H(i);
    
    % Isejimo sluoksnio svoriu atnaujinimas
    w_out1 = w_out1 + n*e(i)*y_1;
    w_out2 = w_out2 + n*e(i)*y_2;
    w_out3 = w_out3 + n*e(i)*y_3;
    w_out4 = w_out4 + n*e(i)*y_4;
    w_out5 = w_out5 + n*e(i)*y_5;
    b_out1 = b_out1 + n*e(i);
    
    % Pastleptojo sluoksnio svoriu atnaujinimas
    d1 = (1/(1+exp(-X(i)*w_11-Y(i)*w_21-b_11))*(1-1/(1+exp(-X(i)*w_11-Y(i)*w_21-b_11)))*e(i)*w_out1);
    w_11 = w_11 + n*d1*X(i);
    w_21 = w_21 + n*d1*Y(i);
    d2 = (1/(1+exp(-X(i)*w_12-Y(i)*w_22-b_12))*(1-1/(1+exp(-X(i)*w_12-Y(i)*w_22-b_12)))*e(i)*w_out2);
    w_12 = w_12 + n*d2*X(i);
    w_22 = w_22 + n*d2*Y(i);
    d3 = (1/(1+exp(-X(i)*w_13-Y(i)*w_23-b_13))*(1-1/(1+exp(-X(i)*w_13-Y(i)*w_23-b_13)))*e(i)*w_out3);
    w_13 = w_13 + n*d3*X(i);
    w_23 = w_23 + n*d3*Y(i);
    d4 = (1/(1+exp(-X(i)*w_14-Y(i)*w_24-b_14))*(1-1/(1+exp(-X(i)*w_14-Y(i)*w_24-b_14)))*e(i)*w_out4);
    w_14 = w_14 + n*d4*X(i);
    w_24 = w_24 + n*d4*Y(i);
    d5 = (1/(1+exp(-X(i)*w_15-Y(i)*w_25-b_15))*(1-1/(1+exp(-X(i)*w_15-Y(i)*w_25-b_15)))*e(i)*w_out5);
    w_15 = w_15 + n*d5*X(i);
    w_25 = w_25 + n*d5*Y(i);
    
    b_11 = b_11 + n*d1;
    b_12 = b_12 + n*d2;
    b_13 = b_13 + n*d3;
    b_14 = b_14 + n*d4;
    b_15 = b_15 + n*d5;
    end
end

% Duoto pavirsiaus aproksimavimas daugiasluoksniu perceptronu, apskaiciavus
% jo koeficientus
c = 0;
d = 1;

for i = 1:81
    c = c+1;
    % Pasleptojo sluoksnio isejimo skaiciavimas
    y_1 = 1/(1+exp(-X(i)*w_11-Y(i)*w_21-b_11));
    y_2 = 1/(1+exp(-X(i)*w_12-Y(i)*w_22-b_12));
    y_3 = 1/(1+exp(-X(i)*w_13-Y(i)*w_23-b_13));
    y_4 = 1/(1+exp(-X(i)*w_14-Y(i)*w_24-b_14));
    y_5 = 1/(1+exp(-X(i)*w_15-Y(i)*w_25-b_15));
    % Isejimo skaiciavimas
    if c > 9
    d = d+1;
    c = 1;
    end
    H(c,d) = y_1*w_out1 + y_2*w_out2 + y_3*w_out3 + y_4*w_out4 + y_5*w_out5 + b_out1;
end
    
% Pavirsiaus tasku palyginimas
plot3(X,Y,Z,'ro')
hold on
plot3(X,Y,H,'k*')
s = surf(X,Y,Z,'FaceAlpha',0.5);
s.EdgeColor = 'none';
hold off






