%--------------------------------------------------
% Joseph Hilland
% ECE 439 DSP
% Fall 2014
%ttdecode.m
%--------------------------------------------------
function digits = ttdecode(input)

digits = zeros(1,7);
x = zeros(7,1000);
for k = 1:7
    start = 1 + 1100*(k-1);
    finish   = start + 999;
    x(k,:)       = input([start:finish]);
end

% part f
w0   = 2*pi/2048;
d0_k = round(1/w0*[0.7217 1.0247]); 
d1_k = round(1/w0*[0.5346 0.9273]);
d2_k = round(1/w0*[0.5346 1.0247]); 
d3_k = round(1/w0*[0.5346 1.1328]); 
d4_k = round(1/w0*[0.5906 0.9273]); 
d5_k = round(1/w0*[0.5906 1.0247]);
d6_k = round(1/w0*[0.5906 1.1328]); 
d7_k = round(1/w0*[0.6535 0.9273]); 
d8_k = round(1/w0*[0.6535 1.0247]); 
d9_k = round(1/w0*[0.6535 1.1328]);

d_k = [d0_k; d1_k; d2_k; d3_k; d4_k; d5_k; d6_k; d7_k; d8_k; d9_k];


for k = 1:7
    % fft of kth digit
    D = fft(x(k,:),2048);   
    p1  = 0, p2 = 0;
    max = 0;
    for p = 1:length(D)/2 
        if(abs(D(p)) > max)
            p1 = p;
            max = abs(D(p));
        end
    end
    % first peak
    D([p1-50:p1+50]) = zeros(1,101);
 
    max = 0;
    for p = 1:length(D)/2 
        if(abs(D(p)) > max)
            p2 = p;
            max = abs(D(p));
        end
    end
    % matlab indexing fix
    p1 = p1 - 1;
    p2 = p2 - 1;
    P = sort([p1 p2]);

    tol = 10;
    for j = 1:10
        if((abs(d_k(j,1)-P(1))<tol) && (abs(d_k(j,2)-P(2))<tol))
            digits(k) = j-1;
        end
    end
end

