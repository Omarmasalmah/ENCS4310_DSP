% Define the input signal x[n]
Fs = 160;
t = linspace(0, 1, Fs);
x = cos(2*pi*2*t) + 0.5*cos(2*pi*50*t) + 0.25*cos(2*pi*80*t);

% Define the moving average filter impulse response
M = 15;
h = ones(1, M+1) / (M+1);

% Compute the frequency responses of X(e) and Y(e)
N = length(x);
X = fft(x);
Y = fft(conv(x, h, 'same'));
f = Fs*(0:(N/2))/N;

% Plot the magnitude spectra of X(e) and Y(e)
figure;
subplot(2,1,1);
plot(f, abs(X(1:N/2+1)));
xlabel('Frequency (Hz)');
ylabel('|X(e)|');
title('Input signal frequency spectrum');
subplot(2,1,2);
plot(f, abs(Y(1:N/2+1)));
xlabel('Frequency (Hz)');
ylabel('|Y(e)|');
title(['Output signal frequency spectrum, M = ', num2str(M)]);
