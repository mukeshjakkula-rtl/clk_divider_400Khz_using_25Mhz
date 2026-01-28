# clock generation of 400Khz using input clock 25Mhz 
- 25Mhz period = 40ns | 400Khz period = 2.5micro-s.
- 25Mhz/400Khz = 62.5 is the counter mod value.
- the output has to toggle at 31.25 to get 50% duty cycle.
- its impossible to get 50% duty cycle for 400Khz frequency because of its decimal mod counter value i.e 62.5 because the toggle has to happen at 31.25 count.
- we cycle between the half period of 31 and 32 alternatively to minimize the jitter, but still we have the ~1 cycle error.
- the achived clock frequency is ~383.1Khz.
- this small error is acceptable for some low data rate protocols.
