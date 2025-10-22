%---Data Reset---
clc
clear

%---Independent Variables---
m = 340;                         % Mass (kg)
k_spring = 35000;                % Spring Constant (N/m)
c = 1500;                        % Damping Coefficient (Ns/m)
wn_spring = sqrt(k_spring/m);    % Natural Frequency (rad/s)

%---Dependent Variables---
F0 = 4000;                       % Bump Force (N)
k_elec = 55000;                  % Electromagnetic Spring Constant (N/m)

%---Solving for Amplitude---
w = 0:0.5:4*wn_spring;           % Range of w values
for ii = 1:length(w)
amp_spring(ii) = F0 / sqrt((k_spring - m*w(ii)^2)^2 + (c*w(ii))^2);
amp_elec(ii) = F0 / sqrt((k_elec - m*w(ii)^2)^2 + (c*w(ii))^2);
end

%---Plot---
figure;
plot(w, amp_spring,'r-','Linewidth',2)
hold on
plot(w, amp_elec,'b-','Linewidth',2)

%---Plot Formatting---
title('Frequency Response (4000N Bump)')
legend('Standard Spring','Electromagnetic','Location','Best')
xlabel('Frequency (rad/s)');ylabel('Amplitude of S.S. Response')
xticks(0:pi:13*pi);
xticklabels({'0','\pi','2\pi','3\pi','4\pi','5\pi','6\pi','7\pi','8\pi','9\pi','10\pi','11\pi','12\pi','13\pi'});
grid on;
ylim([0, 0.3]);
xlim([0,13*pi]);
set(gca, 'FontSize', 12);