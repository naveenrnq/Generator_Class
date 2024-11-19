class generator;
  randc bit [3:0] a,b;  // rand or randc
  bit [3:0] y;

  
endclass

module tb;
 generator g;
 int i = 0;
 int status = 0; 
 
 initial begin
   
   for(i = 0; i < 10; i++) begin
     g = new(); // create new constructor everytime because it coule be possible that old object didnt finished
     status = g.randomize(); 
     
     if(!g.randomize()) begin
       $display("Randomization Failed at %0t", $time);
       $finish(); 
     end
     
    
     $display("Value of a: %0d and b: %0d with status: %0d", g.a,g.b,status);
     #10; 
   end
 end

endmodule
