
% Classification using perceptron

% Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

% Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

% Calculate for each image, colour and roundness
% For Apples
% 1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
% 2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
% 3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
% 4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
% 5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
% 6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
% 7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
% 8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
% 9th apple image(A9)
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

%Checking if training algoritm is correct
%A4,A5,A6,A7,A8,A9,P3,P4
xt1=[hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_A7 hsv_value_A8 hsv_value_A9 hsv_value_P3 hsv_value_P4];
xt2=[metric_A4 metric_A5 metric_A6 metric_A7 metric_A8 metric_A9 metric_P3 metric_P4];
% estimated features are stored in matrix Ptest for validation:
PTest=[xt1 ;xt2];


%Desired output vector
T=[1;1;1;-1;-1]; % <- ČIA ANKSČIAU BUVO KLAIDA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
%{
% calculate weighted sum with randomly generated parameters
v1 =  x1(1)*w1 + x2(1)*w2 + b % write your code here
% calculate current output of the perceptron 
if v1 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e1 = T(1) - y;

% repeat the same for the rest 4 inputs x1 and x2
% calculate wieghted sum with randomly generated parameters
v2 =  x1(2)*w1 + x2(2)*w2 + b ; % write your code here
% calculate current output of the perceptron 
if v2 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e2 = T(2) - y;


v3 =  x1(3)*w1 + x2(3)*w2 + b ; 
if v3 > 0
	y = 1;
else
	y = -1;
end
e3 = T(4) - y;

v4 =  x1(4)*w1 + x2(4)*w2 + b ; 
if v4 > 0
	y = 1;
else
	y = -1;
end
e4 = T(4) - y;

v5 =  x1(5)*w1 + x2(5)*w2 + b; 
if v5 > 0
	y = 1;
else
	y = -1;
end
e5 = T(5) - y;
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);
%}

% calculate the total error for these 5 inputs 
w1 = randn(1);
w2 = randn(1);
b = randn(1);
    e = zeros(1,5);
for i = 1:5
    v = P(1, i)*w1 + P(2, i)*w2 + b;
    if v > 0
	y = 1;
    else
	y = -1;
    end
e(i) = T(i) - y;
end
etotal = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));



% write training algorithm

n=0.1; %Training step
Cycle_count1 = 1; % Used to check every picture
Cycle_count2 = 0; % Used to count how many times weights have changed
while etotal ~= 0 % executes while the total error is not 0
	% here should be your code of parameter update
%   calculate output for current example
    for i = 1:5
    v = P(1, i)*w1 + P(2, i)*w2 + b;

        if v > 0
	    y = 1;
            else
	    y = -1;
        end
 %   calculate error for current example

 eCurrent = T(i) - y;
 %  update parameters using current inputs ant current error
 w1 = w1 + n*eCurrent*P(1, Cycle_count1);
 w2 = w2 + n*eCurrent*P(2, Cycle_count1);
 b = b + n*eCurrent;
 Cycle_count1 = Cycle_count1 + 1;

%   Test how good are updated parameters (weights) on all examples used for training        
         if Cycle_count1 > 5
            for i = 1:5
                v = P(1, i)*w1 + P(2, i)*w2 + b;
                if v > 0
	            y = 1;
                else
	            y = -1;
                end
            e(i) = T(i) - y;    
            end
         etotal = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
         Cycle_count1 = 1;
         end
         
    end
   Cycle_count2 = Cycle_count2 +1;
end


	


% display coeficients and counted numbers
fprintf('w1:');
disp(w1)
fprintf('w2:');
disp(w2)
fprintf('b:');
disp(b)
fprintf('Kiek kartu keisti svoriai:');
disp(Cycle_count2)

% Testing if coeficients are correct on other pictures
y = zeros(1,8);
    for i = 1:8
        v =  PTest(1, i)*w1 + PTest(2, i)*w2 + b;
        if v > 0;
            y(i) = 1;
        else
            y(i) = -1;
        end        
    end
Ttest=[1,1,1,1,1,1,-1,-1];

if Ttest == y
    disp("Everything is correct!")
else
    disp("Bad coefficients!")    
end
disp(y)