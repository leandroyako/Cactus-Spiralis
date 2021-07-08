//////////////////// SynthDefs ////////////////////

SynthDef.new(\monoAudioIn, {
	arg inBus = 0, amp = 1, outBus, gate = 1;
	var sig = SoundIn.ar(bus: inBus, mul: amp);
	var env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction:2);
	sig = Mix.ar(sig);
	Out.ar(outBus, sig * env);
}).add;

SynthDef.new(\signalConditioning, {
	arg inBus, gate= 1,
	cutoff, gatethresh = 0.001,
	thresh = 0.5, slopeBelow = 1, slopeAbove = 1, clampTime = 0.01, relaxTime = 0.01;
	var sig = In.ar(inBus);
	var env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction:2);
/*	sig = CompanderD.ar(sig,
        thresh: gatethresh,
        slopeBelow: 10,
        slopeAbove:  1,
        clampTime:   0.01,
        relaxTime:   0.01
    );
	*/
	sig = HPF.ar(HPF.ar(HPF.ar(sig, cutoff), cutoff), cutoff);
	sig = CompanderD.ar(sig, thresh, slopeBelow, slopeAbove, clampTime, relaxTime);
	ReplaceOut.ar(inBus, sig * env);
}).add;

SynthDef.new(\monoFx, {
	arg inBus, outBus, amp = 1, gate = 1,
	windowSize = 0.2, pitchRatio = 1, pitchDispersion = 0, timeDispersion = 0.00025,
	mix = 0.33, room = 0.5, damp = 0.5;
	var sig = In.ar(inBus);
	var env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction:2);
	sig = PitchShift.ar(sig, windowSize, pitchRatio, pitchDispersion, timeDispersion);
//	sig = GrainIn.ar(1,Impulse.kr(32),2,sig);
	sig = FreeVerb.ar(sig, mix, room, damp);
	Out.ar(outBus, sig * env * amp);
}).add;

//////////////////// Buffer
SynthDef(\recordBuf, {
	arg inBus, bufnum = 0, recLevel = 0.7, preLevel = 1, run = 0, gate = 1;
	var env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction:2);
	RecordBuf.ar(In.ar(inBus * env), bufnum, 0, recLevel, preLevel, run, doneAction: 0, loop: 1);
}).add;

SynthDef(\playbackBuf, {
	arg outBus = 0, bufnum = 0, gate = 1, amp = 1, attack = 4, release = 4;
	var sig, env;
	env = EnvGen.kr(Env.asr(attack, 1, release), gate, doneAction:2);
	sig = PlayBuf.ar(1, bufnum, loop: 1);
	sig = sig * env * amp;
	Out.ar(outBus, sig);
}).add;

//////////////////// Ambisonics
~decoder = FoaDecoderKernel.newUHJ;


SynthDef.new(\foaEncode, {
	arg inBus, outBus, gate = 1;
	var src, env, foa, encoder, angle, azim;
	env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction:2);
	encoder = FoaEncoderMatrix.newOmni;
	src = In.ar(inBus, 1);
	// Encode into our foa signal
	foa = FoaEncode.ar(src, encoder);
	// send out
	Out.ar(outBus, foa * env);
}).add;

SynthDef.new(\foaTransform, { arg inBus, outBus, gate = 1, angle = pi/2, phi = 0, azimFreq = 0.125, select = 0, lagSel = 4;
	var src, foa, ang, azimuth, elevation, movement, env;
	env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction:2);
	src = In.ar(inBus, 1);
	// angle ---> top         = push to plane wave
	//          bottom    = omni-directional
	//pi/2 - 0
	ang = Lag.kr(angle, 0.2);
	movement = [
		LFSaw.kr(Lag.kr(azimFreq, 0.1), 0, pi); //pi, -pi
		LFNoise1.kr(azimFreq * 10).linlin(-1, 1, -pi, pi); //pi, -pi
	];
	azimuth = SelectX.kr(Lag.kr(select, lagSel), movement);
	elevation = Lag.kr(phi, 0.2);
	foa = FoaTransform.ar(src, 'push', angle, azimuth, elevation);
	// send out
	Out.ar(outBus, foa);
}).add;

s.sync;

SynthDef.new(\foaDecode, {arg inBus, gate = 1;
	var foa, out, decoder, env;
	env = EnvGen.kr(Env.asr(1, 1, 2), gate, doneAction:2);
	foa = In.ar(inBus, 4);
	out = FoaDecode.ar(foa, ~decoder);
	Out.ar(0, out * env);
}).add;