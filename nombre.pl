#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
   print "<h1>Seleccione uno de estos nombres</h1>
          <form name=\"search\" method=\"get\" >";
   open F, "/tmp/tp2/prueba";
   while(<F>) {
     chomp;
     @campos=split(":");
     $ar{$campos[1]}=$campos[1];
   }
   print "<select name = \"shell\">";
   for (keys %ar){
     print "<option value=$_";
     print ">$_</option>";
   }
   print "</select>
         <input type=\"submit\" value=\"Enviar\" />";
}else { 
   @arGet=split("=",$ENV{'QUERY_STRING'});
   $arGet[1]=~ s/%2F/\//g;
   print "Has seleccionado el nombre: $arGet[1]";
}
