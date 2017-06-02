function [] = createDatFile( filename, C, A, b )

file = fopen(filename,'w');
[m,n] = size(C);

% en-tête
fprintf(file,'data;\n\n');

% dimensions
fprintf(file,'param M := %i;\n',m);
fprintf(file,'param N := %i;\n\n',n);

% Ecriture de C
fprintf(file,'param c :\t');
fprintf(file,'%i\t', 1:n);
fprintf(file,':=\n');
for i=1:m
    fprintf(file,'\t\t%i\t',i);
    fprintf(file,'%i\t',C(i,:));
    fprintf(file,'\n');
end
fprintf(file,';\n\n');

% Ecriture de A
fprintf(file,'param a :\t');
fprintf(file,'%i\t', 1:n);
fprintf(file,':=\n');
for i=1:m
    fprintf(file,'\t\t%i\t',i);
    fprintf(file,'%i\t',A(i,:));
    fprintf(file,'\n');
end
fprintf(file,';\n\n');

% Ecriture de b
fprintf(file,'param b  \t\t');
%fprintf(file,'%i\t', 1);
fprintf(file,':=\n');
for i=1:m
    fprintf(file,'\t\t%i\t',i);
    fprintf(file,'%i\t',b(i));
    fprintf(file,'\n');
end
fprintf(file,';\n\n');

% Fin de fichier
fprintf(file,'end;');

fclose(file);

end