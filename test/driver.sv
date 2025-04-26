class driver;
    virtual intf vif;
	transaction trans;
    mailbox gen2drv;

  function new(virtual intf vif,mailbox gen2drv);
      	this.vif = vif;
        this.gen2drv = gen2drv;
      endfunction

    task main();
        gen2drv.get(trans);

      fork
        repeat(5) begin
            

        vif.en     <= trans.en;
        vif.gray_code     = trans.gray_code;
        vif.count     = trans.count;
      
          trans.display("Driver");          
      	end
        reset_dut(trans.reset_duration);
      join
    endtask

    // Reset the DUT
    task reset_dut(int duration);
      	vif.rst_n = 1;
      	#(duration);
      	vif.rst_n=0;
      	#1;
	    vif.rst_n=1;  	
        
    endtask
  
endclass
