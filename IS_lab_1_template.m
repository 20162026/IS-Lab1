%Classification using perceptron
clc
clear
%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
%4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
%5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
%6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
%7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
%8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
%9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%Desired output vector
T=[1;1;1;-1;-1]; % <- ČIA ANKSČIAU BUVO KLAIDA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);


n=0.02;
e=[];
%for kekw=[1:1000]
    for i= [1 2 3 4 5]
    
        % calculate weighted sum with randomly generated parameters
        %v1 = <...>; % write your code here
        v=x1(i)*w1+x2(i)*w2+b;
        % calculate current output of the perceptron 
        if v > 0
        	y = 1;
        else
        	y = -1;
        end
        % calculate the error
        e(i) = T(i) - y;
        
        w1=w1+n*e(i)*x1(i);
        w2=w2+n*e(i)*x2(i);
        b=b+e(i)*n;
    end
    e_abs = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
%end
iter=0;
a=0;
% write training algorithm
while e_abs ~=0
    while (e_abs ~=0  & a<1000000)  % executes while the total error is not 0
        
        for i= [1 2 3 4 5]
        
            % calculate weighted sum with randomly generated parameters
            %v1 = <...>; % write your code here
            v=x1(i)*w1+x2(i)*w2+b;
            % calculate current output of the perceptron 
            if v > 0
            	y = 1;
            else
            	y = -1;
            end
            % calculate the error
            e(i) = T(i) - y;
            
            w1=w1+n*e(i)*x1(i);
            w2=w2+n*e(i)*x2(i);
            b=b+e(i)*n;
        end
        e_abs = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
    	% calculate the total error for these 5 inputs '
       
        iter=iter+1;
        a=a+1;
    	
    end
    a=0;
disp('iterations');
disp(iter);
end

% disp(iter)
% disp(w1)
% disp(w2)
% disp(b)
% disp(e)
% disp(e_abs)


%tikriname atsakyma
%hsv_value_A1  A9  P1 P4
%metric_A1 A9     P1  P4
disp('----testing----')


x1_test=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_A7 hsv_value_A8 hsv_value_A9 hsv_value_P1 hsv_value_P2 hsv_value_P3 hsv_value_P4 ];
x2_test=[metric_A1 metric_A2 metric_A3 metric_A4 metric_A5 metric_A6 metric_A7 metric_A8 metric_A9 metric_P1 metric_P2 metric_P3 metric_P4 ];
P_test=[x1_test;x2_test]';
close all;

plot(x1_test(1:9),x2_test(1:9),'xg')
hold on
plot(x1_test(10:13),x2_test(10:13),'xr')



syms xx yy
f(xx,yy) = xx*w1+yy*w2+b;
figure(1)
fc = fcontour(f,[0 1 0 1]);
fc.LevelList = [0 0];

 


v_test=w1*x1_test+w2*x2_test+b;
for i=1:length(v_test)
    if v_test(i) > 0
    	y_test(i) = 1;
    else
    	y_test(i) = -1;
    end
end
disp(y_test)

disp('naive Bayes')
P_inv=P';
 
 
Mdl = fitcnb(P_inv,T);
label = (predict(Mdl ,P_test ))';

disp(label)
