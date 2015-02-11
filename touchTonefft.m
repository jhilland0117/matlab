%--------------------------------------------------
% Joseph Hilland
% ECE 439 DSP
% Fall 2014
%touchTonefft.m
%--------------------------------------------------

% ------------------------ A --------------------------------
N = 2048;
n = 0:999;
d0 = sin(0.7217*n) + sin(1.0247*n);
%sound(d0, 8192);
d1 = sin(0.5346*n) + sin(0.9273*n);
%sound(d1, 8192);
d2 = sin(0.5346*n) + sin(1.0247*n);
%sound(d2, 8192);
d3 = sin(0.5346*n) + sin(1.1328*n);
%sound(d3, 8192);
d4 = sin(0.5906*n) + sin(0.9273*n);
%sound(d4, 8192);
d5 = sin(0.5906*n) + sin(1.0247*n);
%sound(d5, 8192);
d6 = sin(0.5906*n) + sin(1.1328*n);
%sound(d6, 8192);
d7 = sin(0.6535*n) + sin(0.9273*n);
%sound(d7, 8192);
d8 = sin(0.6535*n) + sin(1.0247*n);
%sound(d8, 8192);
d9 = sin(0.6535*n) + sin(1.1328*n);
%sound(d9, 8192);

% ------------------------ B --------------------------------
% calculate the DTFT of digit 2 and digit 9
% then plot the magnitude and verify peak fall at correct frequency
D2 = fft(d2, N);
D9 = fft(d9, N);
k = 0:2047;
wk = (2 * pi * k) / N;

% plot for digit 2 DTFT
%subplot(2,2,1), plot(wk, abs(D2));
%title('DTFT D2');
%axis([0.5, 1.5, 0, 500]);
%xlabel('Freq'), ylabel('mag')
%subplot(2,1,1), plot(wk,angle(D2));
%xlabel('freq'), ylabel('phase')

% plot for digit 9 DTFT
%subplot(2,2,2), plot(wk, abs(D9));
%title('DTFT D9');
%axis([0.5, 1.5, 0, 500]);
%xlabel('Freq'), ylabel('mag')
%subplot(2,1,1), plot(wk,angle(D9));
%xlabel('freq'), ylabel('phase')

% ------------------------ C --------------------------------
space = zeros(1, 100);
phone = [d8 space d3 space d5 space d9 space d0 space d3 space d2 space];
%sound(phone, 8192);

% ------------------------ D --------------------------------
% methods for x1
load('touch.mat');
x1_1 = x1([1:1000]);
x1_2 = x1([1100:2100]);
x1_3 = x1([2200:3200]);
x1_4 = x1([3300:4300]);
x1_5 = x1([4400:5400]);
x1_6 = x1([5500:6500]);
x1_7 = x1([6600:7600]);

X11 = (fft(x1_1,N));
X12 = (fft(x1_2,N));
X13 = (fft(x1_3,N));
X14 = (fft(x1_4,N));
X15 = (fft(x1_5,N));
X16 = (fft(x1_6,N));
X17 = (fft(x1_7,N));

%plot(wk, abs(X11),wk, abs(X12), wk, abs(X13), wk, abs(X14), wk, abs(X15), wk, abs(X16), wk, abs(X17));
%LEG = legend('X11', 'X12', 'X13', 'X14', 'X15', 'X16', 'X17');
%set(LEG, 'FontSize', 14);
%title('DTFT touch.mat: x1');
%axis([0, 2, 0, 500]);
%xlabel('Freq'), ylabel('mag')
% 2, 3, 4, 7, 8, 8, 9

% ------------------------ E --------------------------------
% methods for x2
x2_1 = x2([1:1000]);
x2_2 = x2([1100:2100]);
x2_3 = x2([2200:3200]);
x2_4 = x2([3300:4300]);
x2_5 = x2([4400:5400]);
x2_6 = x2([5500:6500]);
x2_7 = x2([6600:7600]);

X11 = (fft(x2_1,N));
X12 = (fft(x2_2,N));
X13 = (fft(x2_3,N));
X14 = (fft(x2_4,N));
X15 = (fft(x2_5,N));
X16 = (fft(x2_6,N));
X17 = (fft(x2_7,N));

%plot(wk, abs(X11),wk, abs(X12), wk, abs(X13), wk, abs(X14), wk, abs(X15), wk, abs(X16), wk, abs(X17));
%LEG = legend('X11', 'X12', 'X13', 'X14', 'X15', 'X16', 'X17');
%set(LEG, 'FontSize', 14);
%title('DTFT touch.mat: x2');
%axis([0, 2, 0, 500]);
%xlabel('Freq'), ylabel('mag')

% ------------------------ F --------------------------------
w0   = 2*pi/2048;
d0_k = round(1 / w0 * [0.7217 1.0247]); 
d1_k = round(1 / w0 * [0.5346 0.9273]);
d2_k = round(1 / w0 * [0.5346 1.0247]); 
d3_k = round(1 / w0 * [0.5346 1.1328]); 
d4_k = round(1 / w0 * [0.5906 0.9273]); 
d5_k = round(1 / w0 * [0.5906 1.0247]);
d6_k = round(1 / w0 * [0.5906 1.1328]); 
d7_k = round(1 / w0 * [0.6535 0.9273]); 
d8_k = round(1 / w0 * [0.6535 1.0247]); 
d9_k = round(1 / w0 * [0.6535 1.1328]);

d_k = [d0_k; d1_k; d2_k; d3_k; d4_k; d5_k; d6_k; d7_k; d8_k; d9_k];

% ------------------------ g --------------------------------

D8 = fft(d8, 2048);
plot(w0*[0:2047], abs(D8).^2);

% loop to search for highest peaks
k1 = 0; max_1 = 0;
k2 = 0; max_2 = 0;
for k = 1:length(D8)/2 
    if(abs(D8(k)) > max_1)
        k2 = k1; max_2 = max_1;
        k1 = k;  max_1 = abs(D8(k));
    elseif(abs(D8(k)) > max_2)
        k2 = k;  max_2 = abs(D8(k));
    end
end

% ------------------------ h --------------------------------


