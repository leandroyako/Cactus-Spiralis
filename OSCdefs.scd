//////////////////// OSC defs ////////////////////

OSCdef(\scene0, {|msg|
	~rec.do({|i|i.set(\run, 1)});
	n.sendMsg('/recbuf', 1);

	~play.do({|i|i.release});
	n.sendMsg('/playbuf', 0);

	~transformerSynth.set(\azimFreq, 0.125, \angle, pi/2, \phi, 0);

	[~fxSynthBuf,~fxSynthFl,~fxSynthGtr,~fxSynthVla,~fxSynthCb].flat.do({|synth, i|
		[\windowSize, 0.1, \pitchRatio, 1, \pitchDispersion, 0, \timeDispersion, 0, \mix, 0.33, \room, 0.1, \damp, 0.5, \amp, 10].pairsDo({ arg a, b;
			var oscpath = ['/tab_buf', '/tab_buf', '/tab_buf', '/tab_buf', '/tab_fl', '/tab_gtr', '/tab_vla', '/tab_cb'];
			synth.set(a,b);
			n.sendMsg(oscpath[i]++'/'++a, b);
		})
	});

	[\windowSize, 1, \timeDispersion, 1, \mix, 0.1].pairsDo({ arg a, b;
		~fxSynthVla.set(a,b);
		n.sendMsg('/tab_vla/'++a, b);
	});

	[\windowSize, 1, \timeDispersion, 1, \mix, 0.1].pairsDo({ arg a, b;
		~fxSynthCb.set(a,b);
		n.sendMsg('/tab_cb/'++a, b);
	});


}, '/scene0'
);

OSCdef(\scene1, {|msg|
	~rec.do({|i|i.set(\run, 0)});
	n.sendMsg('/recbuf', 0);

	~play.do({|i|i.release});
	n.sendMsg('/playbuf', 0);

	~transformerSynth.set(\azimFreq, 0.125, \angle, pi/2, \phi, 0, \select, 1, \selTime, 12);

	[~fxSynthBuf,~fxSynthFl,~fxSynthGtr,~fxSynthVla,~fxSynthCb].flat.do({|synth, i|
		[\windowSize, 0.1, \pitchRatio, 1, \pitchDispersion, 0, \timeDispersion, 0.01, \mix, 0.33, \room, 0.01, \damp, 0.5, \amp, 10].pairsDo({ arg a, b;
			var oscpath = ['/tab_buf', '/tab_buf', '/tab_buf', '/tab_buf', '/tab_fl', '/tab_gtr', '/tab_vla', '/tab_cb'];
			synth.set(a,b);
			n.sendMsg(oscpath[i]++'/'++a, b);
		})
	});

}, '/scene1'
);

OSCdef(\scene2, {|msg|

	~rec.do({|i|i.set(\run, 0)});
	n.sendMsg('/recbuf', 0);

	~play.do({|i|i.release});
	n.sendMsg('/playbuf', 0);

	~transformerSynth.set(\azimFreq, 2, \angle, pi/2, \phi, 0);

//	~fxSynthFl.set(\outBus, 0!~decoder.numOutputs);

	[\pitchRatio, 1, \windowSize, 0.1, \timeDispersion, 0.001, \mix, 0.005, \room, 0.1, \damp, 0.1, \amp, 3].pairsDo({ arg a, b;
		~fxSynthFl.set(a,b);
		n.sendMsg('/tab_fl/'++a, b);
	});

	[\pitchDispersion, 0.01, \windowSize, 0.1, \timeDispersion, 0.001, \mix, 0.5, \room, 1, \damp, 0.1, \amp, 18].pairsDo({ arg a, b;
		~fxSynthGtr.set(a,b);
		n.sendMsg('/tab_gtr/'++a, b);
	});

	[\pitchDispersion, 0.01, \windowSize, 0.1, \timeDispersion, 0.001, \mix, 0.5, \room, 1, \damp, 0.1, \amp, 18].pairsDo({ arg a, b;
		~fxSynthVla.set(a,b);
		n.sendMsg('/tab_vla/'++a, b);
	});

	[\pitchDispersion, 0, \windowSize, 0.1, \timeDispersion, 0.001, \mix, 0.5, \room, 1, \damp, 0.1, \amp, 18].pairsDo({ arg a, b;
		~fxSynthCb.set(a,b);
		n.sendMsg('/tab_cb/'++a, b);
	});



}, '/scene2'
);

OSCdef(\scene3, {|msg|

	~rec.do({|i|i.set(\run, 0)});
	n.sendMsg('/recbuf', 0);

//	~fxSynthFl.set(\outBus, ~encoderBus);

	~transformerSynth.set(\azimFreq, 0.125, \angle, pi/2, \phi, 0, \select, 0, \selTime, 2);

	Pbindef(\azimPatttern,
		\type, \set,
		\id, ~transformerSynth,
		\args, #[\azimFreq],
		\azimFreq, Pseg( Pseq([0.125, 2],inf), 2, Pseq([\linear, \step], inf)),
		\dur, 0.05,
	).play;

	~play = ~buffer.collect({|buf, index|
		Synth.new(\playbackBuf, [\outBus, ~bufBus[index], \bufnum, buf.bufnum, \attack, 6, \amp, 0.4],
			~fxGroup,
			\addToHead)
	});

	[\pitchRatio, 1, \pitchDispersion, 0.1, \windowSize, 0.1, \timeDispersion, 0.001, \mix, 0.33, \room, 0.5, \damp, 0.1, \amp, 0.4].pairsDo({ arg a, b;
		~fxSynthBuf.do({|synth| synth.set(a,b) });
		n.sendMsg('/tab_buf/'++a, b);
	});

	n.sendMsg('/playbuf', 1);

	[~fxSynthBuf,~fxSynthFl,~fxSynthGtr,~fxSynthVla,~fxSynthCb].flat.do({|synth, i|
		[\windowSize, 0.1, \pitchRatio, 0.95, \pitchDispersion, 0.05, \timeDispersion, 0.01, \mix, 0.01, \room, 0.3, \damp, 0.5, \amp, 10].pairsDo({ arg a, b;
			var oscpath = ['/tab_buf', '/tab_buf', '/tab_buf', '/tab_buf', '/tab_fl', '/tab_gtr', '/tab_vla', '/tab_cb'];
			synth.set(a,b);
			n.sendMsg(oscpath[i]++'/'++a, b);
		})
	});

}, '/scene3'
);

OSCdef(\scene4, {|msg|

	~rec.do({|i|i.set(\run, 0)});
	n.sendMsg('/recbuf', 0);

	Pbindef(\pitchPatttern,
		\type, \set,
		\id, [~fxSynthBuf,~fxSynthFl,~fxSynthGtr,~fxSynthVla,~fxSynthCb].flat,
		\args, #[\pitchRatio],
		\pitchRatio, Pseg( Pseq([1.0, 0.65],inf), Pseq([Pwhite(1,3),Pwhite(0.1,0.5)], inf), Pseq([\linear, \step], inf)),
		\dur, 0.05,
		\sendOsc, Pfunc({|ev|
			var oscpath = ['/tab_buf', '/tab_buf', '/tab_buf', '/tab_buf', '/tab_fl', '/tab_gtr', '/tab_vla', '/tab_cb'];
			oscpath.do({|path| n.sendMsg(path++'/pitchRatio', ev.pitchRatio) });
		})
	).play;

	Pbindef(\ampPatttern,
		\type, \set,
		\id, ~fxSynthBuf,
		\args, #[\amp],
		\amp, Pseg( Pseq([4, 18],1), Pseq([4, 1],1), \exp, 1),
		\dur, 0.05,
		\sendOsc, Pfunc({|ev|
			n.sendMsg('/tab_buf/amp', ev.amp) });
	).play;

	[~fxSynthBuf,~fxSynthFl,~fxSynthGtr,~fxSynthVla,~fxSynthCb].flat.do({|synth, i|
		[\windowSize, 0.1, \pitchDispersion, 0.05, \timeDispersion, 0.02, \mix, 0.1, \room, 0.3, \damp, 0.5, \amp, 10].pairsDo({ arg a, b;
			var oscpath = ['/tab_buf', '/tab_buf', '/tab_buf', '/tab_buf', '/tab_fl', '/tab_gtr', '/tab_vla', '/tab_cb'];
			synth.set(a,b);
			n.sendMsg(oscpath[i]++'/'++a, b);
		})
	});

}, '/scene4'
);

OSCdef(\scene5, {|msg|

	~rec.do({|i|i.set(\run, 0)});
	n.sendMsg('/recbuf', 0);

	Pbindef(\azimPatttern).stop;
	Pbindef(\pitchPatttern).stop;

	~transformerSynth.set(\azimFreq, 0.125, \angle, pi/2, \phi, 0, \select, 0, \selTime, 2);

	~play.do({|i|i.release});
	n.sendMsg('/playbuf', 0);

	[~fxSynthBuf,~fxSynthFl,~fxSynthGtr,~fxSynthVla,~fxSynthCb].flat.do({|synth, i|
		[\windowSize, 0.1, \pitchRatio, 1, \pitchDispersion, 0, \timeDispersion, 0.01, \mix, 0.33, \room, 0.01, \damp, 0.5, \amp, 10].pairsDo({ arg a, b;
			var oscpath = ['/tab_buf', '/tab_buf', '/tab_buf', '/tab_buf', '/tab_fl', '/tab_gtr', '/tab_vla', '/tab_cb'];
			synth.set(a,b);
			n.sendMsg(oscpath[i]++'/'++a, b);
		})
	});

}, '/scene5'
);

//OSCFunc.trace(false, true)