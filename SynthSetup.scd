//////////////////// monoIn ////////////////////

~inFlSynth = Synth.new(\monoAudioIn, [\inBus,~inFlNum, \outBus, ~inFl, \amp, 1], ~inGroup);
n.sendMsg('/tab_fl/in_amp', 1);

~inGtrSynth = Synth.new(\monoAudioIn, [\inBus,~inGtrNum, \outBus, ~inGtr, \amp, 1], ~inGroup);
n.sendMsg('/tab_gtr/in_amp', 1);

~inVlaSynth = Synth.new(\monoAudioIn, [\inBus,~inVlaNum, \outBus, ~inVla, \amp, 1], ~inGroup);
n.sendMsg('/tab_vla/in_amp', 1);

~inCbSynth = Synth.new(\monoAudioIn, [\inBus,~inCbNum, \outBus, ~inCb, \amp, 1], ~inGroup);
n.sendMsg('/tab_cb/in_amp', 1);

//////////////////// Signal Conditioning ////////////////////

~setupFl = [\inBus, ~inFl, \cutoff, "d 6".notemidi.midicps, \thresh, 0.5, \slopeBelow, 1, \slopeAbove, 1, \clampTime, 0.01, \relaxTime, 0.01];
~flCondit = Synth.new(\signalConditioning, ~setupFl, ~conditGroup);
~setupFl.pairsDo({ arg a, b;
	n.sendMsg('/tab_fl/'++a, b);
});

~setupGtr = [\inBus, ~inGtr, \cutoff, "e 4".notemidi.midicps, \thresh, 0.5, \slopeBelow, 1, \slopeAbove, 1, \clampTime, 0.01, \relaxTime, 0.01];
~gtrCondit = Synth.new(\signalConditioning, ~setupGtr, ~conditGroup);
~setupGtr.pairsDo({ arg a, b;
	n.sendMsg('/tab_gtr/'++a, b);
});

~setupVla = [\inBus, ~inVla, \cutoff, "c 4".notemidi.midicps, \thresh, 0.5, \slopeBelow, 1, \slopeAbove, 1, \clampTime, 0.01, \relaxTime, 0.01];
~vlaCondit = Synth.new(\signalConditioning, ~setupVla, ~conditGroup);
~setupVla.pairsDo({ arg a, b;
	n.sendMsg('/tab_vla/'++a, b);
});

~setupCb = [\inBus, ~inCb, \cutoff, "e 2".notemidi.midicps, \thresh, 0.5, \slopeBelow, 1, \slopeAbove, 1, \clampTime, 0.01, \relaxTime, 0.01];
~cbCondit = Synth.new(\signalConditioning, ~setupCb, ~conditGroup);
~setupCb.pairsDo({ arg a, b;
	n.sendMsg('/tab_cb/'++a, b);
});

//////////////////// Buffer ////////////////////

~rec = [~inFl, ~inGtr, ~inVla, ~inCb].collect({arg synth, index;
	Synth(\recordBuf, [\inBus, synth, \bufnum, ~buffer[index].bufnum],~conditGroup, \addToTail);
});

//monoFx
~fxSynthBuf = ~bufBus.collect({|i| Synth.new(\monoFx, [\inBus, i, \outBus, ~encoderBus], ~fxGroup, \addToTail)});
~fxSynthFl = Synth.new(\monoFx, [\inBus, ~inFl, \outBus, ~encoderBus], ~fxGroup, \addToTail);
~fxSynthGtr = Synth.new(\monoFx, [\inBus, ~inGtr, \outBus, ~encoderBus], ~fxGroup, \addToTail);
~fxSynthVla = Synth.new(\monoFx, [\inBus, ~inVla, \outBus, ~encoderBus], ~fxGroup, \addToTail);
~fxSynthCb = Synth.new(\monoFx, [\inBus, ~inCb, \outBus, ~encoderBus], ~fxGroup, \addToTail);

//////////////////// Ambisonics ////////////////////

~encoderSynth = Synth.new(\foaEncode, [\inBus, ~encoderBus, \outBus, ~transformerBus], ~encoderGroup);
~transformerSynth = Synth.new(\foaTransform, [\inBus, ~transformerBus, \outBus, ~decoderBus], ~transformerGroup);
~decoderSynth = Synth.new(\foaDecode, [\inBus, ~decoderBus], ~decoderGroup);

//~transformerSynth.set(\azimFreq, 0.125, \angle, pi/2, \phi, 0);