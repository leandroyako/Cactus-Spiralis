//////////////////// Open Stage Control ////////////////////

//////////////////// Flauta
OSCdef(\fl_inAmp, {|msg|
	~inFlSynth.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_fl/in_amp'
);

OSCdef(\fl_compThresh, {|msg|
	~flCondit.set(\thresh, msg[1]);
	msg[1].postln;
}, '/tab_fl/thresh'
);

OSCdef(\fl_compSlopeBelow, {|msg|
	~flCondit.set(\slopeBelow, msg[1]); // 0..<1
	msg[1].postln;
}, '/tab_fl/slope_below'
);

OSCdef(\fl_compSlopeAbove, {|msg|
	~flCondit.set(\slopeAbove, msg[1]); // 0..3
	msg[1].postln;
}, '/tab_fl/slope_above'
);

OSCdef(\fl_compClampTime, {|msg|
	~flCondit.set(\clampTime, msg[1]);
	msg[1].postln;
}, '/tab_fl/clamp_time'
);

OSCdef(\fl_compRelaxTime, {|msg|
	~flCondit.set(\relaxTime, msg[1]);
	msg[1].postln;
}, '/tab_fl/relax_time'
);

//FX - Pitch Shifter
OSCdef(\fl_windowSize, {|msg|
	~fxSynthFl.set(\windowSize, msg[1]);
	msg[1].postln;
}, '/tab_fl/windowSize'
);

OSCdef(\fl_pitchRatio, {|msg|
	~fxSynthFl.set.set(\pitchRatio, msg[1]);
	msg[1].postln;
}, '/tab_fl/pitchRatio'
);

OSCdef(\fl_pitchDispersion, {|msg|
	~fxSynthFl.set(\pitchDispersion, msg[1]);
	msg[1].postln;
}, '/tab_fl/pitchDispersion'
);

OSCdef(\fl_timeDispersion, {|msg|
	~fxSynthFl.set(\timeDispersion, msg[1]);
	msg[1].postln;
}, '/tab_fl/timeDispersion'
);

//FX - FreeVerb
OSCdef(\fl_mix, {|msg|
	~fxSynthFl.set(\mix, msg[1]);
	msg[1].postln;
}, '/tab_fl/mix'
);

OSCdef(\fl_room, {|msg|
	~fxSynthFl.set(\room, msg[1]);
	msg[1].postln;
}, '/tab_fl/room'
);

OSCdef(\fl_damp, {|msg|
	~fxSynthFl.set(\damp, msg[1]);
	msg[1].postln;
}, '/tab_fl/damp'
);

OSCdef(\fl_amp, {|msg|
	~fxSynthFl.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_fl/amp'
);


//////////////////// Guitarra
OSCdef(\gtr_inAmp, {|msg|
	~inGtrSynth.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_gtr/in_amp'
);

OSCdef(\gtr_compThresh, {|msg|
	~gtrCondit.set(\thresh, msg[1]);
	msg[1].postln;
}, '/tab_gtr/thresh'
);

OSCdef(\gtr_compSlopeBelow, {|msg|
	~gtrCondit.set(\slopeBelow, msg[1]); // 0..<1
	msg[1].postln;
}, '/tab_gtr/slope_below'
);

OSCdef(\gtr_compSlopeAbove, {|msg|
	~gtrCondit.set(\slopeAbove, msg[1]); // 0..3
	msg[1].postln;
}, '/tab_gtr/slope_above'
);

OSCdef(\gtr_compClampTime, {|msg|
	~gtrCondit.set(\clampTime, msg[1]);
	msg[1].postln;
}, '/tab_gtr/clamp_time'
);

OSCdef(\gtr_compRelaxTime, {|msg|
	~gtrCondit.set(\relaxTime, msg[1]);
	msg[1].postln;
}, '/tab_gtr/relax_time'
);

//FX - Pitch Shifter
OSCdef(\gtr_windowSize, {|msg|
	~fxSynthGtr.set(\windowSize, msg[1]);
	msg[1].postln;
}, '/tab_gtr/windowSize'
);

OSCdef(\gtr_pitchRatio, {|msg|
	~fxSynthGtr.set.set(\pitchRatio, msg[1]);
	msg[1].postln;
}, '/tab_gtr/pitchRatio'
);

OSCdef(\gtr_pitchDispersion, {|msg|
	~fxSynthGtr.set(\pitchDispersion, msg[1]);
	msg[1].postln;
}, '/tab_gtr/pitchDispersion'
);

OSCdef(\gtr_timeDispersion, {|msg|
	~fxSynthGtr.set(\timeDispersion, msg[1]);
	msg[1].postln;
}, '/tab_gtr/timeDispersion'
);

//FX - FreeVerb
OSCdef(\gtr_mix, {|msg|
	~fxSynthGtr.set(\mix, msg[1]);
	msg[1].postln;
}, '/tab_gtr/mix'
);

OSCdef(\gtr_room, {|msg|
	~fxSynthGtr.set(\room, msg[1]);
	msg[1].postln;
}, '/tab_gtr/room'
);

OSCdef(\gtr_damp, {|msg|
	~fxSynthGtr.set(\damp, msg[1]);
	msg[1].postln;
}, '/tab_gtr/damp'
);

OSCdef(\gtr_amp, {|msg|
	~fxSynthGtr.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_gtr/amp'
);


//////////////////// Viola
OSCdef(\vl_inAmp, {|msg|
	~inVlaSynth.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_vl/in_amp'
);

OSCdef(\vl_compThresh, {|msg|
	~vlaCondit.set(\thresh, msg[1]);
	msg[1].postln;
}, '/tab_vl/thresh'
);

OSCdef(\vl_compSlopeBelow, {|msg|
	~vlaCondit.set(\slopeBelow, msg[1]); // 0..<1
	msg[1].postln;
}, '/tab_vl/slope_below'
);

OSCdef(\vl_compSlopeAbove, {|msg|
	~vlaCondit.set(\slopeAbove, msg[1]); // 0..3
	msg[1].postln;
}, '/tab_vl/slope_above'
);

OSCdef(\vl_compClampTime, {|msg|
	~vlaCondit.set(\clampTime, msg[1]);
	msg[1].postln;
}, '/tab_vl/clamp_time'
);

OSCdef(\vl_compRelaxTime, {|msg|
	~vlaCondit.set(\relaxTime, msg[1]);
	msg[1].postln;
}, '/tab_vl/relax_time'
);

//FX - Pitch Shifter
OSCdef(\vl_windowSize, {|msg|
	~fxSynthVla.set(\windowSize, msg[1]);
	msg[1].postln;
}, '/tab_vl/windowSize'
);

OSCdef(\vl_pitchRatio, {|msg|
	~fxSynthVla.set.set(\pitchRatio, msg[1]);
	msg[1].postln;
}, '/tab_vl/pitchRatio'
);

OSCdef(\vl_pitchDispersion, {|msg|
	~fxSynthVla.set(\pitchDispersion, msg[1]);
	msg[1].postln;
}, '/tab_vl/pitchDispersion'
);

OSCdef(\vl_timeDispersion, {|msg|
	~fxSynthVla.set(\timeDispersion, msg[1]);
	msg[1].postln;
}, '/tab_vl/timeDispersion'
);

//FX - FreeVerb
OSCdef(\vl_mix, {|msg|
	~fxSynthVla.set(\mix, msg[1]);
	msg[1].postln;
}, '/tab_vl/mix'
);

OSCdef(\vl_room, {|msg|
	~fxSynthVla.set(\room, msg[1]);
	msg[1].postln;
}, '/tab_vl/room'
);

OSCdef(\vl_damp, {|msg|
	~fxSynthVla.set(\damp, msg[1]);
	msg[1].postln;
}, '/tab_vl/damp'
);

OSCdef(\vl_amp, {|msg|
	~fxSynthVla.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_vl/amp'
);


//////////////////// Contrabajo
OSCdef(\cb_inAmp, {|msg|
	~inCbSynth.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_cb/in_amp'
);

OSCdef(\cb_compThresh, {|msg|
	~cbCondit.set(\thresh, msg[1]);
	msg[1].postln;
}, '/tab_cb/thresh'
);

OSCdef(\cb_compSlopeBelow, {|msg|
	~cbCondit.set(\slopeBelow, msg[1]); // 0..<1
	msg[1].postln;
}, '/tab_cb/slope_below'
);

OSCdef(\cb_compSlopeAbove, {|msg|
	~cbCondit.set(\slopeAbove, msg[1]); // 0..3
	msg[1].postln;
}, '/tab_cb/slope_above'
);

OSCdef(\cb_compClampTime, {|msg|
	~cbCondit.set(\clampTime, msg[1]);
	msg[1].postln;
}, '/tab_cb/clamp_time'
);

OSCdef(\cb_compRelaxTime, {|msg|
	~cbCondit.set(\relaxTime, msg[1]);
	msg[1].postln;
}, '/tab_cb/relax_time'
);

//FX - Pitch Shifter
OSCdef(\cb_windowSize, {|msg|
	~fxSynthCb.set(\windowSize, msg[1]);
	msg[1].postln;
}, '/tab_cb/windowSize'
);

OSCdef(\cb_pitchRatio, {|msg|
	~fxSynthCb.set.set(\pitchRatio, msg[1]);
	msg[1].postln;
}, '/tab_cb/pitchRatio'
);

OSCdef(\cb_pitchDispersion, {|msg|
	~fxSynthCb.set(\pitchDispersion, msg[1]);
	msg[1].postln;
}, '/tab_cb/pitchDispersion'
);

OSCdef(\cb_timeDispersion, {|msg|
	~fxSynthCb.set(\timeDispersion, msg[1]);
	msg[1].postln;
}, '/tab_cb/timeDispersion'
);

//FX - FreeVerb
OSCdef(\cb_mix, {|msg|
	~fxSynthCb.set(\mix, msg[1]);
	msg[1].postln;
}, '/tab_cb/mix'
);

OSCdef(\cb_room, {|msg|
	~fxSynthCb.set(\room, msg[1]);
	msg[1].postln;
}, '/tab_cb/room'
);

OSCdef(\cb_damp, {|msg|
	~fxSynthCb.set(\damp, msg[1]);
	msg[1].postln;
}, '/tab_cb/damp'
);

OSCdef(\cb_amp, {|msg|
	~fxSynthCb.set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_cb/amp'
);


//////////////////// Buffers

//FX - Pitch Shifter
OSCdef(\buf_windowSize, {|msg|
	~fxSynthBuf.do({|synth| synth.set(\windowSize, msg[1])});
	msg[1].postln;
}, '/tab_buf/windowSize'
);

OSCdef(\buf_pitchRatio, {|msg|
	~fxSynthBuf.do({|synth| synth.set.set(\pitchRatio, msg[1])});
	msg[1].postln;
}, '/tab_buf/pitchRatio'
);

OSCdef(\buf_pitchDispersion, {|msg|
	~fxSynthBuf.do({|synth| synth.set(\pitchDispersion, msg[1])});
	msg[1].postln;
}, '/tab_buf/pitchDispersion'
);

OSCdef(\buf_timeDispersion, {|msg|
	~fxSynthBuf.do({|synth| synth.set(\timeDispersion, msg[1])});
	msg[1].postln;
}, '/tab_buf/timeDispersion'
);

//FX - FreeVerb
OSCdef(\buf_mix, {|msg|
	~fxSynthBuf.do({|synth| synth.set(\mix, msg[1])});
	msg[1].postln;
}, '/tab_buf/mix'
);

OSCdef(\buf_room, {|msg|
	~fxSynthBuf.do({|synth| synth.set(\room, msg[1])});
	msg[1].postln;
}, '/tab_buf/room'
);

OSCdef(\buf_damp, {|msg|
	~fxSynthBuf.do({|synth| synth.set(\damp, msg[1])});
	msg[1].postln;
}, '/tab_buf/damp'
);

OSCdef(\buf_amp, {|msg|
	~fxSynthBuf.do({|synth| synth.set(\amp, msg[1])});
	msg[1].postln;
}, '/tab_buf/amp'
);

//Control
OSCdef(\playBuffer, {|msg|
	if(msg[1]>0,
		{
			~play = ~buffer.collect({|buf, index|
		Synth.new(\playbackBuf, [\outBus, ~bufBus[index], \bufnum, buf.bufnum],
			~fxGroup,
			\addToHead)
	})
		},
		{
			~play.do({|i|i.release})
	})
}, '/playbuf'
);

OSCdef(\recBuffer, {|msg|
	if(msg[1]>0,
		{
			~rec.do({|i|i.set(\run, 1)})
		},
		{
			~rec.do({|i|i.set(\run, 0)})
	})
}, '/recbuf'
);

OSCdef(\resetBuffer, {|msg|
	~resetBuffers.value;
}, '/resetbuf'
);

//Mix
OSCdef(\buf_amp_fl, {|msg|
	~play[0].set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_buf/flAmp'
);

OSCdef(\buf_amp_gtr, {|msg|
	~play[1].set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_buf/gtrAmp'
);

OSCdef(\buf_amp_vla, {|msg|
	~play[2].set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_buf/vlaAmp'
);

OSCdef(\buf_amp_cb, {|msg|
	~play[3].set(\amp, msg[1]);
	msg[1].postln;
}, '/tab_buf/cbAmp'
);

//////////////////// General

OSCdef(\scenesManager, {|msg|
	m.sendMsg("/scene"++msg[1], 1);
}, '/scene'
);

OSCdef(\grabarObra, {|msg|
	if(msg[1]>0, {s.record}, {s.stopRecording});
}, '/grabar_obra'
);

OSCdef(\finish, {|msg|
//	msg.postln;
	if (msg[1]>0, {~releaseGrp.value(10)});
}, '/releaseAll'
);