# GAP SCSCP server for the example of calling Singular from Python SCSCP client

LogTo(); # to close log file if it was opened from .:
LoadPackage("singular");
LoadPackage("scscp");

SetInfoLevel(InfoSCSCP,4);

InstallSCSCPprocedure( "Identity", x -> x, "Identity procedure for tests", 1, 1 );

RunSCSCPserver( SCSCPserverAddress, SCSCPserverPort : OMignoreMatrices);
