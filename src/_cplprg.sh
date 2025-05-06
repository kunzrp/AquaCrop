#!/usr/bin/env bash
#
vars="/O2 /fp:strict /arch:SSSE3"
#
#compile in the following order ONLY
ifort.exe /nologo ${vars} /c kinds.f90
ifort.exe /nologo ${vars} /c utils.f90
ifort.exe /nologo ${vars} /c project_input.f90
ifort.exe /nologo ${vars} /c global.f90
ifort.exe /nologo ${vars} /c defaultcropsoil.f90
ifort.exe /nologo ${vars} /c climprocessing.f90
ifort.exe /nologo ${vars} /c initialsettings.f90
ifort.exe /nologo ${vars} /c inforesults.f90
ifort.exe /nologo ${vars} /c rootunit.f90
ifort.exe /nologo ${vars} /c tempprocessing.f90
ifort.exe /nologo ${vars} /c simul.f90
ifort.exe /nologo ${vars} /c preparefertilitysalinity.f90
ifort.exe /nologo ${vars} /c run.f90
ifort.exe /nologo ${vars} /c startunit.f90
#
ifort.exe /nologo ${vars}    aquacrop.f90 /link startunit.obj run.obj preparefertilitysalinity.obj simul.obj tempprocessing.obj rootunit.obj inforesults.obj initialsettings.obj climprocessing.obj defaultcropsoil.obj global.obj project_input.obj utils.obj kinds.obj
#
rm -f *.mod
rm -f *.obj
rm -f *.pdb
rm -f *.i90
#
mv -f aquacrop.exe aquacrop_SA_v73.exe
