//////////////////// Groups ////////////////////

~inGroup = Group.new(addAction: \addToHead);
~conditGroup = Group.after(~inGroup);
~fxGroup = Group.after(~conditGroup);

~encoderGroup = Group.after(~fxGroup);
~transformerGroup = Group.after(~encoderGroup);
~decoderGroup = Group.after(~transformerGroup);

//////////////////// Buses ////////////////////

~inFl = Bus.audio(s,1);
~inGtr = Bus.audio(s,1);
~inVla = Bus.audio(s,1);
~inCb = Bus.audio(s,1);

~fxBus = Bus.audio(s,1);
~encoderBus = Bus.audio(s,1);
~transformerBus = Bus.audio(s, 4);
~decoderBus = Bus.audio(s, 4);

//////////////////// Buffers ////////////////////

~bufBus = 4.collect({Bus.audio(s,1)});
~buffer = 4.collect({Buffer.alloc(s, s.sampleRate * 16, 1)});


