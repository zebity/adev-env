
all : put get GetComponent PutComponent \
 InsertComponent CreateMaintenanceRelease

put : a.out
	cp a.out put
	chmod 111 put
	chmod u+s put

PutComponent : a.out
	cp a.out PutComponent
	chmod 111 PutComponent
	chmod u+s PutComponent

InsertComponent : a.out
	cp a.out InsertComponent
	chmod 111 InsertComponent
	chmod u+s InsertComponent

CreateMaintenanceRelease : a.out
	cp a.out CreateMaintenanceRelease
	chmod 111 CreateMaintenanceRelease
	chmod u+s CreateMaintenanceRelease

GetComponent : a.out
	cp a.out GetComponent
	chmod 111 GetComponent
	chmod u+s GetComponent

get : a.out
	cp a.out get
	chmod 111 get
	chmod u+s get

clean :
	rm -f a.out
	rm -f get
	rm -f put
	rm -f GetComponent
	rm -f PutComponent
	rm -f InsertComponent
	rm -f CreateMaintenanceRelease

install : 
	cp get $r/version_1.0
	cp put $r/version_1.0
	cp GetComponent $r/version_1.0
	cp PutComponent $r/version_1.0
	cp InsertComponent $r/version_1.0
	cp CreateMaintenanceRelease $r/version_1.0

a.out :
	/opt/local/bin/gcc Switch2Root.c -L/lib/libc.a
