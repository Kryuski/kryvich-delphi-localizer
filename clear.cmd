del /f /s *.~* *.bak *.dsk *.identcache *.local *.map *.drc *.log *.ddp *.stat *.vlb *.rsm
del *.dcu

cd Demo
del /f /s *.dcu *.exe *.dll *.bpl
cd ..

cd DemoFireMonkey
del /f /s *.dcu *.exe *.dll *.bpl
cd ..

rd /s /q __history
rd /s /q __recovery
rd /s /q demo\__history
rd /s /q demo\__recovery
rd /s /q DemoFireMonkey\__history
rd /s /q DemoFireMonkey\__recovery
