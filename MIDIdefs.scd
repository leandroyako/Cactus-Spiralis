
//////////////////// MIDI////////////////////

~switchState = 0;
MIDIClient.init;
MIDIIn.connectAll;
//MIDIIn.connect(inport: 0, device: MIDIIn.findPort("Midi Through", "Midi Through Port-0"));

MIDIdef.cc(\changePatch, {arg ...args;
	("Midi In: " ++ args).postln;
	switch (~switchState,
		0, {~switchState = ~switchState + 1; n.sendMsg("/scene", 0)},
		1, {~switchState = ~switchState + 1; n.sendMsg("/scene", 1)},
		2, {~switchState = ~switchState + 1; n.sendMsg("/scene", 2)},
		3, {~switchState = ~switchState + 1; n.sendMsg("/scene", 3)},
		4, {~switchState = ~switchState + 1; n.sendMsg("/scene", 4)},
		5, {~switchState = 0; n.sendMsg("/scene", 5)},
	);
}
);

//MIDIdef.freeAll
//MIDIIn.doControlAction(1000.rand, 16, 16, 1); // spoof a cc