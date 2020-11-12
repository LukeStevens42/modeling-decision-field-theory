iter = 0;

pKeeper = [0;0;0];

%while iter < 1000
M = [.5 .093;.5 .1;.1 .5];

w = .52;
w = [w 1-w];
W = [0; 0];

C = [1 -.5 -.5;-.5 1 -.5;-.5 -.5 1];

P = [0;0;0];

S = [.95 -.09 -.001;-.09 .95 -.003;-.001 -.003 .95];

sig = 2;

theta = 10;
t = 1;



    while max(P) < theta
        V = C*M*W + sig * randn;

        thisAtt=2-(rand<=w(1));

        W(thisAtt)=1; 
        W(3-thisAtt)=0;

        t = t + 1;

        P(:,t) = S*P(:,t-1) + V;
    end
    
    iter = iter + 1;
    [maxVal,maxInd] = max(P(:,t));
    pKeeper(maxInd) = pKeeper(maxInd) + 1
    
%end
%plot([0 t+10],[theta theta],'k','LineWidth',4)
plot(P')
legend('Option1','Option 2','Option 3')
