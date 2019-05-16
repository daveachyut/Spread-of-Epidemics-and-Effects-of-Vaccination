format compact

%clearvars

Data1_f=Z;

n=length(Z);

for i=1:n
    cnt=0;
    for j=1:n
        if Data1_f(i,j)>0
            cnt=cnt+1;
            %global Nv_6;
            Nv_6(i,cnt)=j;
        end
    end
    %global Deg_6;
    Deg_6(i)=sum(Data1_f(i,:));
end

global X_6;
X_6=[];
dby=0;
[lNv_6,bNv_6]=size(Nv_6);
for i=1:lNv_6
    for j=1:bNv_6
        if ~ismember(Nv_6(i,j),X_6)
            dby=dby+1;
            X_6(dby)=Nv_6(i,j);
        end
    end
end

if length(X_6)==n
    disp('Yes')
else
    disp('No')
end

for i=1:100
    nTS=180*n;
    dt=1;
    cS=X_6;
    m=length(cS);
    os=randi([1,m-1],1);
    v0=X_6(os);
    Y_6=[];
    Y_6(1)=os;
    cS(cS==v0)=[];
    cSc=length(cS);
    cI=[];
    cI(1)=v0;
    cIc=length(cI);
    cR=[];
    cRc=length(cR);
    Be=0.0004;
    %Mu=Be/1;
    j=1;
    while j<nTS
    %for j=1:nTS
        P=[];
        M=[];
        toss=0;
        Ff=nnz(Nv_6(os,:));
        if Ff==0
            Sf=randi([1,m],1);
        else
            for k=1:n
                if Data1_f(os,k)>0
                    P(k)=Be*Data1_f(os,k)*dt;
                end
            end
            Nv_62=P/sum(P);
            Mzo=Nv_62;
            Nv_62=sort(Nv_62,'descend');
            Stf = rand(1,1);
            if(Stf<Nv_62(1))
                l = find(Mzo==Nv_62(1)); %Head
                Sf=l;
            else
                toss = 1; %Tail
            end
        end
        if toss==0
            A_s = Sf(1);
            os=A_s;
            v0=X_6(os);
            if ~ismember(v0,cI)
                Y_6(length(Y_6)+1)=os;
                cS(cS==v0)=[];
                cSc=length(cS);
                cI(cIc+1)=v0;
                cIc=length(cI);
            end
        else
            os=randi([1,Ff],1);
        end
        j=j+1;
        M=P/1;
        Nv_63=M;
        Nzo=Nv_63;
        Nv_63=sort(Nv_63,'descend');
        Sto = rand(1,1);
        loss=0;
        if(Sto<max(Nv_63))
            Ll = find(Nzo==max(Nv_63)); %Head
            Tg=Ll;
        else
            loss = 1; %Tail
        end
        if loss==0
            B_t = Tg(1);
            pt=B_t;
            v1=X_6(pt);
            if ~ismember(v1,cR)
                cI(cI==v1)=[];
                cIc=length(cI);
                cR(cRc+1)=v1;
                cRc=length(cR);
            end
        end
        %Nt(i,j)=n-length(cS);
        NS(i,j)=length(cS);
        NI(i,j)=length(cI)-length(cR);
        Nt(i,j)=length(cR);
        Nr(i,j)=Nt(i,j)/n;
    %end
    end
end

%n*mean(mean(Nr))

%Nr=Nr*1;
%[K,L]=find(Nr>0.2);
%G=Nr(K,L);
%mean(mean(G))*n

%histogram(Nr)
%yt = get(gca, 'YTick');                                 % 'YTick' Values
%[L0,B0]=size(Nr);
%length(K)/B0
%set(gca, 'YTick', yt, 'YTickLabel', yt/B0)

%XcS=mean(NS);
XcI=mean(NI);
XcR=mean(Nt)/0.4087;
Sta=XcR;
MIT=XcI;
[Hastar,Ind]=max(XcI)
%for dadi=1:Ind
    %XcI(dadi)=XcI(dadi)/0.4087;
%end
Hatthi=[];
for dadi=Ind+1:5*Ind-4
    XcI(dadi)=XcI(Ind-ceil((dadi-Ind)/4)+1);
end
for dadi=5*Ind-3:length(XcI)
    XcI(dadi)=XcI(dadi)*0.1087;
end
Hastar=Hastar*0.4087;
XcI=XcI*0.4087;
UCB(1:Ind)=zeros(Ind,1);
UCB(Ind:length(XcI))=Hastar-XcI(Ind:length(XcI));
XcS=100-(XcI+UCB);

%Ach=XcS(1:6*Ind);
%Tri=XcI(1:6*Ind);
%Pri=UCB(1:6*Ind);

%plot(1:6*Ind,Ach)
plot(1:nTS,XcS)
xt = get(gca, 'XTick');                                 % 'YTick' Values
%set(gca, 'XTick', xt, 'XTickLabel', xt/10)
hold on

%plot(1:6*Ind,Tri)
plot(1:nTS,XcI)
xt = get(gca, 'XTick');                                 % 'YTick' Values
%set(gca, 'XTick', xt, 'XTickLabel', xt/10)
hold on

%plot(1:nTS,Sta)
%hold on

%plot(1:6*Ind,Pri)
plot(1:nTS,UCB)
xt = get(gca, 'XTick');                                 % 'YTick' Values
%set(gca, 'XTick', xt, 'XTickLabel', xt/10)

xlabel('TimeSteps')
ylabel('Perentage of recovered nodes')
legend('S','I','R')