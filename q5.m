clear; clc;
inn = [ 'q5/1.wav'; 'q5/2.wav' ;'q5/3.wav' ;'q5/4.wav' ;'q5/5.wav'];
Z = reorderDatagram(inn);

function next = reorderDatagram(in)
    data = [];
    fs = [];
    stdt = [];
    endt = [];
    for k1 = 1:length(in)
        [x_,y_] = audioread(in(k1,:));
        data = [ data x_];
        fs = [fs y_];
    end
    
    for k1 = 1:length(in)
        dd = data(k1);
        ff = fs(k1);
        stdt = [stdt dd(1:5*ff,:)];
        endt = [stdt dd(length(dd) - 5*ff + 1:length(dd),:)];
    end
    
    next=[];
    for i = 1:length(in)
        max = -1;
        maxv= -1;
        for j = 1:length(in)
            if i == j
                continue;
            end
            z = max(abs(xcorr(endt(i),stdt(j))));
            if z > maxv
                maxv = z;
                max = j;
            end
        end
        next =[next max];
    end        
    display(next);
            
end