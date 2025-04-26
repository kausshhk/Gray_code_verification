`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor"
`include "scoreboard"

class environment;
  generator 	gen;
  driver    	driv;
  monitor   	mon;
  scoreboard	scb;
  mailbox gen2drv, mon2scb;

  virtual intf vif;
  function new(virtual intf vif);
    //this.vif = vif;
    gen2drv   = new();
    mon2scb = new();
    gen  = new(gen2drv);
    driv = new(vif,gen2drv);
    mon  = new(vif,mon2scb);
    scb  = new(mon2scb);
  endfunction
  
  task test();
    fork 
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join
  endtask

  
  task run;
    test();
    $finish;
  endtask
  
endclass