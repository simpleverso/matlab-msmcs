clear all, close all;


zap(:,:,1)=[
255 255 0 255 0 255 0 0;
1 2 3 4 5 6 7 8;
8 7 6 5 4 3 2 1;
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
255 255 0 255 0 255 0 0;
];
zap(:,:,2)=[
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
1 2 3 4 5 6 7 8;
255 255 0 255 0 255 0 0;
1 2 3 4 5 6 7 8;
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
];
zap(:,:,3)=[
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
0 0 0 0 0 0 0 0;
1 2 3 4 5 6 7 8;
255 255 0 255 0 255 0 0;
];

%%


%f = imread('/Users/gsantiagom/Desktop/1.jpg');
f = zap;
%f = rgb2gray(img1);

[m,n] = size(f);

% construcción de la matriz A
A = zeros(3);
for i=2:1:m     %dese j = 2 por lo de la derecha
    for j=1:1:n-1 %hasta m-1 porque la ultima fila no se explora (por encima)
        val1 = f(i,j);
        val2 = f(i-1,j+1); % un pixel por encima y a la derecha del dado
        switch val1
            case 0
                switch val2
                    case  0
                       A(1,1) = A(1,1) + 1;
                    case  1
                       A(2,1) = A(2,1) + 1;
                    case  2
                       A(3,1) = A(3,1) + 1;
                end
            case 1
                switch val2
                    case  0
                       A(1,2) = A(1,2) + 1;
                    case  1
                       A(2,2) = A(2,2) + 1;
                    case  2
                       A(3,2) = A(3,2) + 1;
                end
            case 2
                switch val2
                    case  0
                       A(1,3) = A(1,3) + 1;
                    case  1
                       A(2,3) = A(2,3) + 1;
                    case  2
                       A(3,3) = A(3,3) + 1;
                end
        end
    end
end

c = sum(sum(A));


C = A./c;

% propiedades descriptivas
%%%%%%%%%%%%%%%%%%%%%%%%%%%


pmax = max(max(C));

Energia = sum(sum(C.^2));



k = 3;
[m,n] = size(C);

Momentok = 0; Momentoinvk = 0; Entropia = 0; 
Uniformidad = 0; Inercia = 0; HomogLocal = 0;
for i=1:1:m
    for j=1:1:n
      Momentok = Momentok + (i-j)^k*C(i,j);
      Inercia = Inercia + (i-j)^2*C(i,j);
      if i ~= j   
        Momentoinvk = Momentoinvk + C(i,j)/(i-j)^k;
      end
      if C(i,j) ~= 0
        Entropia = Entropia - C(i,j)*log10(C(i,j));
      end 
      Uniformidad = Uniformidad + C(i,j)^2;
      HomogLocal = HomogLocal + (1/(1+(i-j)^2))*C(i,j);
    end
end

% Correlacion
% calculo de mux
mux = 0;    
for i=1:1:m
    cx = 0;
    for j=1:1:n
      cx = cx + C(i,j);
    end
    mux = mux + i*cx;
end

% calculo de muy
muy = 0;
for j=1:1:n
    cy = 0;
    for i=1:1:m
      cy = cy + C(i,j);
    end
    muy = muy + j*cy;
end

% calculo de sigmax
sgx = 0;
for i=1:1:m
    scx = 0;
    for j=1:1:n
      scx = scx + C(i,j);
    end
    sgx = sgx + (i-mux)^2*scx;
end

% calculo de sigmay
sgy = 0;
for j=1:1:n
    scy = 0;
    for i=1:1:m
      scy = scy + C(i,j);
    end
    sgy = sgy + (j-muy)^2*scy;
end

sgx = sqrt(sgx);  sgy = sqrt(sgy);

Correlacion = 0; 
for i=1:1:m
    for j=1:1:n
      Correlacion = Correlacion + (j-mux)*(i-muy)*C(i,j);
    end
end

Correlacion = Correlacion/(sgx*sgy);

disp('Probabilidad máxima:'); disp(pmax);
disp('Energía:'); disp(Energia);
disp('Momento directo de orden k:'); disp(Momentok);
disp('Momento inverso de orden k:'); disp(Momentoinvk);
disp('Uniformidad:'); disp(Uniformidad);
disp('Entropía: '); disp(Entropia);
disp('Correlación: '); disp(Correlacion);
disp('Inercia: '); disp(Inercia);
disp('Homogeneidad Local: '); disp(HomogLocal);