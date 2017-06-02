function [] = dat_generator( src_file, dest_file )

[C, A, b] = loadfile(src_file);
createDatFile(dest_file, C, A, b);

end