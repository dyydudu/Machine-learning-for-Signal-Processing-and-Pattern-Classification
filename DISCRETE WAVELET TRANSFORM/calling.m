%calling userdefined wavdecomposition
x=1:8
[s,l] = userdefined_wave_decomposition(x,2)
[s,l]=wavedec(x,2,'haar')

%calling userdefined_wave_reconstruction
x
xrec=userdefined_wave_reconstruction(s,l)