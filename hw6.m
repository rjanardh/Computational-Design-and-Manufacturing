
%code to plot Bezier Curve
points_number_input=input('How many points?  ');

[Coordinates_input]=input('Enter Co-ordinates in array form ');
 
n_p = points_number_input -1;    
    
for    i=0:1:n_p

    combination(i+1)= factorial(n_p)/(factorial(i)*factorial(n_p-i));   

end

Mat_fin=[];
    
 Mat_emp=[];

 for k=0:0.01:1 %filling in mat values
     
    for i=1:points_number_input
        
        Mat_emp(i)=combination(i)*((1-k)^(points_number_input-i))*(k^(i-1)); %recursive def of bezier curve
    end
    
            Mat_fin=cat(1,Mat_fin,Mat_emp); %combining matrices
            
                end
Mat_new=Mat_fin*Coordinates_input;

    line(Mat_new(:,1),Mat_new(:,2),Mat_new(:,3))

    line(Coordinates_input(:,1),Coordinates_input(:,2),Coordinates_input(:,3))
    
    
    

    
