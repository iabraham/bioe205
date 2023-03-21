den = @(w) (w.*j).*(w.*j+10).*(w.*j+50);
num = @(w) 2000.*(w.*j + 0.5);
tf = @(w) num(w)./den(w);


w = logspace(-2,3, 1000);
subplot(1, 2, 1)
loglog(w, abs(tf(w)));
xlabel("Frequency [rad/s]")
ylabel("Magnitude")
title("Magnitude plot")
grid on

subplot(1, 2, 2)
semilogx(w, angle(tf(w))*180/pi);
grid on
xlabel("Frequency [rad/s]")
ylabel("Phase angle")
title("Phase plot")
sgtitle("Magnitude/phase plot for Example 2 above")