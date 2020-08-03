function[Z] = hw7
    
t =1;
l =1;

sample_no=25;
sample=rand(sample_no,3);

points_from_stl=[0 0 0;0 3 0;3 3 0;3 0 0;0 0 3;0 3 3;3 3 3;3 0 3];

stl_read(1:4,:)=[points_from_stl(1,:);points_from_stl(3,:);points_from_stl(6,:);points_from_stl(8,:)]; %cube split into tetras
stl_read(5:8,:)= [points_from_stl(1,:);points_from_stl(3,:);points_from_stl(4,:);points_from_stl(8,:)];
stl_read(9:12,:)=[points_from_stl(1,:);points_from_stl(2,:);points_from_stl(3,:);points_from_stl(6,:)];
stl_read(13:16,:)=[points_from_stl(1,:);points_from_stl(5,:);points_from_stl(6,:);points_from_stl(8,:)];
stl_read(17:20,:)=[points_from_stl(3,:);points_from_stl(6,:);points_from_stl(7,:);points_from_stl(8,:)];

tmr = 1;

for j=1:4:5*4    
    
    SL = delaunayn(stl_read(j:j+3,:));
    
        bound = freeBoundary(TriRep(SL,stl_read(j:j+3,:)));
    
            in=intriangulation(stl_read(j:j+3,:),bound,sample);
    
    while tmr ~=(18-7)
                
                if in(tmr) ==1
                     
                     
                  l=l+1; 
                  ctrl_pts(l,:) = sample(tmr,:);
                  t = t+1;
                        
                else
                    
                end
                
                tmr=tmr+1;
    end
    
    tmr=16/8*2;
end

subplot(2,1,1)
axis([0 3 0 3 0 3]);
hold on
plot3(sample(:,1),sample(:,2),sample(:,3),'>');
    if t >=8/4
        plot3(ctrl_pts(:,1),ctrl_pts(:,2),ctrl_pts(:,3),'o');
    else
    end
    
    
    
    subplot(2,1,2)
    
    axis([0 3 0 3 0 3]);
       
    
hold on

for j=1:4:5*4 
    SL = delaunayn(stl_read(j:j+3,:));
       
    bound = freeBoundary(TriRep(SL,stl_read(j:j+3,:)));
        
    surf_Sweep=trisurf(bound,stl_read(j:j+3,1),stl_read(j:j+3,2),stl_read(j:j+3,3));
        
    set(surf_Sweep,'FaceColor','yellow','FaceAlpha',1/3,'EdgeColor','black');
end

    hold on
    
    plot3(sample(:,1),sample(:,2),sample(:,3),'^');