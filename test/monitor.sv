class monitor;
  
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    	this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task main();
        
      repeat(5)
        #3;
      	begin
          	transaction trans;
          	trans=new();
            trans.count = vif.count;
            trans.gray_code = vif.gray_code;
            $display("\n=========== Testing @ %0t ======", $time);
            mon2scb.put(trans);
          	trans.display("Monitor");
            
        end
    endtask
endclass