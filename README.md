# ECE520L_Blinking_LED
Lab 1 : Blinking RGB LED's on the Zybo Z7-10 Board. 

Overview: Blink the LED of the Zybo Z7-10 with a given set of IO ports and parameters in order to blink the LED's every 500 ms and be able to change the color using the onboard switches and use combinational logic to allow for a certain color or turn off the LED. The Zybo Z7-10 file was also implemented by copying the code from a GitHub Repo and uncommenting certain lines of code and then changing the names of the ports in order to meet the given parameters.

Design Summary: For the Blinking_LED portion, logic to blink the LED was implemented given a set of IO ports at a set clock frequency in order to blink the LED at a certain speed. The blinking led was implemented using a counter which has logic that checks to see if the counter has reached its maximum or if the reset is high which results in the counter being reset.

For the RGB led, the top file of the blinking LED was instantiated in order to provide the framework for the RGB LED top file. Then logic was written for the RGB LED where switches are used to determine the status of the LEDs, each switch corresponds to a different colored LED. However, only 1 switch can be high for an LED otherwise it is considered an invalid case. 

Verification and Results: The blinking LED and the RGB LED projects both performed as expected which was demonstrated to the instructor. For verification, a testbench was written for both projects and a waveform was generated and inspected in order to verify design specifications. For example, if the device is undergoing reset, then no actions should be occuring, or if more than 1 switch was set to high, then no other LED's should be lit up. 

Known Issues: There are no issues and each section and operation is worked as expected.

References:[ ](https://vhdlwhiz.com/basic-vhdl-tutorials/)
