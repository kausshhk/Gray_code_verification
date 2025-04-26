class scoreboard;
    // Mailbox to receive transactions from the monitor
    mailbox mon2scb;

    // Constructor to connect the mailbox
    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    // Main task to process transactions
    task main;
        transaction trans; // Transaction object

      repeat(5)
        begin
            // Get a transaction from the monitor
            mon2scb.get(trans);

            // Check if the Gray Code is correctly derived from the binary value
          if (trans.gray_code == (trans.count ^ (trans.count >> 1))) 			begin
                $display("Result is as Expected");
            end else begin
              $error("Wrong Result: Binary = %b, Gray Code = %b", trans.count, trans.gray_code);
            end

            // Display the transaction details
            trans.display("Scoreboard");
        end
    endtask
endclass
