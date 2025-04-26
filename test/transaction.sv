class transaction;
    // Stimulus: Gray code and binary values
  rand bit [3:0] reset_duration;
  	bit en=1,rst_n;
  bit [2:0] gray_code; // Gray code value (4-bit)
  bit [2:0] count;
    

    // Function to display the values of the Gray code and its binary equivalent
    function void display(string name);
        $display("-------------------------------");
        $display("Transaction Name: %s", name);
        $display("-------------------------------");
        $display("Gray Code  = %b", gray_code);
        $display("-------------------------------");
      $display("Binary Value  & duration   : %b %0d",count,reset_duration);
    endfunction
endclass
