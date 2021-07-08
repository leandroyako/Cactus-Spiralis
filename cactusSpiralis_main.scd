//Cmd+Enter en el siguiente bloque de código para iniciar el programa
(
//Recordar: set CPU scale processor: Performance (Linux)
//Server.supernova;
s.options.numInputBusChannels_(4); //4 live inputs
s.options.numOutputBusChannels_(2); //2 live outputs
s.options.memSize_(2.pow(20)); // //increase the memory available to the server
s.options.numBuffers_(1024 * 16); //increase number of buffers the server has access to for loading samples
//s.options.device = "Saffire";
n = NetAddr("192.168.1.35", 6060); // open-stage-control osc address
m = NetAddr("127.0.0.1", 57120); //SC osc address

//boot the server
s.waitForBoot{
	~decoder = FoaDecoderKernel.newUHJ;
	//~decoder = FoaDecoderMatrix.newPanto(6, \flat, \single);
	s.sync;
	//Numero de canal de la paca de audio
	~inFlNum = 2;
	~inGtrNum = 3;
	~inVlaNum = 1;
	~inCbNum = 0;
	("GroupsBusesSetup.scd").loadRelative;
	("SynthDefs.scd").loadRelative;
	s.sync;
	("SynthSetup.scd").loadRelative;
	("AuxFuncs.scd").loadRelative;
	("OSCdefs.scd").loadRelative;
	("openstagecontrol.scd").loadRelative;
//	("MIDIdefs.scd").loadRelative;
	StageLimiter.activate; //activate StageLimiter - Part of the BatLib quark
	s.prepareForRecord;
}; //waitForBoot
)

s.plotTree;
s.meter;

~releaseGrp.(1); //Terminar

/*
//Monitor Ins
(
~monitor0 = {Out.ar(0,Pan2.ar(SoundIn.ar(~inFlNum, 0.5)))}.play;
~monitor1 = {Out.ar(0,Pan2.ar(SoundIn.ar(~inGtrNum, 0.5)))}.play;
~monitor2 = {Out.ar(0,Pan2.ar(SoundIn.ar(~inVlaNum, 0.5)))}.play;
~monitor3 = {Out.ar(0,Pan2.ar(SoundIn.ar(~inCbNum, 0.5)))}.play;
)
(
~monitor0.free;
~monitor1.free;
~monitor2.free;
~monitor3.free;
)
*/