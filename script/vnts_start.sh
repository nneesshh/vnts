#!/bin/sh

startwork_release()
{
	cd ../bin/
	echo "begin start vnts"

  	#export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
	#export LD_PRELOAD="libjemalloc.so.2"

	nohup ./vnts --port 29619 --white-token abcdefg41 --gateway 10.10.0.1 --netmask 255.255.255.0 & echo $! > vnts.pid
	
	echo "end start vnts"
	cd ../script/
}

stopwork_release()
{
    cd ../bin/
    echo "begin stop vnts"
    #pkill server;
    #kill -9 $(sed -n 1p server.pid);
    kill -9 `cat vnts.pid`
    sleep 2
    echo "end stop vnts"
    cd ../script/

}

startwork_debug()
{
	cd ../bin/Debug/
	echo "begin start vnts"

  	#export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
	#export LD_PRELOAD="libjemalloc.so.2"

	nohup ./vnts --port 29619 --white-token abcdefg41 --gateway 10.10.0.1 --netmask 255.255.255.0 & echo $! > vnts.pid
	
	echo "end start vnts"
	cd ../../script/
}

stopwork_debug()
{
    cd ../bin/Debug/
    echo "begin stop vnts"
    #pkill server;
    #kill -9 $(sed -n 1p server.pid);
    kill -9 `cat vnts.pid`
    sleep 2
    echo "end stop vnts"
    cd ../../script/

}


    case $1 in
        -d)
            stopwork_debug
	        startwork_debug
        ;;
        -r)
            stopwork_release
	        startwork_release
        ;;
        *)
            stopwork_release
            startwork_release
        ;;
   esac
