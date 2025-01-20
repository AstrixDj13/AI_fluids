clear
close all

%---- Laguerre functions -------------------------------------------------------
% Weight
w = @(x) exp(-x);

% Laguerre polynomials
L_0 = @(x) 1;
L_1 = @(x) -x+1;
L_2 = @(x) (x.^2-4*x+2)/2;
L_3 = @(x) (-x.^3+9*x.^2-18*x+6)/6;
L_4 = @(x) (x.^4-16*x.^3+72*x.^2-96*x+24)/24;

% Laguerre function
l_0 = @(x) L_0(x).*sqrt(w(x));
l_1 = @(x) L_1(x).*sqrt(w(x));
l_2 = @(x) L_2(x).*sqrt(w(x));
l_3 = @(x) L_3(x).*sqrt(w(x));
l_4 = @(x) L_4(x).*sqrt(w(x));

figure(1)
fplot(l_0, [0,20], 'DisplayName', 'l_0')
hold on
fplot(l_1, [0,20], 'DisplayName', 'l_1')
fplot(l_2, [0,20], 'DisplayName', 'l_2')
fplot(l_3, [0,20], 'DisplayName', 'l_3')
fplot(l_4, [0,20], 'DisplayName', 'l_4')
hold off
xlabel('x')
title('Laguerre functions')

% Orthogonality
inner_prod = zeros(5,5);

inner_prod(1,1) = integral(@(x) l_0(x).*l_0(x), 0, inf);
inner_prod(1,2) = integral(@(x) l_0(x).*l_1(x), 0, inf);
inner_prod(1,3) = integral(@(x) l_0(x).*l_2(x), 0, inf);
inner_prod(1,4) = integral(@(x) l_0(x).*l_3(x), 0, inf);
inner_prod(1,5) = integral(@(x) l_0(x).*l_4(x), 0, inf);

inner_prod(2,1) = integral(@(x) l_1(x).*l_0(x), 0, inf);
inner_prod(2,2) = integral(@(x) l_1(x).*l_1(x), 0, inf);
inner_prod(2,3) = integral(@(x) l_1(x).*l_2(x), 0, inf);
inner_prod(2,4) = integral(@(x) l_1(x).*l_3(x), 0, inf);
inner_prod(2,5) = integral(@(x) l_1(x).*l_4(x), 0, inf);

inner_prod(3,1) = integral(@(x) l_2(x).*l_0(x), 0, inf);
inner_prod(3,2) = integral(@(x) l_2(x).*l_1(x), 0, inf);
inner_prod(3,3) = integral(@(x) l_2(x).*l_2(x), 0, inf);
inner_prod(3,4) = integral(@(x) l_2(x).*l_3(x), 0, inf);
inner_prod(3,5) = integral(@(x) l_2(x).*l_4(x), 0, inf);

inner_prod(4,1) = integral(@(x) l_3(x).*l_0(x), 0, inf);
inner_prod(4,2) = integral(@(x) l_3(x).*l_1(x), 0, inf);
inner_prod(4,3) = integral(@(x) l_3(x).*l_2(x), 0, inf);
inner_prod(4,4) = integral(@(x) l_3(x).*l_3(x), 0, inf);
inner_prod(4,5) = integral(@(x) l_3(x).*l_4(x), 0, inf);

inner_prod(5,1) = integral(@(x) l_4(x).*l_0(x), 0, inf);
inner_prod(5,2) = integral(@(x) l_4(x).*l_1(x), 0, inf);
inner_prod(5,3) = integral(@(x) l_4(x).*l_2(x), 0, inf);
inner_prod(5,4) = integral(@(x) l_4(x).*l_3(x), 0, inf);
inner_prod(5,5) = integral(@(x) l_4(x).*l_4(x), 0, inf);


figure(2)
pcolor(inner_prod)
colorbar()
title('Orthogonality')

%---- Convolution with Laguerre functions --------------------------------------
f = @(x) (x>=0).*sin(x);

f_0 = @(x) integral(@(y) f(y).*l_0(x-y), -inf, x);
f_1 = @(x) integral(@(y) f(y).*l_1(x-y), -inf, x);
f_2 = @(x) integral(@(y) f(y).*l_2(x-y), -inf, x);
f_3 = @(x) integral(@(y) f(y).*l_3(x-y), -inf, x);
f_4 = @(x) integral(@(y) f(y).*l_4(x-y), -inf, x);

x_values = linspace(-10,50,300);

f_values = f(x_values);

f_0_values = zeros(length(x_values),1);
f_1_values = zeros(length(x_values),1);
f_2_values = zeros(length(x_values),1);
f_3_values = zeros(length(x_values),1);
f_4_values = zeros(length(x_values),1);


for i = 1:length(x_values)
    f_0_values(i) = f_0(x_values(i));
    f_1_values(i) = f_1(x_values(i));
    f_2_values(i) = f_2(x_values(i));
    f_3_values(i) = f_3(x_values(i));
    f_4_values(i) = f_4(x_values(i));
 end

figure(3)
plot(x_values, f_values)
hold on
plot(x_values, f_0_values)
plot(x_values, f_1_values)
plot(x_values, f_2_values)
plot(x_values, f_3_values)
plot(x_values, f_4_values)
hold off
title('Convolution')
