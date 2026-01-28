# clk generation of 400Khz using input clk 25Mhz 
                        ___
- 25Mhz period = 40ns  |.|.|  400Khz period = 2.5micro-s
                       |---|  
                       ^^^^^  
- 25Mhz/400Khz = 62.5 is the counter mod value 
- the output has to toggle at 31.25 to get 50% duty cycle
- its impossible to get 50% duty cycle for 400Khz frequency because of its decimal mod counter value i.e 62.5
- we cycle between the hald period of 31 and 32 alternatively to minimize the jitter still we have the ~1 cycle error
- this small error is acceptable for some low data rate protocols.
