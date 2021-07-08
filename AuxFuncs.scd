//////////////////// Aux functions ////////////////////

~freeAll = {
	~inGroup.freeAll;
	~conditGroup.freeAll;
	~fxGroup.freeAll;
	~encoderGroup.freeAll;
	~transformerGroup.freeAll;
	~decoderGroup.freeAll;

	~inFl.free;
	~inGtr.free;
	~inVla.free;
	~inCb.free;
	~encoderBus.free;
	~transformerBus.free;
	~decoderBus.free;
};

~releaseGrp = {|time = 1|
	~inGroup.release(time);
	~conditGroup.release(time);
	~fxGroup.release(time);
	~encoderGroup.release(time);
	~transformerGroup.release(time);
	~decoderGroup.release(time);
	"Terminando...".postln;
};

~resetBuffers = {~buffer.free; ~buffer = 4.collect({Buffer.alloc(s, s.sampleRate * 16, 1)})};

~resetBuffers = { ~buffer.do({|buf| buf.zero}) };