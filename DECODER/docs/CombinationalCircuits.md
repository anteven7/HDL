# System Verilog First Approaches #

Firstly, to innitialize anyone to Hardware Description Languages, i will write a little explanation about what a HDL is:

Briefly, a programming language like System Verilog explains how an electronic circuit behave. It has its own sintax(as every programming language) and its own rules and procedures, which we are close to discuss.

Let´s start.

```
//decoder(active low outputs) module

module decoder (
  input [3:0] a,
  output reg [15:0] z
);
  
  always @(a)
    begin 
      z=16’hffff;
      z[a]=0;
    end
  
endmodule 
          

```

This may be a little **confusing** at first if you have never coded or if you are not familiar with computer science. Dont worry, we are going to take it easy.

Verilog has its onw reserved words(as every coding language out there), so the word **module** is one of them. It describes a component that behaves in a certain way (decoders, full adders, counters... even an and gate, if you want). If we want to code a full adder that add two bits plus the carry, we could easily build an adder of **n** bits(we just need to plug each single full adder n times to add two words of n bits). This will be clear as we go with the explanation.

```
module decoder (
  input [3:0] a,
  output reg [15:0] z
);
```

As you can appreciate, here we declare the module basically. **Decoder** is how i want to name my module, it could have been imSuperCool55 and woudl be the same, but i like to be as clear as possible with what im working on. I highly recommend you to do the same thing.

To complete our module declaration we need also to describe inputs and outputs. As my decoder has a 4 bit word input, i declare it as **input [3:0] a**, being [3:0] the number of bits and a the name of the word of 4 bits. We coudl refference each bit as a[0], a[1] and so on. Another important acclaration is that we could **input** several words only writing input one time only if the words are the same size. If my module had a chip selection or **cs** bit i would have to declare it as:

```
module decoder (
  input [3:0] a,
  input cs,
  output reg [15:0] z
);
```

With the output is the same thing as i explained but slightly different. Im talking about the **reg** declaration. There are two types of variables in Verilog: **wire** and **reg**.

This is a bit further in theory, but summarizing a reg variable is capable to change its value as it has "memory". We are usually using a **reg** type if we are going to change the value of the output with an **always** loop, so when the always loop executes, the variable that changes inside the always(in this case **z**) can change its value with no problem. **Wire** variables are often used for internal wires that connects two modules with no tangible value, for example.

So, as we are interested in the value of z and it is part of the always loop(we are going to talk about this in a moment), we want to put it as a reg type.

Let´s go with the interesting part:

```
always @(a)
    begin 
      z=16’hffff;
      z[a]=0;
    end
```

This is is an **always** loop. There are several ways to describe the behavior of a circuit but we are not going to dig into this, but the always sentence is the base of the **procedimental** structure. As the name says, we are going to describe a circuit with its procedure.

The variables that goes into the brackets are usually the inputs (the one that change its values). What is inside the brackets is called sensibility list. As you can guess, sensibility list takes its name due to the always procedure, which is sensible to any change of values in that list. If a is *0000* and then takes the value *0001*, the programe goes automatically inside the always loop to execute it again. That occurs with any change in the variables inside the sensibility list. We could describe also the always sentence with 

```
always @*
```

Doing this, we take in considerationt all the inputs.

We use the **begin** sentence inside the always procedure in order to put multiples lines. We wouldn´t need it if the code was 

```
always @(a)
      z[a]=0;
```

