
% Parameters
A = 1;        % amplitude
f = 2;        % frequency in Hz
fs = 1000;    % sampling rate (samples/sec)
t = 0:1/fs:1; % time vector (1 second)

% Signal
x = A*sin(2*pi*f*t);

% Plot
figure
plot(t,x,"b","LineWidth",1.5)
xlabel("Time (s)")
ylabel("Amplitude")
title("Sine Wave")
grid on