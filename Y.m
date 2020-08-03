function [X] = Y

x =1;
y =1;

ordinates = [0 3 3.5;0 1 0;3 2 0;2 0 2];


sampling_no=4;
sample = rand(sampling_no,3);

tmr = 1;

for k=1:100:2
    SL = delaunayn(ordinates(k:k+3,:)); %generate delaunay triangulation as per intriangulation algorithm
    el = freeBoundary(TriRep(SL,ordinates(k:k+3,:)));
    t=intriangulation(ordinates(k:k+3,:),el,sample);
    while tmr ~=1
        if t(tmr) == 1
            
            ui(y,:) = sample(tmr,:);
            
            y=y+1;
            
            x = x +1;
           
        else
        end
        
        tmr=tmr+1;
    end
    
    tmr=1;
end

subplot(1,2,1)
   axis([0 4 0 4 0 4]);
       hold on
   
    
plot3(sample(:,1),sample(:,2),sample(:,3),'>');

    if x >=4/2
    
    plot3(ui(:,1),ui(:,2),ui(:,3),'o');

    else
    
    end

subplot(1,2,2)
    axis([0 4 0 4 0 4]);
        
    
hold on

for k=1:100:2
    SL = delaunayn(ordinates(k:k+3,:));
       el = freeBoundary(TriRep(SL,ordinates(k:k+3,:)));
        QIN=trisurf(el,ordinates(k:k+3,1),ordinates(k:k+3,2),ordinates(k:k+3,3));
        set(QIN,'FaceColor','green','FaceAlpha',1/3,'EdgeColor','black');
end

    hold on
        
    plot3(sample(:,1),sample(:,2),sample(:,3),'r.');