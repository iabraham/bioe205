fsample = 50;
t0 = 0; 
tf = 30;
fsignal = 2*pi/5;

t = t0:1/fsample:tf;
y = sin(fsignal*t);
plot(t, y)
xlabel("Time (s)")
ylabel("Amplitude (V)")
title("Sinusoid constructed in lecture example")

saveas(gcf,strcat(pwd(),"/output/sinusoid"), "png") % # hide
