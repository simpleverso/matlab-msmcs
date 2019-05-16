%fuzzy c means real 
x(:,:)=[
1 1; 
4 1; 
4 2; 
5.5 1];

%parametro de fuzzificacion
m = 2;

%ploteo de datos
hold on
plot(x(:,1),x(:,2),'b+');
hold off

%creacion de matriz para los 2 clusters
u(:,:) = [0 0 1 1; 1 1 0 0];

%creamos matriz de centroides 
v = size(2);

%calculamos los centroides
for i = 1 : size(u,1)
    for j = 1 : size(x,2)
        temp = 0;
        temp2 = 0;
        for k = 1 : size(x,1)
            temp = temp + u(i,k)^m * x(k,j);
            temp2 = temp2 + u(i,k)^m;
        end
        v(i,j) = temp / temp2;
    end
    clear i,clear j,clear k,clear temp2,clear temp
end


% ploteamos los centroides
hold on
    plot(v(:,1),v(:,2),'b+');
hold off

d = zeros(size(v,2),size(x,1));

for i = 1 : size(x,1)
    for j = 1 :2 :size(x,2)
        for k = 1 : size(v,2)
%             d(k,i);
            disp(i); disp(k);
        end
    end
end

