%bezier surface
B11 = [0 0 0]; B12 = [2 0 2]; B13 = [3 0 2]; B14 = [5 0 0];
B21 = [0 2 1]; B22 = [2 2 3]; B23 = [3 2 3]; B24 = [5 2 1];
B31 = [0 3 1]; B32 = [2 3 3]; B33 = [3 3 3]; B34 = [5 3 1];
B41 = [0 5 0]; B42 = [2 5 2]; B43 = [3 5 2]; B44 = [5 5 0];

x_vert = [ B11(1,1) B12(1,1) B13(1,1) B14(1,1);
           B21(1,1) B22(1,1) B23(1,1) B24(1,1);
           B31(1,1) B32(1,1) B33(1,1) B34(1,1);
           B41(1,1) B42(1,1) B43(1,1) B44(1,1)];
       
y_vert = [ B11(1,2) B12(1,2) B13(1,2) B14(1,2);
           B21(1,2) B22(1,2) B23(1,2) B24(1,2);
           B31(1,2) B32(1,2) B33(1,2) B34(1,2);
           B41(1,2) B42(1,2) B43(1,2) B44(1,2)];   
       
z_vert = [ B11(1,3) B12(1,3) B13(1,3) B14(1,3);
           B21(1,3) B22(1,3) B23(1,3) B24(1,3);
           B31(1,3) B32(1,3) B33(1,3) B34(1,3);
           B41(1,3) B42(1,3) B43(1,3) B44(1,3)];  
       
       Mat = [-1 3 -3 1;3 -6 3 0;-3 3 0 0;1 0 0 0];
       
       k = 0:0.05:1;
       for i = 1:21
           K(i,1) = k(i)^3;
           K(i,2) = k(i)^2;
           K(i,3)=  k(i);
           K(i,4) = 1;
       end
       
        t = 0:0.05:1;
       for i = 1:21
           T(i,1) = t(i)^3;
           T(i,2) = t(i)^2;
           T(i,3)= t(i);
           T(i,4) = 1;
       end
       
       for i = 1:21
           for j=1:21
               Surf_X(i,j) = K(i,:)*Mat*x_vert*Mat'*T(j,:)';
               Surf_Y(i,j) = K(i,:)*Mat*y_vert*Mat'*T(j,:)';
               Surf_Z(i,j) = K(i,:)*Mat*z_vert*Mat'*T(j,:)';
           end
       end
       
       figure(1);
       axis([0,6,0,6,0,6]);
       xlabel('X');
       ylabel('Y');
       zlabel('Z');
       grid on;
       hold on
       
       for i=1:21
       plot3(Surf_X(:,i),Surf_Y(:,i),Surf_Z(:,i),'m');
       plot3(Surf_X(i,:),Surf_Y(i,:),Surf_Z(i,:),'m');
       end
       
       for i=1:100
       plot3(x_vert(i,:),y_vert(i,:),z_vert(i,:),'r');
       plot3(x_vert(:,i),y_vert(:,i),z_vert(:,i),'r');
   
       end
       
       